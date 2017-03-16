//
//  main.cpp
//  DivideAndConquer
//
//  Created by Xiaohang Su on 2/3/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#include <iostream>
#include "maximum_array.h"
using namespace std;
int main(int argc, const char * argv[]) {
    int a[16] = {13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7};
    vector<int> b(a, a + 16);
    triplet<int> res = find_maximum_subarray(b, 0, b.size() - 1);
    cout << "(" <<res.first << ", " << res.second << ", " << res.third << ")" << endl;
    return 0;
}
