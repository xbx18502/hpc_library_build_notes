#include<bits/stdc++.h>
#define int long long
using namespace std;
const int N=1022;
void re(int &x){scanf("%lld",&x);}
void wr(int x){printf("%lld ",x);}
void cre(char ccc[]){scanf("%s",ccc+1);}
void cwr(char ccc[]){printf("%s",ccc+1);}
void enter(){putchar('\n');}
class node{
	public:
	
	int x,y;
};
int n,m,d,cnt,I,J;
int dx[4]={-1,0,1,0},dy[4]={0,1,0,-1},vis[N][N];
char g[N][N];
void bfs(int x,int y){
	queue <node> q;
	q.push({x,y});
	if(vis[x][y]==1e18) cnt++;
	vis[x][y]=0;
	while(!q.empty()){
		node t=q.front();q.pop();
		if(vis[t.x][t.y]==d) continue ;
		for(int i=0;i<4;i++){
			int xx=t.x+dx[i],yy=t.y+dy[i];
			if(xx>=1 && xx<=n && yy>=1 && yy<=m && g[xx][yy]=='.' && vis[xx][yy]>vis[t.x][t.y]+1){
				if(vis[xx][yy]==1e18) cnt++;
				vis[xx][yy]=vis[t.x][t.y]+1;
				q.push({xx,yy});
			}
		}
	}
}
signed main(){
	re(n),re(m),re(d);
	for(int i=1;i<=n;i++) cre(g[i]);
	for(int i=1;i<=n;i++)for(int j=1;j<=m;j++) vis[i][j]=1e18;
	for(int i=1;i<=n;i++){
		for(int j=1;j<=m;j++){
			if(g[i][j]=='H'){
				bfs(i,j);
			}
		}
	}
	wr(cnt);
}