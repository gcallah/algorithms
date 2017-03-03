//
//  priority_queue.h
//  AlgorithmMuseum
//
//  Created by Xiaohang Su on 1/29/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef priority_queue_h
#define priority_queue_h
#include <iostream>
#include <vector>
#include "Heapsort.h"

template <typename comparable> class priority_queue : public Heapsort<comparable> {
public:
    comparable heap_maximum(const std::vector<comparable> &A) {
        return A[0];
    }
    
    comparable heap_extract_max(std::vector<comparable> &A) {        int heapSize = A.size();
        if (heapSize < 1) {
            std::cout << "Error: Heap underflow!" << std::endl;
        }
        int maxNum = A[0];
        A[0] = A[heapSize - 1];
        heapSize = heapSize - 1;
        A.pop_back();
        this->max_heapify(A, 0);
        return maxNum;
    }
    
    void heap_increase_key(std::vector<comparable> &A, int i, const comparable& key) {
        if (key < A[i]) {
            std::cout << "Error: New key " << key << "is smaller than current key " << A[i] << std::endl;
        }
        A[i] = key;
        while (i > 0 && A[this->PARENT(i)] < A[i]) {
            this->swap(A[i], A[this->PARENT(i)]);
            i = this->PARENT(i);
        }
    }
    
    // pass min value of comparable type
    // use for compare
    void max_heap_insert(std::vector<comparable> &A, const comparable& key, const comparable& COMPARABLE_MIN) {
        int heapSize = A.size();
        heapSize++;
        A.push_back(COMPARABLE_MIN);
        heap_increase_key(A, heapSize - 1, key);
    }
private:
    
};

#endif /* priority_queue_h */
