//
//  main.cpp
//  Getting Started
//
//  Created by Xiaohang Su on 2/1/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#include <iostream>
#include "insertion_sort.h"
#include "merge_sort.h"
#include "bubble_sort.h"

using namespace std;
int main(int argc, const char * argv[]) {
    int a[10] = {1, 4, 2, 3, 6, 5, 9, 7, 8, 0};
    vector<int> b(a, a + 10);
    vector<int> c = b;
    vector<int> d = c;
    insertion_sort(b);
    merge_sort(c, 0, c.size() - 1);
    bubble_sort(d);
    return 0;
}
