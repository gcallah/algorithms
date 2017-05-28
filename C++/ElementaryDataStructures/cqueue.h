#pragma once
#ifndef CQUEUE
#define CQUEUE

#include <vector>

const static int CQUEUE_SIZE = 10;

struct cqueue {
	int head = 0, tail = 0;
	std::vector<int> Q;
	cqueue() {
		head = 0;
		tail = 0;
		Q = std::vector<int>(CQUEUE_SIZE, 0);
	}
};

void enqueue(cqueue Q, int x) {
	Q.Q[Q.tail] = x;
	if (Q.tail == Q.Q.size()) {
		Q.tail = 1;
	}
	else {
		Q.tail = Q.tail + 1;
	}
}

int dequeue(cqueue Q) {
	int x;
	x = Q.Q[Q.head];
	if (Q.head == Q.Q.size()) {
		Q.head = 1;
	}
	else {
		Q.head = Q.head + 1;
	}
	return x;
}

#endif // !CQUEUE
