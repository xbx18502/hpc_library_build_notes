#include<bits/stdc++.h>
using namespace std;
struct s{int v,h,z,f;}b[200050];
int n,m,a[200050];
bool cmp1(s a,s b){return a.v>b.v;}
bool cmp2(s a,s b){return a.h<b.h;}
int main(){
	cin>>n>>m;
	for(int i=1;i<=n;i++) cin>>a[i];
	for(int i=1;i<=m;i++){b[i].h=i;cin>>b[i].v;}
	sort(b+1,b+m+1,cmp1);
	for(int i=1,j=1;i<=n;){
		if(b[j].v>=a[i]){
			b[j].z=i;
			b[j].f=1;
			j++;
		}else i++;
	}
	sort(b+1,b+m+1,cmp2);
	for(int i=1;i<=m;i++){
		if(b[i].f) cout<<b[i].z<<endl;
		else cout<<-1<<endl; 
	} 
	return 0;
}
