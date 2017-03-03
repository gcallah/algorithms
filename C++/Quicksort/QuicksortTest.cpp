//
//  main.cpp
//  Quicksort
//
//  Created by Xiaohang Su on 2/21/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#include <iostream>
#include <time.h>
#include "Quicksort.h"
using namespace std;
int main(int argc, const char * argv[]) {
    srand(time(0));
    vector<int> unsorted_array({2,3,6,1,4,9,5,0,8,7});
    vector<int> a = unsorted_array;
    vector<int> b = unsorted_array;
    quicksort(a, 0, a.size() - 1);
    randomized_quicksort(b, 0, b.size() - 1);
    return 0;
}
