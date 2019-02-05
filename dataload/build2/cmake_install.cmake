# Install script for directory: /flush1/shi134/dataload

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/apps/torch/20180301")
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

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../../../flush1/shi134/dataload_build/lua/dataload" TYPE FILE FILES
    "/flush1/shi134/dataload/AsyncIterator.lua"
    "/flush1/shi134/dataload/DataLoader.lua"
    "/flush1/shi134/dataload/ImageClass.lua"
    "/flush1/shi134/dataload/ImageClassPairs.lua"
    "/flush1/shi134/dataload/MultiImageSequence.lua"
    "/flush1/shi134/dataload/MultiSequence.lua"
    "/flush1/shi134/dataload/SequenceLoader.lua"
    "/flush1/shi134/dataload/TensorLoader.lua"
    "/flush1/shi134/dataload/_env.lua"
    "/flush1/shi134/dataload/buildBigrams.lua"
    "/flush1/shi134/dataload/config.lua"
    "/flush1/shi134/dataload/init.lua"
    "/flush1/shi134/dataload/loadCIFAR10.lua"
    "/flush1/shi134/dataload/loadGBW.lua"
    "/flush1/shi134/dataload/loadImageNet.lua"
    "/flush1/shi134/dataload/loadMNIST.lua"
    "/flush1/shi134/dataload/loadPTB.lua"
    "/flush1/shi134/dataload/loadPairImages.lua"
    "/flush1/shi134/dataload/loadSentiment140.lua"
    "/flush1/shi134/dataload/preprocess.lua"
    "/flush1/shi134/dataload/test.lua"
    "/flush1/shi134/dataload/utils.lua"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/flush1/shi134/dataload/build2/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
