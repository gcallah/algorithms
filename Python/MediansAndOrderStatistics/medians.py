#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of median algorithms from
Intro to Algorithms (Cormen et al.)
The aim here is not efficient Python implementations (we'd just call
the native sort if we wanted that) but to duplicate the pseudo-code
in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
I have been helped by code from http://interactivepython.org/
in creating these examples.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
"""

import operator as op

from utils.misc import swap, MAX_SENTINEL, MIN_SENTINEL

def extreme(l, comp=op.lt):
    if l is None or len(l) < 1:
        print("Empty list.")
        return None
    ops = 0
    extr = l[0]
    for i in range(1, len(l)):
        ops += 1
        if comp(l[i], extr):
            extr = l[i]
    print("Found extreme of " + str(extr) + " in " + str(ops) + " ops")

def minmax(l):
    if l is None or len(l) < 1:
        print("Empty list.")
        return None
    start = 0
    min = MAX_SENTINEL
    max = MIN_SENTINEL
    if (len(l) % 2) == 1:
        min = l[0]
        max = l[0]
        start += 1
    ops = 0
    smaller = None
    larger = None
    for i in range(start, len(l), 2):
       x = l[i - 1] - l[i]
       ops += 1
       if x < 0:
           smaller = l[i - 1]
           larger = l[i]
       else:
           smaller = l[i]
           larger = l[i - 1]
       ops += 1
       if smaller < min:
           min = smaller
       ops += 1
       if larger > max:
           max = larger

    print("Found min of " + str(min)
          + " and max of " + str(max)
          + " in " + str(ops) + " ops")

