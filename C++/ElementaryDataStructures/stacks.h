//
//  stacks.h
//  elementaryDataStructure
//
//  Created by Xiaohang Su on 24/03/2017.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef stacks_h
#define stacks_h

#include <vector>
#include <iostream>
struct d_stack {
    std::vector<int> S;
    int top;
    d_stack(int t_size) {
        S = std::vector<int>(t_size, 0);
        top = -1;
    }
};

bool stack_empty(const d_stack &S) {
    if (S.top == -1) {
        return true;
    } else {
        return false;
    }
}

void push(d_stack &S, int x) {
    S.top = S.top + 1;
    S.S[S.top] = x;
}

int pop(d_stack &S) {
    if (stack_empty(S)) {
        throw std::runtime_error("underflow");
    } else {
        S.top = S.top - 1;
        return S.S[S.top + 1];
    }
}

#endif /* stacks_h */
