//
//  Rod_cutting.h
//  Dynamic Programming
//
//  Created by Xiaohang Su on 12/3/16.
//
//

#ifndef Rod_cutting_h
#define Rod_cutting_h
#include <stdlib.h>
#include <time.h>
#include <vector>
#include <iostream>
#include <limits.h>
#include <algorithm>
#include <utility>

int RANGE = 10; // price addon 0 - 10
class Rod_cutting {
public:
    Rod_cutting(int n) : length(n) {
        generatePrice();
        std::cout << "Price randomly generate: " << std::endl;
        printVector(price);
    }
    
    int recursive_cut_rod(std::vector<int> &p, int n) {
        if (n == 0) return 0;
        int q = INT_MIN;
        for (int i = 0; i < n; i++) {
            q = std::max(q, p[i] + recursive_cut_rod(p, n - i - 1));
        }
        return q;
    }
    
    int memorized_cut_rod(std::vector<int>& p, int n) {
        std::vector<int> r(n + 1, INT_MIN);
        return memorized_cut_rod_aux(p, n, r);
    }
    
    int bottom_up_cut_rod(std::vector<int>& p, int n) {
        std::vector<int> r(n + 1, 0);
        
        for (int i = 1; i <= n; i++) {
            int q = INT_MIN;
            for (int j = 0; j < i; j++) {
                q = std::max(q, p[j] + r[i - j - 1]);
            }
            r[i] = q;
        }
        
        return r[n];
    }
    
    std::pair<std::vector<int>, std::vector<int>> extended_bottom_up_cut_rod(std::vector<int> &p, int n) {
        std::vector<int> r(n + 1, 0);
        std::vector<int> s(n + 1, 0);
        r[0] = 0;
        for (int i = 1; i <= n; i++) {
            int q = INT_MIN;
            for (int j = 0; j < i; j++) {
                if (q < p[j] + r[i - j - 1]) {
                    q = p[j] + r[i - j - 1];
                    s[i] = j + 1;
                }
            }
            r[i] = q;
        }
        return std::make_pair(r, s);
    }
    
    void print_cut_rod_solution(std::vector<int> &p, int n) {
        std::pair<std::vector<int>, std::vector<int>> pa =extended_bottom_up_cut_rod(p, n);
        while (n > 0) {
            std::cout << pa.second[n] << " ";
            n = n - pa.second[n];
        }
    }
    
    int length;
    std::vector<int> price;
private:
    
    void generatePrice() {
        srand(time(NULL));
        int lastPrice = 0;
        for (int i = 0; i < length; i++) {
            lastPrice += rand() % RANGE + 1;
            price.push_back(lastPrice);
        }
    }
    
    void printVector(std::vector<int> &vec) {
        std::cout << "[ ";
        for (int i = 0; i < vec.size(); i++) {
            std::cout << vec[i] << " ";
        }
        std::cout << "]" << std::endl;
    }
    
    int memorized_cut_rod_aux(std::vector<int> &p, int n, std::vector<int> &r) {
        if (r[n] >= 0) {
            return r[n];
        }
        int q;
        if (n == 0) {
            q = 0;
        } else {
            q = INT_MIN;
            for (int i = 1; i <= n; i++) {
                q = std::max(q, p[i - 1] + memorized_cut_rod_aux(p, n - i, r));
            }
        }
        r[n] = q;
        return q;
    }
};

#endif /* Rod_cutting_h */
