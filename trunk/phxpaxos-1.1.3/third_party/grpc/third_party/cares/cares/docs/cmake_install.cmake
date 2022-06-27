# Install script for directory: /mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man3" TYPE FILE FILES
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_cancel.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_create_query.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_destroy.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_destroy_options.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_dup.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_expand_name.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_expand_string.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_fds.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_free_data.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_free_hostent.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_free_string.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_freeaddrinfo.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_get_servers.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_get_servers_ports.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_getaddrinfo.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_gethostbyaddr.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_gethostbyname.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_gethostbyname_file.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_getnameinfo.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_getsock.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_inet_ntop.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_inet_pton.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_init.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_init_options.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_library_cleanup.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_library_init.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_library_init_android.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_library_initialized.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_mkquery.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_a_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_aaaa_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_caa_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_mx_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_naptr_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_ns_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_ptr_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_soa_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_srv_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_parse_txt_reply.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_process.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_query.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_save_options.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_search.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_send.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_local_dev.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_local_ip4.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_local_ip6.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_servers.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_servers_csv.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_servers_ports.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_servers_ports_csv.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_socket_callback.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_socket_configure_callback.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_socket_functions.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_set_sortlist.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_strerror.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_timeout.3"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ares_version.3"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xToolsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/acountry.1"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/adig.1"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/ahost.1"
    )
endif()
