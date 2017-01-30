//
//	Heapsort running time is O(nlgn)
//

#include <vector>
#include <iostream>
#include <math.h>
#include <algorithm>
template <typename comparable> class Heapsort {
public:
    Heapsort(){};
    void max_heapify(std::vector<comparable> &A, const int i) {
        int l = LEFT(i);
        int r = RIGHT(i);
        int largest;
        if (l < heapSize && A[l] > A[i]) {
            largest = l;
        } else largest = i;
        
        if (r < heapSize && A[r] > A[largest]) {
            largest = r;
        }
        
        if (largest != i) {
            swap(A[i], A[largest]);
            max_heapify(A, largest);
        }
	}
    
    void build_max_heap(std::vector<comparable> &A) {
        heapSize = A.size();
        for (int i = floor(A.size() / 2); i >= 0; i--) {
            max_heapify(A, i);
        }
    }
    
    void heapsort(std::vector<comparable> &A) {
        build_max_heap(A);
        for (int i = A.size() - 1; i >= 1; i--) {
            swap(A[0], A[i]);
            heapSize--;
            max_heapify(A, 0);
        }
    }
    
    inline int LEFT(const int i) {
        return (i << 1);
    }
    
    inline int RIGHT(const int i) {
        return (i << 1) + 1;
    }
    
    inline int PARENT(const int i) {
        return floor(i >> 1);
    }
    
    void swap(comparable &a, comparable &b) {
        comparable temp = b;
        b = a;
        a = temp;
    }
private:
    int heapSize = 0;
};
