set(TARGET_NAME cmake-template-app)

add_executable(${TARGET_NAME} "")

set_target_properties(${TARGET_NAME}
    PROPERTIES
        CXX_STANDARD 20
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
)

target_sources(${TARGET_NAME} PRIVATE
    "src/main.cpp"
)

target_link_libraries(${TARGET_NAME}
    PRIVATE cmake-template-lib spdlog::spdlog
)