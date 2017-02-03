//
//  LCS.h
//  Dynamic Programming
//
//  Created by Xiaohang Su on 12/7/16.
//
//

#ifndef LCS_h
#define LCS_h
#include <string>
#include <vector>
#include <iostream>
using namespace std;
class LCS {
public:
    LCS() {
        
    }
    
    void LCS_Length(std::string X, std::string Y) {
        int m = X.size();
        int n = Y.size();
        b = vector<string>(m + 1, string(n + 1, ' '));
        c = vector<vector<int>>(m + 1, vector<int>(n + 1, INT_MAX));
        
        for (int i = 1; i <= m; i++) {
            c[i][0] = 0;
        }
        for (int j = 0; j <= n; j++) {
            c[0][j] = 0;
        }
        
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                if (X[i - 1] == Y[j - 1]) {
                    c[i][j] = c[i - 1][j - 1] + 1;
                    b[i][j] = 'q';
                } else if (c[i - 1][j] >= c[i][j - 1]) {
                    c[i][j] = c[i - 1][j];
                    b[i][j] = 'w';
                } else {
                    c[i][j] = c[i][j - 1];
                    b[i][j] = 'a';
                }
            }
        }
    }
    
    void print_LCS(vector<string> b, string X, int i, int j) {
        if (i == 0 || j == 0) return;
        if (b[i][j] == 'q') {
            print_LCS(b, X, i - 1, j - 1);
            cout << X[i - 1];
        } else if (b[i][j] == 'w'){
            print_LCS(b, X, i - 1, j);
        } else print_LCS(b, X, i, j - 1);
    }
    
    vector<vector<int>> c;
    vector<string> b;
};

#endif /* LCS_h */
