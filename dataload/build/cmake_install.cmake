# Install script for directory: /home/shi134/dataload

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/shi134/torch/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/luarocks/rocks/dataload/scm-1/lua/dataload" TYPE FILE FILES
    "/home/shi134/dataload/AsyncIterator.lua"
    "/home/shi134/dataload/DataLoader.lua"
    "/home/shi134/dataload/ImageClass.lua"
    "/home/shi134/dataload/ImageClassPairs.lua"
    "/home/shi134/dataload/MultiImageSequence.lua"
    "/home/shi134/dataload/MultiSequence.lua"
    "/home/shi134/dataload/SequenceLoader.lua"
    "/home/shi134/dataload/TensorLoader.lua"
    "/home/shi134/dataload/_env.lua"
    "/home/shi134/dataload/buildBigrams.lua"
    "/home/shi134/dataload/config.lua"
    "/home/shi134/dataload/init.lua"
    "/home/shi134/dataload/loadCIFAR10.lua"
    "/home/shi134/dataload/loadGBW.lua"
    "/home/shi134/dataload/loadImageNet.lua"
    "/home/shi134/dataload/loadMNIST.lua"
    "/home/shi134/dataload/loadPTB.lua"
    "/home/shi134/dataload/loadPairImages.lua"
    "/home/shi134/dataload/loadSentiment140.lua"
    "/home/shi134/dataload/preprocess.lua"
    "/home/shi134/dataload/test.lua"
    "/home/shi134/dataload/utils.lua"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/shi134/dataload/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
