// test_dice.cpp
#include <fstream>
#include <sstream>
#include <gtest/gtest.h>
#include "dice.h"

// Rest of your code...
class DiceTest : public ::testing::Test {
protected:
    void SetUp() override {
        // 设置测试用例的输入和预期输出文件
        inputFiles = {"input1.txt", "input2.txt"};
        expectedOutputFiles = {"expected_output1.txt", "expected_output2.txt"};
    }

    std::vector<std::string> inputFiles;
    std::vector<std::string> expectedOutputFiles;
};

TEST_F(DiceTest, ProcessFileTest) {
    for (size_t i = 0; i < inputFiles.size(); ++i) {
        std::string result = processFile(inputFiles[i]);

        // 从文件中读取预期输出数据
        std::ifstream expectedOutputFile(expectedOutputFiles[i]);
        ASSERT_TRUE(expectedOutputFile.is_open());
        std::stringstream buffer;
        buffer << expectedOutputFile.rdbuf();
        std::string expectedOutput = buffer.str();
        expectedOutputFile.close();

        ASSERT_EQ(result, expectedOutput);  // 比较实际输出和预期输出
    }
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}