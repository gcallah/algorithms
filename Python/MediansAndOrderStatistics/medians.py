#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of order statistic
algorithms from Intro to Algorithms (Cormen et al.).
The aim here is not efficient Python implementations 
but to duplicate the pseudo-code in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
"""

def minimum(a):
    min = a[0]
    for i in range(1, len(a)):
        if min > a[i]:
            min = a[i]
    return min
