#include<bits/stdc++.h>
using namespace std;
int N;
string s;
int main(){
  cin >> s;
  N = s.size();
  if(N%2!=0){
    cout<<"No"<<endl;
    return 0;
  }
  map<char ,int> m ;
  for(int i=0;i<N/2;i++){
    
    if(s[2*i+1]==s[2*i]&& !m[s[2*i]]){
      m[s[i]]+=2;
    }
    else{
      cout<<"No"<<endl;
      return 0;
    }
  }
  cout<<"Yes"<<endl;
  return 0;
}