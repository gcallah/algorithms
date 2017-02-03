//
//  Insertion_sort.h
//  Getting Started
//
//  Created by Xiaohang Su on 2/1/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef Insertion_sort_h
#define Insertion_sort_h
#include <vector>
template <typename comparable>
void insertion_sort(std::vector<comparable> &A) {
    for (int j = 1; j < A.size(); j++) {
        comparable key =  A[j];
        // Insert A[j] into the sorted sequence A[1 .. j - 1]
        int i = j - 1;
        while (i >= 0 && A[i] > key) {
            A[i + 1] = A[i];
            i = i - 1;
        }
        A[i + 1] = key;
    }
}
#endif /* Insertion_sort_h */
