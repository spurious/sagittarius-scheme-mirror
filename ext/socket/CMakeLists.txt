# Sagittarius extensions -*- CMake -*-
# 
# Build file for socket

IF(POSIX_EMULATOR)
  OPTION(USE_SCHANNEL "Using SChannel instead of OpenSSL" OFF)
ENDIF()

IF(WIN32 OR USE_SCHANNEL)
  SET(TLS_SOURCE tls_win.c)
ELSE()
  CHECK_INCLUDE_FILE(openssl/ssl.h HAVE_OPENSSL_H)
  FIND_PACKAGE(PkgConfig)
  PKG_CHECK_MODULES(PC_OPENSSL openssl)
  MESSAGE(STATUS "OpenSSL lib dir ${PC_OPENSSL_LIBDIR}")

  FIND_LIBRARY(SSL_LIBRARIES NAMES ssl
    HINTS ${PC_OPENSSL_LIBDIR} ${PC_OPENSSL_LIBRARY_DIRS})
  MESSAGE(STATUS "OpenSSL ssl lib: ${SSL_LIBRARIES}")
  
  FIND_LIBRARY(CRYPTO_LIBRARIES NAMES crypto
    HINTS ${PC_OPENSSL_LIBDIR} ${PC_OPENSSL_LIBRARY_DIRS})
  MESSAGE(STATUS "OpenSSL crypto lib: ${CRYPTO_LIBRARIES}")
  
  IF (HAVE_OPENSSL_H)
    SET(TLS_SOURCE tls_openssl.c)
    SET(TLS_LIBS ${SSL_LIBRARIES} ${CRYPTO_LIBRARIES})
  ELSEIF(APPLE)
    MESSAGE(STATUS "Trying to use homebrew version of OpenSSL")
    EXECUTE_PROCESS(COMMAND brew --prefix openssl
      OUTPUT_VARIABLE HOMWBREW_OPENSSL_DIR)
    STRING(STRIP ${HOMWBREW_OPENSSL_DIR} HOMWBREW_OPENSSL_DIR)
    MESSAGE(STATUS "Homebrew OpenSSL directory ${HOMWBREW_OPENSSL_DIR}")
    
    SET(HOMEBREW_OPENSSL_INCDIR ${HOMWBREW_OPENSSL_DIR}/include)
    SET(HOMEBREW_OPENSSL_LIBDIR ${HOMWBREW_OPENSSL_DIR}/lib)
        
    FIND_FILE(HAVE_HOMEBREW_OPENSSL_H openssl/ssl.h
      PATHS ${HOMEBREW_OPENSSL_INCDIR}
      HINTS ${HOMEBREW_OPENSSL_INCDIR})
  
    FIND_LIBRARY(HOMEBREW_SSL_LIBRARIES NAMES ssl
      HINTS ${HOMEBREW_OPENSSL_LIBDIR})
    MESSAGE(STATUS "Homebrew OpenSSL ssl lib: ${HOMEBREW_SSL_LIBRARIES}")
    FIND_LIBRARY(HOMEBREW_CRYPTO_LIBRARIES NAMES crypto
      HINTS ${HOMEBREW_OPENSSL_LIBDIR})
    MESSAGE(STATUS "Homebrew OpenSSL crypto lib: ${HOMEBREW_CRYPTO_LIBRARIES}")
    
    IF (HAVE_HOMEBREW_OPENSSL_H)
      SET(TLS_SOURCE tls_openssl.c)
      SET(TLS_LIBS ${HOMEBREW_SSL_LIBRARIES} ${HOMEBREW_CRYPTO_LIBRARIES})
      INCLUDE_DIRECTORIES(${HOMEBREW_OPENSSL_INCDIR})
    ELSE()
      MESSAGE(FATAL_ERROR "No SSL provider found. Please install OpenSSL")
    ENDIF()
    # reset
    SET(CMAKE_REQUIRED_INCLUDES ${tmp})
  ELSEIF (POSIX_EMULATOR)
    MESSAGE(STATUS "OpenSSL is not found, using SChannel.")
    MESSAGE(WARNING "On this platform, it's better to use OpenSSL, please consider to instsall it
")
    SET(TLS_SOURCE tls_win.c)
    SET(USE_SCHANNEL ON)
  ELSE()
    MESSAGE(FATAL_ERROR "No SSL provider found. Please install OpenSSL")
  ENDIF()
ENDIF()
SET(TLS_SOURCE ${TLS_SOURCE} tls-socket.c)

ADD_LIBRARY(sagittarius--socket SHARED
  sagittarius-socket.c
  ${CMAKE_CURRENT_BINARY_DIR}/socket_stub.c)
SET_TARGET_PROPERTIES(sagittarius--socket
  PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

ADD_LIBRARY(sagittarius--tls-socket MODULE
  ${TLS_SOURCE}
  ${CMAKE_CURRENT_BINARY_DIR}/tls_socket_stub.c)

ADD_FEATURE(socket)

IF (USE_CPP_FOR_BROKEN_LINKER)
  # ugly solution
  SET_SOURCE_FILES_PROPERTIES(sagittarius-socket.c 
    ${CMAKE_CURRENT_BINARY_DIR}/socket_stub.c
    ${CMAKE_CURRENT_BINARY_DIR}/tls_socket_stub.c
    ${TLS_SOURCE}
    PROPERTIES LANGUAGE CXX)
ENDIF()


INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/../addstub.cmake)
ADD_STUBS(sagittarius--socket
  COMMAND ${GENSTUB}
  FILES socket_stub.stub tls_socket_stub.stub
  OUTTREE)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})
