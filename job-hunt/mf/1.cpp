#include <iostream>
#include <string>
#include <bits/stdc++.h>
using namespace std;
struct Point {
    int x, y;
    Point(int _x, int _y) : x(_x), y(_y) {}
};
vector<Point> processMove(vector<vector<char>>& grid, vector<Point>& positions, char direction) {
    int H = grid.size() - 1;  // Account for 1-based indexing
    int W = grid[0].size() - 1;
    
    if (direction == 'L') {
        // Process left to right
        for (int i = 1; i <= H && i < grid.size(); i++) {
            for (int j = 1; j <= W && j < grid[0].size(); j++) {
                if (isdigit(grid[i][j])) {
                    int digit = grid[i][j] - '0';
                    if (digit - 1 >= positions.size()) continue;  // Check positions array bounds
                    
                    int newJ = j;
                    while (newJ > 1 && newJ - 1 < grid[0].size() && 
                           grid[i][newJ-1] == '.') {
                        swap(grid[i][newJ], grid[i][newJ-1]);
                        newJ--;
                    }
                    positions[digit-1] = Point(i, newJ);
                }
            }
        }
    }
    else if (direction == 'R') {
        // Process right to left
        for (int i = 1; i <= H && i < grid.size(); i++) {
            for (int j = W; j >= 1 && j < grid[0].size(); j--) {
                if (isdigit(grid[i][j])) {
                    int digit = grid[i][j] - '0';
                    if (digit - 1 >= positions.size()) continue;  // Check positions array bounds
                    
                    int newJ = j;
                    while (newJ < W && newJ + 1 < grid[0].size() && 
                           grid[i][newJ+1] == '.') {
                        swap(grid[i][newJ], grid[i][newJ+1]);
                        newJ++;
                    }
                    positions[digit-1] = Point(i, newJ);
                }
            }
        }
    }
    else if (direction == 'U') {
        // Process top to bottom
        for (int j = 1; j <= W && j < grid[0].size(); j++) {
            for (int i = 1; i <= H && i < grid.size(); i++) {
                if (isdigit(grid[i][j])) {
                    int digit = grid[i][j] - '0';
                    if (digit - 1 >= positions.size()) continue;  // Check positions array bounds
                    
                    int newI = i;
                    while (newI > 1 && newI - 1 < grid.size() && 
                           grid[newI-1][j] == '.') {
                        swap(grid[newI][j], grid[newI-1][j]);
                        newI--;
                    }
                    positions[digit-1] = Point(newI, j);
                }
            }
        }
    }
    else if (direction == 'D') {
        // Process bottom to top
        for (int j = 1; j <= W && j < grid[0].size(); j++) {
            for (int i = H; i >= 1 && i < grid.size(); i--) {
                if (isdigit(grid[i][j])) {
                    int digit = grid[i][j] - '0';
                    if (digit - 1 >= positions.size()) continue;  // Check positions array bounds
                    
                    int newI = i;
                    while (newI < H && newI + 1 < grid.size() && 
                           grid[newI+1][j] == '.') {
                        swap(grid[newI][j], grid[newI+1][j]);
                        newI++;
                    }
                    positions[digit-1] = Point(newI, j);
                }
            }
        }
    }

    return positions;
}

int main(int argc, char *argv[]) {



  int H,W;
  cin>>H>>W;
  cout<<"H = "<<H<<", W="<<W<<endl;
  vector<vector<char>> a(H+1,vector<char>(W+1, '-'));
  for(int i=1;i<=H;i++){
    for(int j=1;j<=W;j++){
      cin>>a[i][j];
      cout<<a[i][j]<<" ";
    }
    cout<<endl;
  }
  int X;
  cin>>X;
  cout<<"X="<<X<<endl;
  vector<vector<int>> x(X,vector<int>(2,0));

  for(int i=0;i<X;i++){
    cin>>x[i][0]>>x[i][1];
    int c0=x[i][0];
    int c1 = x[i][1];
    a[c0][c1]='-';
    cout<<x[i][0]<<" "<<x[i][1]<<endl;
  }
  int N;
  cin>>N;
  cout<<"N="<<N<<endl;
  string S;
  cin>>S;
  cout<<"S="<<S<<endl;
  map<char, int> dx;
  dx['L']=0;
  dx['R']=0;
  dx['U']=-1;
  dx['D']=1;
  map<char, int> dy;
  dy['L']=-1;
  dy['R']=1;
  dy['U']=0;
  dy['D']=0;
  for(int i=1;i<=H;i++){
    for(int j=1;j<=W;j++){
      cout<<a[i][j]<<" ";
    }
    cout<<endl;
  }
      // Initialize positions
    vector<Point> positions(X, Point(0, 0));
    for(int i = 0; i < X; i++) {
        int c0 = x[i][0], c1 = x[i][1];
        positions[i] = Point(c0, c1);
    }
    
    // Process moves
    for(char dir : S) {
        positions = processMove(a, positions, dir);
    }
    
    // Print final positions in X order
    for(int i = 0; i < X; i++) {
        cout << positions[i].x << " " << positions[i].y << endl;
    }
  return 0;
}
