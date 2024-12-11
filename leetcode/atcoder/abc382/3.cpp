#include <bits/stdc++.h>
using namespace std;
#define int long long 
#define rep(i ,a ,b) for(int i =a;i<=b;++i)
#define endl '\n'
#define debug(a) cout<<#a<<'='<<a<<endl;
#define inf 0x3f3f3f3f
#define ls u<<1
#define rs u<<1|1
typedef pair<int,int> pii;
/*
    找11223344 
    如果每次都先枚举左端点， On^2
    假设l对应的最远的右端点是 f(l) , 那么如果 l_1 < l_2 -> f(l_1) <= f(l_2)
    因此可以使用双指针， 维护上一个l2对应的 f(l2) ，当计算当前的l的时候 ，直接从f(l2)开始拓展  复杂度 On
*/
const int N = 2e5+9;
int a[N];
int n;
int cnt[N];
int calc(int x){   
    for(int i =0;i<N;++i)cnt[i] = 0;
    int r = x;
    int res = 0;
    for(int i =x;i<=n;i+=2){
        r = max(r , i);
        //cout<<a[r]<<' '<<a[r+1]<<endl;
        while(a[r] == a[r+1] && cnt[a[r]] == 0 &&r+1<=n){
            cnt[a[r]] += 2;
            r +=2;
        }
        
        res = max(res , r-i);
        if(r >=i+2)cnt[a[i]] -=2;
    }
    return res;

}

void solve(){
    cin>>n;
    rep(i ,1 ,n)cin>>a[i];
    int r = 1;
    int ans1 = calc(1);
    int ans2 = calc(2);
    int ans = max(ans1 , ans2);
    cout<< ans<<endl;
}
 
 
signed main(){
    ios::sync_with_stdio(false);
    cout.tie(0);
    cin.tie(0);
    int _ = 1;
    //cin>>_; 
    while(_--)solve();
    return 0;
}