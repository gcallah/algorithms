//
//  main.cpp
//  AlgorithmMuseum
//
//  Created by Xiaohang Su on 1/29/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#include <iostream>
#include "Heapsort.h"

int main(int argc, const char * argv[]) {
    int a[10] = {2, 6, 5, 3, 9, 0, 8, 1, 4, 7};
    std::vector<int> b(a, a + sizeof(a) / sizeof(a[0]));
    Heapsort<int> heaps;
    heaps.heapsort(b);
    return 0;
}
