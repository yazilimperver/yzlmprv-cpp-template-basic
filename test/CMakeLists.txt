set(TEST_TARGET_NAME cmake-template-test)

# https://google.github.io/googletest/quickstart-cmake.html'de detaylar mevcut
include(FetchContent)

FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.13.0.zip
)
FetchContent_MakeAvailable(googletest)

# For Windows: Prevent overriding the parent project's compiler/linker settings.
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Testleri aktiflestirelim
enable_testing()

# Test projesi
add_executable(${TEST_TARGET_NAME} "src/test_function_lib.cpp")

# GoogleTest icin en az C++14
target_compile_features(${TEST_TARGET_NAME} PUBLIC cxx_std_11)

target_link_libraries(${TEST_TARGET_NAME} 
    GTest::gtest_main 
    cmake-template-lib
)

include(GoogleTest)
gtest_discover_tests(${TEST_TARGET_NAME})