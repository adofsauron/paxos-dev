/*
 *
 * Copyright 2017 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#include <stdio.h>
#include <string.h>

#include <grpc/byte_buffer.h>
#include <grpc/grpc.h>
#include <grpc/support/alloc.h>
#include <grpc/support/log.h>
#include <grpc/support/string_util.h>
#include <grpc/support/time.h>

#include "src/core/lib/channel/channel_args.h"
#include "src/core/lib/gpr/string.h"
#include "src/core/lib/gpr/useful.h"
#include "src/core/lib/iomgr/exec_ctx.h"
#include "test/core/end2end/cq_verifier.h"
#include "test/core/end2end/end2end_tests.h"
#include "test/core/end2end/tests/cancel_test_helpers.h"

static void* tag(intptr_t t) { return reinterpret_cast<void*>(t); }

static grpc_end2end_test_fixture begin_test(grpc_end2end_test_config config,
                                            const char* test_name,
                                            grpc_channel_args* client_args,
                                            grpc_channel_args* server_args) {
  grpc_end2end_test_fixture f;
  gpr_log(GPR_INFO, "Running test: %s/%s", test_name, config.name);
  f = config.create_fixture(client_args, server_args);
  config.init_server(&f, server_args);
  config.init_client(&f, client_args);
  return f;
}

static gpr_timespec n_seconds_from_now(int n) {
  return grpc_timeout_seconds_to_deadline(n);
}

static gpr_timespec five_seconds_from_now(void) {
  return n_seconds_from_now(5);
}

static void drain_cq(grpc_completion_queue* cq) {
  grpc_event ev;
  do {
    ev = grpc_completion_queue_next(cq, five_seconds_from_now(), nullptr);
  } while (ev.type != GRPC_QUEUE_SHUTDOWN);
}

static void shutdown_server(grpc_end2end_test_fixture* f) {
  if (!f->server) return;
  grpc_server_shutdown_and_notify(f->server, f->shutdown_cq, tag(1000));
  GPR_ASSERT(grpc_completion_queue_pluck(f->shutdown_cq, tag(1000),
                                         grpc_timeout_seconds_to_deadline(5),
                                         nullptr)
                 .type == GRPC_OP_COMPLETE);
  grpc_server_destroy(f->server);
  f->server = nullptr;
}

static void shutdown_client(grpc_end2end_test_fixture* f) {
  if (!f->client) return;
  grpc_channel_destroy(f->client);
  f->client = nullptr;
}

static void end_test(grpc_end2end_test_fixture* f) {
  shutdown_server(f);
  shutdown_client(f);

  grpc_completion_queue_shutdown(f->cq);
  drain_cq(f->cq);
  grpc_completion_queue_destroy(f->cq);
  grpc_completion_queue_destroy(f->shutdown_cq);
}

// Tests that we honor server push-back delay.
// - 2 retries allowed for ABORTED status
// - first attempt gets ABORTED with a long delay
// - second attempt succeeds
static void test_retry_server_pushback_delay(grpc_end2end_test_config config) {
  grpc_call* c;
  grpc_call* s;
  grpc_op ops[6];
  grpc_op* op;
  grpc_metadata_array initial_metadata_recv;
  grpc_metadata_array trailing_metadata_recv;
  grpc_metadata_array request_metadata_recv;
  grpc_call_details call_details;
  grpc_slice request_payload_slice = grpc_slice_from_static_string("foo");
  grpc_slice response_payload_slice = grpc_slice_from_static_string("bar");
  grpc_byte_buffer* request_payload =
      grpc_raw_byte_buffer_create(&request_payload_slice, 1);
  grpc_byte_buffer* response_payload =
      grpc_raw_byte_buffer_create(&response_payload_slice, 1);
  grpc_byte_buffer* request_payload_recv = nullptr;
  grpc_byte_buffer* response_payload_recv = nullptr;
  grpc_status_code status;
  grpc_call_error error;
  grpc_slice details;
  int was_cancelled = 2;
  char* peer;

  grpc_metadata pushback_md;
  memset(&pushback_md, 0, sizeof(pushback_md));
  pushback_md.key = grpc_slice_from_static_string("grpc-retry-pushback-ms");
  pushback_md.value = grpc_slice_from_static_string("2000");

  grpc_arg args[] = {
      grpc_channel_arg_string_create(
          const_cast<char*>(GRPC_ARG_SERVICE_CONFIG),
          const_cast<char*>(
              "{\n"
              "  \"methodConfig\": [ {\n"
              "    \"name\": [\n"
              "      { \"service\": \"service\", \"method\": \"method\" }\n"
              "    ],\n"
              "    \"retryPolicy\": {\n"
              "      \"maxAttempts\": 3,\n"
              "      \"initialBackoff\": \"1s\",\n"
              "      \"maxBackoff\": \"120s\",\n"
              "      \"backoffMultiplier\": 1.6,\n"
              "      \"retryableStatusCodes\": [ \"ABORTED\" ]\n"
              "    }\n"
              "  } ]\n"
              "}")),
  };
  grpc_channel_args client_args = {GPR_ARRAY_SIZE(args), args};
  grpc_end2end_test_fixture f =
      begin_test(config, "retry_server_pushback_delay", &client_args, nullptr);

  cq_verifier* cqv = cq_verifier_create(f.cq);

  gpr_timespec deadline = five_seconds_from_now();
  c = grpc_channel_create_call(f.client, nullptr, GRPC_PROPAGATE_DEFAULTS, f.cq,
                               grpc_slice_from_static_string("/service/method"),
                               nullptr, deadline, nullptr);
  GPR_ASSERT(c);

  peer = grpc_call_get_peer(c);
  GPR_ASSERT(peer != nullptr);
  gpr_log(GPR_DEBUG, "client_peer_before_call=%s", peer);
  gpr_free(peer);

  grpc_metadata_array_init(&initial_metadata_recv);
  grpc_metadata_array_init(&trailing_metadata_recv);
  grpc_metadata_array_init(&request_metadata_recv);
  grpc_call_details_init(&call_details);
  grpc_slice status_details1 = grpc_slice_from_static_string("message1");
  grpc_slice status_details2 = grpc_slice_from_static_string("message2");

  memset(ops, 0, sizeof(ops));
  op = ops;
  op->op = GRPC_OP_SEND_INITIAL_METADATA;
  op->data.send_initial_metadata.count = 0;
  op++;
  op->op = GRPC_OP_SEND_MESSAGE;
  op->data.send_message.send_message = request_payload;
  op++;
  op->op = GRPC_OP_RECV_MESSAGE;
  op->data.recv_message.recv_message = &response_payload_recv;
  op++;
  op->op = GRPC_OP_SEND_CLOSE_FROM_CLIENT;
  op++;
  op->op = GRPC_OP_RECV_INITIAL_METADATA;
  op->data.recv_initial_metadata.recv_initial_metadata = &initial_metadata_recv;
  op++;
  op->op = GRPC_OP_RECV_STATUS_ON_CLIENT;
  op->data.recv_status_on_client.trailing_metadata = &trailing_metadata_recv;
  op->data.recv_status_on_client.status = &status;
  op->data.recv_status_on_client.status_details = &details;
  op++;
  error = grpc_call_start_batch(c, ops, static_cast<size_t>(op - ops), tag(1),
                                nullptr);
  GPR_ASSERT(GRPC_CALL_OK == error);

  error =
      grpc_server_request_call(f.server, &s, &call_details,
                               &request_metadata_recv, f.cq, f.cq, tag(101));
  GPR_ASSERT(GRPC_CALL_OK == error);
  CQ_EXPECT_COMPLETION(cqv, tag(101), true);
  cq_verify(cqv);

  peer = grpc_call_get_peer(s);
  GPR_ASSERT(peer != nullptr);
  gpr_log(GPR_DEBUG, "server_peer=%s", peer);
  gpr_free(peer);
  peer = grpc_call_get_peer(c);
  GPR_ASSERT(peer != nullptr);
  gpr_log(GPR_DEBUG, "client_peer=%s", peer);
  gpr_free(peer);

  memset(ops, 0, sizeof(ops));
  op = ops;
  op->op = GRPC_OP_SEND_INITIAL_METADATA;
  op->data.send_initial_metadata.count = 0;
  op++;
  op->op = GRPC_OP_SEND_STATUS_FROM_SERVER;
  op->data.send_status_from_server.trailing_metadata_count = 1;
  op->data.send_status_from_server.trailing_metadata = &pushback_md;
  op->data.send_status_from_server.status = GRPC_STATUS_ABORTED;
  op->data.send_status_from_server.status_details = &status_details1;
  op++;
  op->op = GRPC_OP_RECV_CLOSE_ON_SERVER;
  op->data.recv_close_on_server.cancelled = &was_cancelled;
  op++;
  error = grpc_call_start_batch(s, ops, static_cast<size_t>(op - ops), tag(102),
                                nullptr);
  GPR_ASSERT(GRPC_CALL_OK == error);

  CQ_EXPECT_COMPLETION(cqv, tag(102), true);
  cq_verify(cqv);

  gpr_timespec before_retry = gpr_now(GPR_CLOCK_MONOTONIC);

  grpc_call_unref(s);
  grpc_metadata_array_destroy(&request_metadata_recv);
  grpc_metadata_array_init(&request_metadata_recv);
  grpc_call_details_destroy(&call_details);
  grpc_call_details_init(&call_details);

  error =
      grpc_server_request_call(f.server, &s, &call_details,
                               &request_metadata_recv, f.cq, f.cq, tag(201));
  GPR_ASSERT(GRPC_CALL_OK == error);
  CQ_EXPECT_COMPLETION(cqv, tag(201), true);
  cq_verify(cqv);

  gpr_timespec after_retry = gpr_now(GPR_CLOCK_MONOTONIC);
  gpr_timespec retry_delay = gpr_time_sub(after_retry, before_retry);
  // Configured back-off was 1 second, server push-back said 2 seconds.
  // To avoid flakiness, we allow some fudge factor here.
  gpr_log(GPR_INFO, "retry delay was {.tv_sec=%" PRId64 ", .tv_nsec=%d}",
          retry_delay.tv_sec, retry_delay.tv_nsec);
  GPR_ASSERT(retry_delay.tv_sec >= 1);
  if (retry_delay.tv_sec == 1) {
    GPR_ASSERT(retry_delay.tv_nsec >= 800000000);
  }

  peer = grpc_call_get_peer(s);
  GPR_ASSERT(peer != nullptr);
  gpr_log(GPR_DEBUG, "server_peer=%s", peer);
  gpr_free(peer);
  peer = grpc_call_get_peer(c);
  GPR_ASSERT(peer != nullptr);
  gpr_log(GPR_DEBUG, "client_peer=%s", peer);
  gpr_free(peer);

  memset(ops, 0, sizeof(ops));
  op = ops;
  op->op = GRPC_OP_SEND_INITIAL_METADATA;
  op->data.send_initial_metadata.count = 0;
  op++;
  op->op = GRPC_OP_SEND_STATUS_FROM_SERVER;
  op->data.send_status_from_server.trailing_metadata_count = 0;
  op->data.send_status_from_server.status = GRPC_STATUS_OK;
  op->data.send_status_from_server.status_details = &status_details2;
  op++;
  op->op = GRPC_OP_RECV_CLOSE_ON_SERVER;
  op->data.recv_close_on_server.cancelled = &was_cancelled;
  op++;
  error = grpc_call_start_batch(s, ops, static_cast<size_t>(op - ops), tag(202),
                                nullptr);
  GPR_ASSERT(GRPC_CALL_OK == error);

  CQ_EXPECT_COMPLETION(cqv, tag(202), true);
  CQ_EXPECT_COMPLETION(cqv, tag(1), true);
  cq_verify(cqv);

  GPR_ASSERT(status == GRPC_STATUS_OK);
  GPR_ASSERT(0 == grpc_slice_str_cmp(details, "message2"));
  GPR_ASSERT(0 == grpc_slice_str_cmp(call_details.method, "/service/method"));
  GPR_ASSERT(0 == call_details.flags);
  GPR_ASSERT(was_cancelled == 0);

  grpc_slice_unref(details);
  grpc_metadata_array_destroy(&initial_metadata_recv);
  grpc_metadata_array_destroy(&trailing_metadata_recv);
  grpc_metadata_array_destroy(&request_metadata_recv);
  grpc_call_details_destroy(&call_details);
  grpc_byte_buffer_destroy(request_payload);
  grpc_byte_buffer_destroy(response_payload);
  grpc_byte_buffer_destroy(request_payload_recv);
  grpc_byte_buffer_destroy(response_payload_recv);

  grpc_call_unref(c);
  grpc_call_unref(s);

  cq_verifier_destroy(cqv);

  end_test(&f);
  config.tear_down_data(&f);
}

void retry_server_pushback_delay(grpc_end2end_test_config config) {
  GPR_ASSERT(config.feature_mask & FEATURE_MASK_SUPPORTS_CLIENT_CHANNEL);
  test_retry_server_pushback_delay(config);
}

void retry_server_pushback_delay_pre_init(void) {}
