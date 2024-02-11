set(TARGET_NAME cmake-template-lib)

include(GenerateExportHeader)

# TODO Buraya DLL/SO icin opsiyon
if(BUILD_SHARED_LIBS)
    message ("Building ${TARGET_NAME} as shared library!")
    add_library(${TARGET_NAME} SHARED "")
else()
    message ("Building ${TARGET_NAME} as static library!")
    add_library(${TARGET_NAME} STATIC "")
endif()

generate_export_header(${TARGET_NAME} EXPORT_FILE_NAME ${CMAKE_BINARY_DIR}/exports/${TARGET_NAME}_export.h)

set_target_properties( ${TARGET_NAME}
    PROPERTIES
        OUTPUT_NAME ${TARGET_NAME}_lib
        EXPORT_NAME ${TARGET_NAME}_lib
        CXX_EXTENSIONS OFF)

set_target_properties(${TARGET_NAME}
    PROPERTIES
        CXX_STANDARD 20
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
)
# IDE'lere kolaylik olmasi acisindan bu sekilde eklemekte fayda var
target_sources(${TARGET_NAME}
    PRIVATE
        "src/function_lib.cpp"
    PUBLIC
        "include/function_lib.h"
)

target_include_directories(${TARGET_NAME}
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/exports>
    include
  PRIVATE 
    src
)

target_link_libraries(${TARGET_NAME} PRIVATE spdlog::spdlog)