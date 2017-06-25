// In here we use -1 represents empty slot in vector

// Direct Address
#include <utility>
#include <vector>
using namespace std;

int direct_address_search(vector<int> T, int k) {
    return T[k];
}

void direct_address_insert(vector<int> T, pair<int, int> x) {
    T[x.first] = x.second;
}

void direct_address_delete(vector<int> T, pair<int, int> x) {
    T[x.first] = -1;
}

// Open Addressing
// Hash function will hash value return key
int hash_function(int index) {
    return index % 101;
}

int hash_insert(vector<int> T, int k) {
    int i = 0;
    int j = 0;
    do {
        j = hash_function(k + i);
        if (j == -1) {
            T[j] = k;
            return j;
        }
    } while(i == T.size());
    return -1;
}

int hash_search(vector<int> T, int k) {
    int i = 0;
    int j = 0;
    do {
        j = hash_function(k + i);
        if (T[j] == k) {
            return j;
        }
        i = i + 1; // linear probing
    } while(T[j] == -1 || i == T.size());
    return -1;
}