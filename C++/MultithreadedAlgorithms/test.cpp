//
//  main.cpp
//  multithreadedAlgorithm
//
//  Created by Xiaohang Su on 19/03/2017.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#include <iostream>
#include "fibonacci.h"
#include "matrix.h"


using namespace std;
int main(int argc, const char * argv[]) {
    int n = 10;
    cout << p_fib(n) << endl; // might threads explode
    
    cout << fib(n) << endl;
    cout << "Race Example: ";
    race_example();
    
    
    cout << "Matrix Calculation" << endl;
    vector<vector<int>> A {{1,2,3},
        {4,5,6},
        {7,8,9}};
    vector<int> x {3, 6, 9};
    vector<int> y = mat_vec(A, x);
    vector<int> wrongY = mat_vec_wrong(A, x);
    
    vector<int> main_loop_y(3, 0);
    mat_vec_main_loop(A, x, main_loop_y, 3, 0, 2);
    return 0;
}
