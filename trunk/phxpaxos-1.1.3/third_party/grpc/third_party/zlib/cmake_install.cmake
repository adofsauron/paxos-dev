# Install script for directory: /mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so.1.2.11"
      "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so.1"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so.1.2.11;/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so.1")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib" TYPE SHARED_LIBRARY FILES
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/libz.so.1.2.11"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/libz.so.1"
    )
  foreach(file
      "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so.1.2.11"
      "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so.1"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib" TYPE SHARED_LIBRARY FILES "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/libz.so")
  if(EXISTS "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib/libz.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/lib" TYPE STATIC_LIBRARY FILES "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/libz.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/include/zconf.h;/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/include/zlib.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/include" TYPE FILE FILES
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/zconf.h"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/zlib.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/share/man/man3/zlib.3")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/share/man/man3" TYPE FILE FILES "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/zlib.3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/share/pkgconfig/zlib.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/share/pkgconfig" TYPE FILE FILES "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/zlib/zlib.pc")
endif()

