//
//  maximum_array.h
//  DivideAndConquer
//
//  Created by Xiaohang Su on 2/3/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef maximum_array_h
#define maximum_array_h

#include <limits.h>
#include <vector>
#include <cmath>

template <typename T>
struct triplet {
    int first;
    int second;
    T third;
    triplet(int f, int s, T t) : first(f), second(s), third(t) {};
};

template <typename T>
triplet<T> find_max_crossing_subarray(std::vector<T> & A, int low, int mid, int high) {
    T left_sum = std::numeric_limits<T>::min();
    T sum = 0;
    int max_left = 0;
    for (int i = mid; i >= low; i--) {
        sum = sum + A[i];
        if (sum > left_sum) {
            left_sum = sum;
            max_left = i;
        }
    }
    
    T right_sum = std::numeric_limits<T>::min();
    sum = 0;
    int max_right = 0;
    for (int j = mid + 1; j <= high; j++) {
        sum = sum + A[j];
        if (sum > right_sum) {
            right_sum = sum;
            max_right = j;
        }
    }
    return triplet<T>(max_left, max_right, left_sum + right_sum);
}

template <typename T>
triplet<T> find_maximum_subarray(std::vector<T>& A, int low, int high) {
    if (high == low) {
        return triplet<T>(low, high, A[low]); // base case: only one element
    } else {
        int mid = (high - low) / 2 + low;
        triplet<T> lowTriplet = find_maximum_subarray(A, low, mid);
        triplet<T> highTriplet = find_maximum_subarray(A, mid + 1, high);
        triplet<T> crossTriplet = find_max_crossing_subarray(A, low, mid, high);
        if (lowTriplet.third >= highTriplet.third && lowTriplet.third >= crossTriplet.third) {
            return lowTriplet;
        } else if (highTriplet.third >= lowTriplet.third && highTriplet.third >= crossTriplet.third) {
            return highTriplet;
        } else return crossTriplet;
    }
}


#endif /* maximum_array_h */
