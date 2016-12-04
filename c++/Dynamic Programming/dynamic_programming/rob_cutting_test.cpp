//
//  main.cpp
//  dynamic_programming
//
//  Created by Xiaohang Su on 12/3/16.
//
//

#include <iostream>
#include "Rod_cutting.h"
#include <string>
int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    std::cout << "Input Rod Length: ";
    int length = 0;
    std::cin >> length;
    Rod_cutting rod(length);
    std::string op;
    std::cout << "Input 'r' For Recursive Cut Rod or 'm' For MemorizeD Cut Rod" << std::endl;
    std::cin >> op;
    if (op == "r")
        std::cout << "Maximum Price: " << rod.recursive_cut_rod(rod.price, rod.length) << std::endl;
    else if (op == "m")
        std::cout << "Maximum Price: " << rod.memorized_cut_rod(rod.price, rod.length) << std::endl;
    std::cout << "Maximum Price: " << rod.bottom_up_cut_rod(rod.price, rod.length) << std::endl;
    std::cout << "Print cut path: ";
    rod.print_cut_rod_solution(rod.price, rod.length);
    return 0;
}
