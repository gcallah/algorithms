//
//  Quicksort.h
//  Quicksort
//
//  Created by Xiaohang Su on 2/21/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef Quicksort_h
#define Quicksort_h

#include <vector>
#include <algorithm>

template <typename T>
int partition(std::vector<T>& A, int p, int r) {
    T x = A[r];
    int i = p - 1;
    for(int j = p; j <= r - 1; j++) {
        if (A[j] <= x) {
            i = i + 1;
            std::swap(A[i], A[j]);
        }
    }
    std::swap(A[i + 1], A[r]);
    return i + 1;
}

template <typename T>
void quicksort(std::vector<T>& A, int p, int r) {
    if (p < r) {
        int q = partition(A, p, r);
        quicksort(A, p, q - 1);
        quicksort(A, q + 1, r);
    }
}

template <typename T>
int randomized_partition(std::vector<T>& A, int p, int r) {
    int i = (rand() % (r - p)) + p;
    std::swap(A[r], A[i]);
    return partition(A, p, r);
}

template <typename T>
void randomized_quicksort(std::vector<T>& A, int p, int r) {
    if (p < r) {
        int q = randomized_partition(A, p, r);
        randomized_quicksort(A, p, q - 1);
        randomized_quicksort(A, q + 1, r);
    }
}


#endif /* Quicksort_h */
