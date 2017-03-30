//
//  queues.h
//  elementaryDataStructure
//
//  Created by Xiaohang Su on 24/03/2017.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef queues_h
#define queues_h

#include <vector>
#include <iostream>

struct d_queue {
    int tail;
    int head;
    std::vector<int> q;
    d_queue(const int t_size) {
        q = std::vector<int>(t_size, 0);
    }
};

void enqueue(d_queue &Q, int x) {
    Q.q[Q.tail] = x;
    if (Q.tail == Q.q.size()) {
        Q.tail = 0;
    } else {
        Q.tail = Q.tail + 1;
    }
}

int dequeue(d_queue &Q) {
    int x = Q.q[Q.head];
    if (Q.head == Q.q.size()) {
        Q.head = 0;
    } else {
        Q.head = Q.head + 1;
    }
    return x;
}

#endif /* queues_h */
