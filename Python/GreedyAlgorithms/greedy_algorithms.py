#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of greedy algorithms
from Intro to Algorithms (Cormen et al.).
The aim here is not efficient Python implementations 
but to duplicate the pseudo-code in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
    recursive_activity_selector()
    greedy_activity_selector()
"""

start = [1,  3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
finish = [4,  5, 6, 7, 9, 9, 10, 11, 12, 14, 16]

def recursive_activity_selector(s, f, k, n=None):
    """
        Args:
            s: a list of start times
            f: a list of finish times
            k: current position in
            n: total possible activities

        Returns:
            A maximal set of activities that can be scheduled.
            (We use a list to hold the set.)
    """
    if n is None:
        assert(len(s) == len(f))  # each start time must match a finish time
        n = len(s)  # could be len f as well!
    m = k + 1
    while m < n and s[m] < f[k]:  # find an activity starting after our last
                                   # finish
        m = m + 1
    if m < n:
        return [m] + recursive_activity_selector(s, f, m, n)
    else:
        return []


def greedy_activity_selector(s, f):
    """
        Args:
            s: a list of start times
            f: a list of finish times

        Returns:
            A maximal set of activities that can be scheduled.
            (We use a list to hold the set.)
    """
    assert(len(s) == len(f))  # each start time must match a finish time
    n = len(s)  # could be len f as well!
    a = []
    k = 0
    for m in range(1, n):
        if s[m] >= f[k]:
            a.append(m)
            k = m
    return a
   
