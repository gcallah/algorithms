//
//  bubble_sort.h
//  Getting Started
//
//  Created by Xiaohang Su on 2/1/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef bubble_sort_h
#define bubble_sort_h
#include <vector>

template <typename T>
void swap(T& a, T& b) {
    T c = b;
    b = a;
    a = c;
}

template <typename comparable>
void bubble_sort(std::vector<comparable> & A) {
    for (int i = 0; i < A.size() - 1; i++) {
        for (int j = A.size() - 1; j >= i + 1; j--) {
            if (A[j] < A[j - 1]) {
                swap(A[j], A[j - 1]);
            }
        }
    }
}


#endif /* bubble_sort_h */
