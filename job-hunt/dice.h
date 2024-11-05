// dice.h
#ifndef DICE_H
#define DICE_H

#include <string>
#include <vector>
#include <queue>

struct State {
    int i;
    int j;
    int up;
    int south;
    int west;
    int east;
    int north;
    int down;
};

int oppositeDice(int a);
int isReachDestination(const std::queue<State>& q0, int n, int m);
bool isConflictWithGrid(const std::vector<std::vector<int>>& grid, int i, int j, int up);
std::string processFile(const std::string& filename);

#endif // DICE_H