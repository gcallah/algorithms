//
//  fibonacci.h
//  multithreadedAlgorithm
//
//  Created by Xiaohang Su on 19/03/2017.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef fibonacci_h
#define fibonacci_h
#include <iostream>
#include <future>

int fib(int n) {
    if (n <= 1) {
        return n;
    } else {
        int x = fib(n - 1);
        int y = fib(n - 2);
        return x + y;
    }
}

// C++ 11 feature using future
// Implementation varies different languages
// computer is not ideal and max thread numbers are easily reach with larger n
int p_fib(int n) {
    if (n <= 1) {
        return n;
    } else {
        std::future<int> fut = std::async(p_fib, n - 1);
        int y = p_fib(n - 2);
        
        return fut.get() + y;
    }
}

#endif /* fibonacci_h */