SET_TARGET_PROPERTIES(sagittarius--socket PROPERTIES PREFIX "")
SET_TARGET_PROPERTIES(sagittarius--tls-socket PROPERTIES PREFIX "")
IF(APPLE)
  SET_TARGET_PROPERTIES(sagittarius--socket PROPERTIES SUFFIX ".dylib")
  SET_TARGET_PROPERTIES(sagittarius--tls-socket PROPERTIES SUFFIX ".dylib")
ENDIF()
TARGET_LINK_LIBRARIES(sagittarius--socket sagittarius)
TARGET_LINK_LIBRARIES(sagittarius--tls-socket sagittarius)
TARGET_LINK_LIBRARIES(sagittarius--tls-socket sagittarius--socket)

IF (TLS_LIBS)
  TARGET_LINK_LIBRARIES(sagittarius--tls-socket ${TLS_LIBS})
ENDIF()

IF (${SAGITTARIUS_OS} STREQUAL "qnx" OR ${SAGITTARIUS_OS} STREQUAL "sunos")
  TARGET_LINK_LIBRARIES(sagittarius--socket socket)
  TARGET_LINK_LIBRARIES(sagittarius--tls-socket socket)
ELSEIF (MINGW)
  TARGET_LINK_LIBRARIES(sagittarius--socket ws2_32)
ENDIF()

IF (MINGW OR USE_SCHANNEL)
  TARGET_LINK_LIBRARIES(sagittarius--tls-socket crypt32)
  TARGET_LINK_LIBRARIES(sagittarius--tls-socket secur32)
  TARGET_LINK_LIBRARIES(sagittarius--tls-socket ncrypt)
ENDIF()

INSTALL(TARGETS sagittarius--socket sagittarius--tls-socket
  DESTINATION ${SAGITTARIUS_DYNLIB_PATH})
INSTALL(FILES sagittarius/socket.scm sagittarius/tls-socket.scm
  DESTINATION ${SAGITTARIUS_SHARE_LIB_PATH}/sagittarius)
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/srfi
  DESTINATION ${SAGITTARIUS_SHARE_LIB_PATH})

IF (APPLE)
  INSTALL(CODE
    "EXECUTE_PROCESS(COMMAND install_name_tool -change
       \"sagittarius--socket.dylib\"
       \"${SAGITTARIUS_DYNLIB_PATH}/sagittarius--socket.dylib\"
       \"${SAGITTARIUS_DYNLIB_PATH}/sagittarius--tls-socket.dylib\")")
ENDIF()
# for test
FILE(APPEND ${EXT_TEST_RESOURCE_FILE} "${CMAKE_CURRENT_SOURCE_DIR}\n")
