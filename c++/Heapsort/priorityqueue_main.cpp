//
//  main.cpp
//  AlgorithmMuseum
//
//  Created by Xiaohang Su on 1/29/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#include <iostream>
#include "priority_queue.h"
#include "heapsort.h"
#include <limits>

int main(int argc, const char * argv[]) {
    int a[10] = {2, 6, 5, 3, 9, 0, 8, 1, 4, 7};
    std::vector<int> b(a, a + sizeof(a) / sizeof(a[0]));
    PriorityQueue<int> pq;
    pq.build_max_heap(b);
    pq.heap_extract_max(b);
    pq.max_heap_insert(b, 10, INT_MIN);
    return 0;
}
