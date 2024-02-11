#include <gtest/gtest.h>
#include <function_lib.h>

TEST(Function_Lib, BasicAssertions) {
  auto ff = FunctionLib();
  EXPECT_STREQ(ff.FancyFunc(666).c_str(), "Fancy function string with scale: 666");
}