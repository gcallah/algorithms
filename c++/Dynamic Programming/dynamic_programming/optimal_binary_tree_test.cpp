//
//  main.cpp
//  dynamic_programming
//
//  Created by Xiaohang Su on 12/3/16.
//
//

#include <iostream>
#include "Rod_cutting.h"
#include "Optimal_BST.h"

#include <string>
int main(int argc, const char * argv[]) {
    // insert code here...
    double p[6] = {-1.0, 0.15, 0.10, 0.05, 0.10, 0.20};
    double q[6] = {0.05, 0.10, 0.05, 0.05, 0.05, 0.10};
    
    Optimal_BST BST(vector<double>(std::begin(p), std::end(p)), vector<double>(std::begin(q), std::end(q)));
    
    return 0;
}
