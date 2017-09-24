//
//  merge_sort.h
//  Getting Started
//
//  Created by Xiaohang Su on 2/1/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef merge_sort_h
#define merge_sort_h
#include <vector>
#include <climits>
#include <math.h>
#include <iostream>
template <typename comparable>
void merge(std::vector<comparable> &A, int p, int q, int r) {
    int n1 = q - p + 1;
    int n2 = r - q;
    std::vector<comparable> L(n1 + 1, 0);
    std::vector<comparable> R(n2 + 1, 0);

    for (int i = 0; i < n1; i++) {
        L[i] = A[p + i];
    }
    for (int j = 0; j < n2; j++) {
        R[j] = A[q + j + 1];
    }
    L[n1] = std::numeric_limits<comparable>::max();
    R[n2] = std::numeric_limits<comparable>::max();

    int i = 0;
    int j = 0;
    for (int k = p; k <= r; k++) {
        if (L[i] <= R[j]) {
            A[k] = L[i];
            i = i + 1;
        } else {
            A[k] = R[j];
            j = j + 1;
        }
    }

}

template <typename comparable>
void merge_sort(std::vector<comparable> &A, int p, int r) {

    if (p < r) {
        int q = floor((p + r) / 2);
        merge_sort(A, p, q);
        merge_sort(A, q + 1, r);
        merge(A, p, q, r);
    }
}
#endif /* merge_sort_h */
