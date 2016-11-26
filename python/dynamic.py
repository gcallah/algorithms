#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of dynamic programming
from Intro to Algorithms (Cormen et al.).
The aim here is not efficient Python implementations 
but to duplicate the pseudo-code in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
    cut_rod()
    memo_cut_rod()
    memo_cut_rod_aux()
"""

NEG_REV = -1
calls = 0

def cut_rod(prices):
    """
        Args:
            prices: an array of prices 0..n for rods of various lengths
            CLRS passes n, but since it is just len(p)...
        Returns:
            max_rev: the maximum revenue possible from cutting a rod of length n.
            Note: This is a *terrible* thing to return in a real world
            application: what we would really like returned is what 
            cuts to make to *achieve* that maximum revenue!
            Note2: CLRS calls variable q.

    """
    global calls
    calls += 1
    n = len(prices)
    if n == 0:
        return 0
    max_rev = NEG_REV  # CLRS uses negative infinity, but that hardly seems
                       # necessary: if rods do not sell at a positive price,
                       # best to just go out of business immediately!
    for i in range(0, n):
        max_rev = max(max_rev,
                      prices[i] + cut_rod(prices[:n - i - 1]))
        print("Handling rod of len " + str(n) + "; max revenue currently is " +
              str(max_rev))
    print("Calls = " + str(calls))
    return max_rev


def memo_cut_rod(prices):
    """
        Args:
            prices: an array of prices 0..n for rods of various lengths
            CLRS passes n, but since it is just len(prices)...
        Returns:
            max_rev: maximum revenua
    """
    n = len(prices)
    if n == 0:
        return 0
    max_rev = NEG_REV
    revs = [NEG_REV for i in range(n)]
    return memo_cut_rod_aux(prices, revs)


def memo_cut_rod_aux(prices, revs):
    """
        Args:
            prices: an array of prices 0..n for rods of various lengths
            revs: revenues previously calculated
        Returns:
            max_rev: maximum revenua
    """
    global calls
    max_rev = NEG_REV
    n = len(prices)
    if revs[n - 1] >= 0:
        print("Using memo value with n = " + str(n)
              + " and revs[n - 1] = "
              + str(revs[n - 1]))
        return revs[n - 1]
    if n == 0:
        max_rev = 0
    else:
        calls += 1
        for i in range(0, n):
            max_rev = max(max_rev,
                          prices[i]
                          + memo_cut_rod_aux(prices[:n - i - 1], revs))
            print("Handling rod of len " + str(n)
                  + "; max revenue currently is " +
                  str(max_rev))

#    print("n = " + str(n) + "; setting revs[n - 1] = "
#          + str(revs[n - 1]))
    revs[n - 1] = max_rev
    print("Calls = " + str(calls))
    return max_rev


# some price arrays for testing:
p1 = [3]
p2 = [3, 7]
p3 = [3, 7, 9]
p4 = [3, 7, 9, 12]
p7 = [3, 5, 10, 11, 14, 17, 20]
