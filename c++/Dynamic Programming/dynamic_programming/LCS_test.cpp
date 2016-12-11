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
#include "Matrix_Chain.h"
#include "LCS.h"
#include <string>


int main(int argc, const char * argv[]) {
    // insert code here...

    LCS b;
    b.LCS_Length("ABCBDAB", "BDCABA");
    b.print_LCS(b.b, "ABCBDAB", 7, 6);
    return 0;
}
