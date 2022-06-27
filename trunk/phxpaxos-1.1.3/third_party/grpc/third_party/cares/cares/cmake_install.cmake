# Install script for directory: /mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/c-ares/c-ares-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/c-ares/c-ares-targets.cmake"
         "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/CMakeFiles/Export/lib64/cmake/c-ares/c-ares-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/c-ares/c-ares-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/c-ares/c-ares-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/c-ares" TYPE FILE FILES "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/CMakeFiles/Export/lib64/cmake/c-ares/c-ares-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/c-ares" TYPE FILE FILES "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/CMakeFiles/Export/lib64/cmake/c-ares/c-ares-targets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/c-ares" TYPE FILE FILES
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/c-ares-config.cmake"
    "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/c-ares-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/pkgconfig" TYPE FILE FILES "/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/libcares.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/include/cmake_install.cmake")
  include("/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/src/cmake_install.cmake")
  include("/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3/third_party/grpc/third_party/cares/cares/docs/cmake_install.cmake")

endif()
