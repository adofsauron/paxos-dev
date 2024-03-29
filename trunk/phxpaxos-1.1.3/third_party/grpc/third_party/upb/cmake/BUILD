# Copyright (c) 2009-2021, Google LLC
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Google LLC nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL Google LLC BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

load(
    ":build_defs.bzl",
    "generated_file_staleness_test",
)
load(
    "//bazel:build_defs.bzl",
    "make_shell_script",
)

licenses(["notice"])

exports_files(["staleness_test.py"])

py_library(
    name = "staleness_test_lib",
    testonly = 1,
    srcs = ["staleness_test_lib.py"],
)

py_binary(
    name = "make_cmakelists",
    srcs = ["make_cmakelists.py"],
)

genrule(
    name = "gen_cmakelists",
    srcs = [
        "//:BUILD",
        "//:WORKSPACE",
        "//:cmake_files",
        ":cmake_files",
    ],
    outs = ["generated-in/CMakeLists.txt"],
    cmd = "$(location :make_cmakelists) $@",
    tools = [":make_cmakelists"],
)

genrule(
    name = "copy_protos",
    srcs = ["//:descriptor_upb_proto"],
    outs = [
        "generated-in/google/protobuf/descriptor.upb.c",
        "generated-in/google/protobuf/descriptor.upb.h",
    ],
    cmd = "cp $(SRCS) $(@D)/generated-in/google/protobuf",
)

generated_file_staleness_test(
    name = "test_generated_files",
    outs = [
        "CMakeLists.txt",
        "google/protobuf/descriptor.upb.c",
        "google/protobuf/descriptor.upb.h",
    ],
    generated_pattern = "generated-in/%s",
)

# Test the CMake build #########################################################

filegroup(
    name = "cmake_files",
    srcs = glob([
        "**/*",
    ]),
)

make_shell_script(
    name = "gen_run_cmake_build",
    out = "run_cmake_build.sh",
    contents = "find . && mkdir build && cd build && cmake ../cmake && make -j8 && make test",
)

sh_test(
    name = "cmake_build",
    srcs = ["run_cmake_build.sh"],
    data = [
        ":cmake_files",
        "//:cmake_files",
    ],
    deps = ["@bazel_tools//tools/bash/runfiles"],
)
