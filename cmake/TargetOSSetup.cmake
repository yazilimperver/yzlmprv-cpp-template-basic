set(TARGET_OS
    ""
    CACHE STRING "Target OS for compilation: Windows, Linux")

if(TARGET_OS STREQUAL "")
  message(STATUS "TARGET_OS was not set! Will detect automatically...")

  if(WIN32)
    set(TARGET_OS "Windows")
    set(CMAKE_DEBUG_POSTFIX "_windows_debug")
    set(CMAKE_RELEASE_POSTFIX "_windows_release")
  elseif(UNIX AND NOT APPLE)
    set(TARGET_OS "Linux")
    set(CMAKE_DEBUG_POSTFIX "_linux_debug")
    set(CMAKE_RELEASE_POSTFIX "_linux_release")
    set(CMAKE_STATIC_LIBRARY_PREFIX "")
  else()
    message(FATAL_ERROR "Couldn't detect TARGET_OS")
  endif()

  message(STATUS "TARGET_OS set automatically to: ${TARGET_OS}")
endif()

message(STATUS "TARGET_OS set to: ${TARGET_OS}")