#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <sstream>
#include <map>
#include <set>
#include <queue>
#include <stack>
#include <unordered_map>
#include <unordered_set>
using namespace std;

int main(int argc, char *argv[]) {
  // このコードは標準入力と標準出力を用いたサンプルコードです。
  // このコードは好きなように編集・削除してもらって構いません。
  // ---
  // This is a sample code to use stdin and stdout.
  // Edit and remove this code as you like.

  // string line;
  // int index = 1;
  // while (!cin.eof()) {
  //   getline(cin, line);
  //   cout << "line[" << index++ << "]:" << line << "\n";
  // }
  int m,n;
  const int maxn = 1e5+20;
  char a[26];
  char b[maxn];
  // read array
  string line;
  getline(cin, line);
  m = stoi(line);
  getline(cin, line);
  stringstream ss(line);
  int i = 0;
  while(ss >> a[i]) {
      i++;
  }
  getline(cin, line);
  n = stoi(line);
  getline(cin, line);
  stringstream ss1(line);
  i = 0;
  while(ss1 >> b[i]) {
      i++;
  }
  // cin >> m;
  // cout<<"m="<<m<<endl;
  // cin.ignore(); 
  // for(int i=0;i<m;i++){
  //   cin >> a[i];
  //   cout<< a[i]<<endl;
  // }
  // cin.ignore(); 
  // cin>>n;
  // cout<<"n = "<<n<<endl;
  // cin.ignore(); 
  // for(int i=0;i<n;i++){
  //   cin >> b[i];
  // }
  // if m is 0 , return
  if(m==0){
    return 0;
  }
  // sort 2 arrays by increasing order
  sort(a+0,a+m);
  sort(b+0,b+n);
  // cout<<"m ="<<m<<endl;
  // cout<<"n ="<<n<<endl;
  int p0=0,p1=0;
  int cnt=0;
  // use two pointer
  while(p0<m && p1<n){
    if(a[p0]<b[p1]){
      cout<<a[p0]<<":"<<cnt<<endl;
      cnt=0;
      p0++;
    }
    else if(a[p0]>b[p1]){
      // cout<<"error"<<endl;
      p1++;
    }
    else{
      cnt++;
      p1++;
      //cout<<"cnt ="<<cnt<<endl;
    }
  }
  // if p0 is not at end, print last character
  if(p0!=m){
    cout<<a[p0]<<":"<<cnt<<endl;
    p0++;
  }
  // print other character
  while(p0<m){
    cout<<a[p0]<<":"<<0<<endl;
    p0++;
  }
  return 0;
}
