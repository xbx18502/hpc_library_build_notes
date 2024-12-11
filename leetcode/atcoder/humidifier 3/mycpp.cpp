#include <cstdio>
#include <queue>
using namespace std;

const int MAXN = 1022;
int H, W, D;
int count = 0;
char office[MAXN][MAXN];
int dist[MAXN][MAXN];  // Combined visited/covered array
const int dx[4] = {0, 0, 1, -1};
const int dy[4] = {1, -1, 0, 0};

struct QNode {
    int x, y, steps;
    QNode(int _x, int _y, int _s) : x(_x), y(_y), steps(_s) {}
};

bool isValid(int x, int y) {
    return x >= 0 && x < H && y >= 0 && y < W;
}

void bfs(int startX, int startY) {
    queue<QNode> q;
    q.push(QNode(startX, startY, 0));
    if(dist[startX][startY] == 1e9) {
        count++;
    }
    dist[startX][startY] = 0;
    
    while (!q.empty()) {
        QNode current = q.front();
        q.pop();
        
        if (current.steps >= D) continue;
        
        for (int i = 0; i < 4; i++) {
            int nx = current.x + dx[i];
            int ny = current.y + dy[i];
            
            if (isValid(nx, ny) && office[nx][ny] == '.' && 
                dist[nx][ny] > current.steps + 1) {
                if(dist[nx][ny] == 1e9) {
                    count++;
                }
                dist[nx][ny] = current.steps + 1;
                q.push(QNode(nx, ny, current.steps + 1));
            }
        }
    }
}

signed main() {
    scanf("%d %d %d", &H, &W, &D);
    
    for(int i = 0; i < H; i++) {
        scanf("%s", office[i]);
    }
    
    // Initialize dist array
    for(int i = 0; i < H; i++)
        for(int j = 0; j < W; j++)
            dist[i][j] = 1e9;
    
    // Process each humidifier
    for(int i = 0; i < H; i++) {
        for(int j = 0; j < W; j++) {
            if (office[i][j] == 'H') {
                bfs(i, j);
            }
        }
    }
    
   
    
    printf("%d\n", count);
}

