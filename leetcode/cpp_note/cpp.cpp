vector<> a;

vector<vector<int>> b;

a.push_back();

a.pop_back();


unordered_map<int, int> c;

unordered_set<int> d;

c.insert({1, 2});

c.erase(1);

c.find(1);

d.insert(1);

d.erase(1);

d.find(1);


vector<pair<int,int>>  s;
// how to define a sort function
sort(s.begin(), s.end(), [](pair<int,int> a, pair<int,int> b) {
    return a.first < b.first;
});

// another way to define a sort function
sort(s.begin(), s.end(), compare);

bool compare(pair<int,int> a, pair<int,int> b) {
    return a.first < b.first;
}



