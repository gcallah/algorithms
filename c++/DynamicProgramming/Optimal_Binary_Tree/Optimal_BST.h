//
//  Optimal_BST.h
//  Dynamic Programming
//
//  Created by Xiaohang Su on 12/5/16.
//
//

#ifndef Optimal_BST_h
#define Optimal_BST_h
#include <vector>
#include <algorithm>
#include <limits.h>
#include <iostream>
using namespace std;

class Optimal_BST {
public:
    Optimal_BST(vector<double> p, vector<double> q) {
        //if (p.size() != q.size() - 1) return;
        n = p.size() - 1;
        e = vector<vector<double>>(n + 2, vector<double>(n + 2, INT_MAX));
        w = vector<vector<double>>(n + 2, vector<double>(n + 2, 0));
        root = vector<vector<double>>(n + 1, vector<double>(n + 1, 0));
        
        for (int i = 1; i <= n + 1; i++) {
            e[i][i - 1] = q[i - 1];
            w[i][i - 1] = q[i - 1];
        }
        
        for (int l = 1; l <= n; l++) {
            for (int i = 1; i <= n - l + 1; i++) {
                int j = i + l - 1;
                e[i][j] = INT_MAX;
                w[i][j] = w[i][j - 1] + p[j] + q[j];
                
                for (int r = i; r <= j; r++) {
                    double t = e[i][r - 1] + e[r + 1][j] + w[i][j];
                    if (t < e[i][j]) {
                        e[i][j] = t;
                        root[i][j] = r;
                    }
                }
            }
        }
    }
    
    int n = 0;
    vector<vector<double>> root;
    vector<vector<double>> e;
    vector<vector<double>> w;
};


#endif /* Optimal_BST_h */
