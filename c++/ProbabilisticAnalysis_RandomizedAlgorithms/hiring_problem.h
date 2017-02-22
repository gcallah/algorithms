//
//  hiring_problem.h
//  ProbabilisticAnalysis_RandomizedAlgorithms
//
//  Created by Xiaohang Su on 2/10/17.
//  Copyright © 2017 Xiaohang Su. All rights reserved.
//

#ifndef hiring_problem_h
#define hiring_problem_h
#include <vector>
#include <algorithm>
#include <climits>

// This is only the mock code of hire_assistant

// define how it is better
bool isBetter(int candidate, int target) {
    return true;
}

// define how to hire candidate here
void hire_candidate(int i) {};

// define how to interview candidate here
void interview_candidate(int i) {};

void hire_assistant(int n) {
    int best = 0;
    for (int i = 1; i < n; i++) {
        if (isBetter(best, i)) {
            best = i;
            hire_assistant(i);
        }
    }
}

void randomized_hire_assistant(int n) {
    std::vector<int> lists(n, 0);
    for (int i = 0; i < lists.size(); i++) {
        lists[i] = 1;
    }
    
    std::random_shuffle(lists.begin(), lists.end()); // <algorithm> shuffle elements
    
    int best = lists[0];
    for (int i = 1; i < lists.size(); i++) {
        interview_candidate(i);
        if (isBetter(best, i)) {
            best = i;
            hire_assistant(i);
        }
    }
}


// this function did not use in any pesudocode in textbook
int on_line_maximum(int k, int n, std::vector<int> & score) {
    int bestScore = INT_MIN;
    for (int i = 0; i < k; i++) {
        if (score[i] > bestScore) {
            bestScore = score[i];
        }
    }
    for (int i = k; i < n; i++) {
        if (score[i] > bestScore) {
            return i;
        }
    }
    return n;
}

#endif /* hiring_problem_h */
