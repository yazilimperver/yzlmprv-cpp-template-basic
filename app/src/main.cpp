#include <iostream>
#include <string>

#include <spdlog/spdlog.h>

#include <function_lib.h>

int main(int argc, char** argv) {
    FunctionLib ff;
    
    if (2 == argc) {
        spdlog::info("{}\n", ff.FancyFunc(std::stoi(argv[1])));
    }
    else {
        spdlog::info("No input given. Assume 1453.\n{}\n", ff.FancyFunc(42));
    }
    return 0;
}