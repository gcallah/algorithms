//
//  main.cpp
//  ProbabilisticAnalysis_RandomizedAlgorithms
//
//  Created by Xiaohang Su on 2/10/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#include <iostream>
#include "hiring_problem.h"
#include "randomized_algorithms.h"
using namespace std;
int main(int argc, const char * argv[]) {
    srand(time(NULL)); // use for random number
    vector<int> A ({1, 3, 5, 2, 4 ,3});
    permute_by_sorting(A);
    return 0;
}
