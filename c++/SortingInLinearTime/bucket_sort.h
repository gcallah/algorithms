//
//  Created by Xiaohang Su on 2/27/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef BUCKET_SORT_H
#define BUCKET_SORT_H

#include <vector>
template <typename T>
void buck_sort(std::vector<T>& A) {
	// n is important, it represents how many buckets, 
	// but also need elements in this range(0 ~ n - 1)
	int n = A.size();
	std::vector<T> buckets(n, T());
	for (int i = 0; i < A.size(); i++) {
		// insert bucket in bucket
		// hash is a common approach
	}
	// buckets element insides all sorted
	for (int i = 0; i < buckets.size(); i++) {
		// concatenate all buckets
		// define your own method
	}
}

// O(n) + n * O(2 - 1/n) = O(n)
// O(n) time complexity

#endif