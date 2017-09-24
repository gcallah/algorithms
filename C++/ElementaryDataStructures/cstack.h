#pragma once
#ifndef CSTACK
#define CSTACK

// use vector serves as array
#include <vector>
#include <assert.h>
struct cstack
{
	int top;
	std::vector<int> S;
	cstack() {
		top = 0;
	}
};

bool stack_empty(cstack S) {
	if (S.top == 0) return true;
	else return false;
}

void push(cstack S, int x) {
	S.top = S.top + 1;
	S.S.push_back(x);
}

int pop(cstack S) {
	assert(!stack_empty(S));
	S.top = S.top - 1;
	int top = S.S.back();
	S.S.pop_back();
	return top;
}

#endif // !CSTACK
