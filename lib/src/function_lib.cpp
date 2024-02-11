#include <function_lib.h>

std::string FunctionLib::FancyFunc(int scale) const {
    return "Fancy function string with scale: " + std::to_string(scale);
}