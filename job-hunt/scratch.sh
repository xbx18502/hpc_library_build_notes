g++ dice.cpp -o dice

g++ -std=c++14 \
  -I/home/pj24001791/ku40000464/googleTest/gtest-install-path/include \
  -pthread test_dice.cpp dice.cpp \
  -L/home/pj24001791/ku40000464/googleTest/gtest-install-path/lib64 \
  -lgtest -lgtest_main -o test_dice