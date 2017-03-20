//
//  matrix.h
//  multithreadedAlgorithm
//
//  Created by Xiaohang Su on 19/03/2017.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef Matrix_h
#define Matrix_h
#include <vector>
#include <thread>
#include <future>
#include <functional>
// C++ does not provide parallel_for
// Parallel for is implemented by thoughts and some references
// use Boost / OPENMP / or Mircosoft PLL is a better solution

// This implementation missing load balancing and did not consider complexity and performance


std::vector<int> mat_vec(std::vector<std::vector<int>> &A, std::vector<int>& x) {
    int n = static_cast<int>(A.size());
    std::vector<int> y(n, 0);
    std::vector<std::thread> cons;
    for (int i = 0; i < n; i++) {
        cons.push_back(std::thread([](std::vector<int>&a, int b){ a[b]=0;}, std::ref(y), std::ref(i)));
    }
    for (auto& th : cons) {
        th.join();
    }
    cons.clear();
    for (int i = 0; i < n; i++) {
        cons.push_back(std::thread([](int i, std::vector<int>& y, std::vector<std::vector<int>> &A, std::vector<int>& x){
            int n = static_cast<int>(A.size());
            for (int j = 0; j < n; j++) y[i] = y[i] + A[i][j] * x[j];
        }, i, std::ref(y), std::ref(A), std::ref(x)));
    }
    

    while (!cons.empty()) {
        if(cons.back().joinable()) {
            cons.back().join();
            cons.pop_back();
        }
    }
    return y;
}


void mat_vec_main_loop(std::vector<std::vector<int>>&A, std::vector<int>& x, std::vector<int>& y, int n, int i, int i_) {
    if (i == i_) {
        for (int j = 0; j < n; j++) {
            y[i] = y[i] + A[i][j] * x[j];
        }
    } else {
        int mid = (i + i_) / 2;
        std::thread t(mat_vec_main_loop, std::ref(A), std::ref(x), std::ref(y), n, i, mid);
        mat_vec_main_loop(A, x, y, n, mid + 1, i_);
        t.join();
    }
}


// race_example
// Textbook use 1 - 2, might not get the answer author wants, but change it into a larger number can get a better example
void race_example() {
    int x = 0;
    std::vector<std::future<void>> cons;
    for (int i = 0; i < 100; i++) {
        int xTemp = x;
        cons.push_back(std::future<void>(std::async([](int &x, int xTemp) {
            x = xTemp + 1;
        }, std::ref(x), xTemp)));
    }
    
    while (!cons.empty()) {
        cons.back().wait();
        cons.pop_back();
    }
    std::cout << x << std::endl;
}

std::vector<int> mat_vec_wrong(std::vector<std::vector<int>> &A, std::vector<int> & x) {
    int n = static_cast<int>(A.size());
    std::vector<int> y(n, 0);
    std::vector<std::thread> cons;
    for (int i = 0; i < n; i++) {
        cons.push_back(std::thread([](std::vector<int>&a, int b){ a[b]=0;}, std::ref(y), std::ref(i)));
    }
    for (auto& th : cons) {
        th.join();
    }
    cons.clear();
    for (int i = 0; i < n; i++) {
        cons.push_back(std::thread([](int i, std::vector<int>& y, std::vector<std::vector<int>> &A, std::vector<int>& x){
            int n = static_cast<int>(A.size());
            std::vector<std::thread> cons;
            // code might be confusing because it need to preserve tempYi
            // the key of causing race condition is previous variable passing to the computed one
            for (int j = 0; j < n; j++) {
                int tempYi = y[i];
                cons.push_back(std::thread([](int i, std::vector<int>& y, int Aij, int Xj, int tempYi){
                    y[i] = tempYi + Aij * Xj;
                }, i, std::ref(y), A[i][j], x[j], tempYi));
            }
            while (!cons.empty()) {
                if(cons.back().joinable()) {
                    cons.back().join();
                    cons.pop_back();
                }
            }
        }, i, std::ref(y), std::ref(A), std::ref(x)));
    }
    
    while (!cons.empty()) {
        if(cons.back().joinable()) {
            cons.back().join();
            cons.pop_back();
        }
    }

    return y;
}

#endif /* Matrix_h */
