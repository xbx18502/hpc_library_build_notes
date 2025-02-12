// you can use includes, for example:
// #include <algorithm>

// you can write to stdout for debugging purposes, e.g.
// cout << "this is a debug message" << endl;
#include <string>
using namespace std;
#define int long long

signed solution(string &S) {
    if (S == "0") return 0;
    
    int operations = 0;
    int n = S.length();
    bool inOnesGroup = false;
    
    for (int i = n - 1; i >= 0; i--) {
        operations++; // divide operation for each bit
        
        if (S[i] == '1') {
            if (!inOnesGroup) {
                operations++; // add subtract operation for new group of 1s
                inOnesGroup = true;
            }
        } else {
            inOnesGroup = false;
        }
    }
    
    return operations;
}
