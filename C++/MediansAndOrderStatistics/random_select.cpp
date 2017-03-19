#include <vector>
#include <stdlib.h>
using namespace std;

void minimum(vector<int> A) {
    int minVal = A[0];
    for (int i = 1; i < A.size(); i++) {
        if (minVal > A[i]) {
            minVal = A[i];
        }
    }

    return minVal;
}


// from section 7.3 randomized_partition
int randomized_partition(std::vector<int> A, int p, int r) {
    int i = (rand() % (r - p)) + p;
    std::swap(A[r], A[i]);
    return partition(A, p, r);
}

int randomized_select(vector<int> A, int p, int r, int i) {
	if (p == r) {
		return A[p];
	}
	int q = randomized_partition(A, p, r);
	int k = p - q + 1;
	if (i == k) // the pivot value is the answer
		return A[q];
	else if (i < k) {
		return randomized_select(A, p, q - 1, i);
	} else {
		return randomized_select(A, q + 1, r, i - k);
	}
}