//
//  Created by Xiaohang Su on 2/27/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//
#ifndef COUNTING_SORT_H
#define COUNTING_SORT_H

#include <vector>
using namespace std;
template <typename T>
void counting_sort(vector<T> &A, vector<T>& B, int k) {
	vector<int> C(k + 1, 0);
	for (int j = 0; j < A.size(); j++) {
		C[A[j]] = C[A[j]] + 1;
	}
	// C[i] now contains the number of elements equal to i.
	for (int i = 1; i <= k; i++) {
		C[i] = C[i] + C[i - 1];
	}
	// C[i] now contains the number of elements less than or equal to i.
	for (int j = A.size() - 1; j >= 0; j--) {
		B[C[A[j]]] = A[j];
		C[A[j]] = C[A[j]] - 1;
	}
}

// stable sort
// O(n)
// limitation: n input elements is an integer in the range for 0 to k.
#endif