//
//  randomized_algorithms.h
//  ProbabilisticAnalysis_RandomizedAlgorithms
//
//  Created by Xiaohang Su on 2/10/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef randomized_algorithms_h
#define randomized_algorithms_h

#include <vector>
#include <ctime>
#include <cstdlib>
#include <cmath>

struct sortType {
    int *sortKey;
    int val;
    sortType() {
        sortKey = NULL;
        val = NULL;
    }
    bool operator < (const sortType& t_sortType) const {
        return *sortKey < *(t_sortType.sortKey);
    }
};



int random(int lowBound, int upBound) {
    return rand() % (upBound - lowBound) + lowBound;
}

void permute_by_sorting(std::vector<int> &A) {
    int n = static_cast<int>(A.size());
    std::vector<sortType> P(n, sortType());
    for (int i = 0; i < n; i++) {
        P[i].sortKey = new int(random(1, pow(n, 3)));
        P[i].val = A[i];
    }
    sort(P.begin(), P.end()); // already sort A according P
    
    for (int i = 0; i < n; i++) {
        A[i] = P[i].val;
    }
}

template <typename T>
void randomize_in_place(std::vector<T>& vec) {
    int n = vec.size();
    for (int i = 0; i < n; i++) {
        
    }
}
#endif /* randomized_algorithms_h */
