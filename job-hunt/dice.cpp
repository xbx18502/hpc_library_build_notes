#include <bits/stdc++.h>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <unistd.h>
using namespace std;

struct pair_hash {
    template <class T1, class T2>
    std::size_t operator() (const std::pair<T1, T2>& p) const {
        auto h1 = std::hash<T1>{}(p.first);
        auto h2 = std::hash<T2>{}(p.second);
        return h1 ^ (h2 << 1);
    }
};

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

int oppositeDice(int a){
   if(a==1) return 6;
   else if(a==2) return 5;
   else if(a==3) return 4;
   else if(a==4) return 3;
   else if(a==5) return 2;
   else return 1;
}
int isReachDestination(queue<State> q0, int n, int m){
    if(q0.front().i==n &&q0.front().j==m){
        return 1;
    }
    else{
        return 0;
    }
    
}

bool isConflictWithGrid(const unordered_map<pair<int,int>, int, pair_hash>& grid, int i, int j, int up) {
    auto it = grid.find(make_pair(i, j));
    if (it != grid.end()) {
        return it->second == up;
    }
    return false;
}

int traverse(int n, int m, int q, const unordered_map<pair<int,int>, int, pair_hash> &grid) {
    State state0={0,0,1,2,3,4,5,6};
    queue<State> q0;
    int ans=0;
    q0.push(state0);
    while(!q0.empty()){
        int size = q0.size();
        while(size>0){
            if(isReachDestination(q0,n,m)==1){
            // cout<<ans-2<<endl;
            return ans-2;
        }
            State cur =q0.front();
            q0.pop();
            if(cur.i==0 &&cur.j==0){
                State goSouth = {cur.i+1,cur.j,cur.north,cur.up,cur.west,cur.east,cur.down,cur.south};
                State goEast = {cur.i,cur.j+1,cur.west,cur.south,cur.down,cur.up,cur.north,cur.east};
                if(goSouth.i<=n &&goSouth.j<=m &&isConflictWithGrid(grid,goSouth.i,goSouth.j,goSouth.up)==false){
                    q0.push(goSouth);
                }
               
                if(goEast.i<=n &&goEast.j<=m &&isConflictWithGrid(grid,goEast.i,goEast.j,goEast.up)==false){
                    q0.push(goEast);
                }
               

            }
            else if(cur.i==0){
                State goSouth = {cur.i+1,cur.j,cur.north,cur.up,cur.west,cur.east,cur.down,cur.south};
                State goEast = {cur.i,cur.j+1,cur.west,cur.south,cur.down,cur.up,cur.north,cur.east};
                State goWest = {cur.i,cur.j-1,cur.east,cur.south,cur.up,cur.down,cur.north,cur.west};
                if(goSouth.i<=n &&goSouth.j<=m &&isConflictWithGrid(grid,goSouth.i,goSouth.j,goSouth.up)==false){
                    q0.push(goSouth);
                }
               
                if(goEast.i<=n &&goEast.j<=m &&isConflictWithGrid(grid,goEast.i,goEast.j,goEast.up)==false){
                    q0.push(goEast);
                }
               
                if(goWest.i<=n &&goWest.j<=m &&isConflictWithGrid(grid,goWest.i,goWest.j,goWest.up)==false){
                    q0.push(goWest);
                }
                
            }
            else if(cur.j==0){
                State goSouth = {cur.i+1,cur.j,cur.north,cur.up,cur.west,cur.east,cur.down,cur.south};
                State goEast = {cur.i,cur.j+1,cur.west,cur.south,cur.down,cur.up,cur.north,cur.east};
                State goNorth = {cur.i-1,cur.j,cur.south,cur.down,cur.west,cur.east,cur.up,cur.north};
                if(goSouth.i<=n &&goSouth.j<=m &&isConflictWithGrid(grid,goSouth.i,goSouth.j,goSouth.up)==false){
                    q0.push(goSouth);
                }
                
                if(goEast.i<=n &&goEast.j<=m &&isConflictWithGrid(grid,goEast.i,goEast.j,goEast.up)==false){
                    q0.push(goEast);
                }
               
                if(goNorth.i<=n &&goNorth.j<=m &&isConflictWithGrid(grid,goNorth.i,goNorth.j,goNorth.up)==false){
                    q0.push(goNorth);
                }
                
            }
            else{
                State goSouth = {cur.i+1,cur.j,cur.north,cur.up,cur.west,cur.east,cur.down,cur.south};
                State goEast = {cur.i,cur.j+1,cur.west,cur.south,cur.down,cur.up,cur.north,cur.east};
                State goNorth = {cur.i-1,cur.j,cur.south,cur.down,cur.west,cur.east,cur.up,cur.north};
                State goWest = {cur.i,cur.j-1,cur.east,cur.south,cur.up,cur.down,cur.north,cur.west};
                if(goSouth.i<=n &&goSouth.j<=m &&isConflictWithGrid(grid,goSouth.i,goSouth.j,goSouth.up)==false){
                    q0.push(goSouth);
                }
                if(goEast.i<=n &&goEast.j<=m &&isConflictWithGrid(grid,goEast.i,goEast.j,goEast.up)==false){
                    q0.push(goEast);
                }
               
                if(goNorth.i<=n &&goNorth.j<=m &&isConflictWithGrid(grid,goNorth.i,goNorth.j,goNorth.up)==false){
                    q0.push(goNorth);
                }
               
                if(goWest.i<=n &&goWest.j<=m &&isConflictWithGrid(grid,goWest.i,goWest.j,goWest.up)==false){
                    q0.push(goWest);
                }
              
            }
            size--;
        }    
        ans++;
    }
    //cout<<"NO"<<endl;
    return -1;
}

string processFile(const string& filename){
    ifstream inputFile(filename);
    if (!inputFile.is_open()) {
        return "File cannot be opened";
    }

    int n, m, q;
    inputFile >> n >> m >> q;
    // vector<vector<int>> grid(q, vector<int>(3));
    unordered_map<pair<int,int>, int, pair_hash> grid;
    // for (int i = 0; i < q; ++i) {
    //     inputFile >> grid[i][0] >> grid[i][1] >> grid[i][2];
    // }
    int x, y, up;
    for (int i = 0; i < q; ++i) {
        inputFile >> x >> y >> up;
        grid[make_pair(x, y)] = up;
    }
    auto res = traverse(n, m, q, grid);
    if(res!=-1){
        return "YES\n"+to_string(res);
    }
    else{
        return "NO";
    }
}

// int main(){
//     // 打印当前工作目录
//     char cwd[1024];
//     if (getcwd(cwd, sizeof(cwd)) != NULL) {
//         cout << "Current working dir: " << cwd << endl;
//     } else {
//         perror("getcwd() error");
//     }
//     string result = processFile("input1.txt");
//     cout << result << endl;
//     return 0;
// }