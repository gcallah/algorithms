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
    bottom_up_cut_rod():
    matrix_chain_order()
"""

import sys


NEG_REV = -1
calls = 0

def cut_rod(prices, n):
    """
        Args:
            prices: an array of prices 0..n for rods of various lengths
            n: length of rod
        Returns:
            max_rev: the maximum revenue possible from cutting a rod of length n.
            Note: This is not a good value to return in a real world
            application: what we would really like returned is what 
            cuts to make to *achieve* that maximum revenue!
            Our textbook handles this in the extended version of bottom up rod
            cutting.
            Note2: CLRS calls variable q.

    """
    if n > len(prices):
        print("Not enough prices for rod of len " + str(n))
        return None

    global calls
    calls += 1
    if n == 0:
        return 0
    max_rev = NEG_REV  # CLRS uses negative infinity, but that hardly seems
                       # necessary: if rods do not sell at a positive price,
                       # best to just go out of business immediately!
    for i in range(0, n):
        max_rev = max(max_rev,
                      prices[i] + cut_rod(prices[:n - i - 1], n - i - 1))
        print("Handling rod of len " + str(n) + "; max revenue currently is " +
              str(max_rev))
    print("Calls = " + str(calls))
    return max_rev


def memo_cut_rod(prices, n):
    """
        Args:
            prices: an array of prices 0..n for rods of various lengths
            n: length of rod
        Returns:
            max_rev: maximum revenue possible
    """
    if n == 0:
        return 0
    max_rev = NEG_REV
    revs = [NEG_REV for i in range(n)]
    return memo_cut_rod_aux(prices, n, revs)


def memo_cut_rod_aux(prices, n, revs):
    """
        Args:
            prices: an array of prices 0..n for rods of various lengths
            revs: revenues previously calculated
            n: length of rod
        Returns:
            max_rev: maximum revenue
    """
    global calls
    max_rev = NEG_REV
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
                          + memo_cut_rod_aux(prices[:n - i - 1],
                                             n - i - 1,
                                             revs))
            print("Handling rod of len " + str(n)
                  + "; max revenue currently is " +
                  str(max_rev))

    revs[n - 1] = max_rev
    print("Calls = " + str(calls))
    return max_rev


def bottom_up_cut_rod(prices, n):
    """
        Args:
            prices: an array of prices for different rod lengths
            n: length of rod
        Returns:
            max_rev: maximum revenue possible
    """
    if n > len(prices):
        print("Not enough prices for rod of len " + str(n))
        return None

    max_rev = NEG_REV
    revs = [0 for i in range(n + 1)]  # CLRS only initializes first elem,
                                      # but no harm doing all
    for j in range(1, n + 1):  # 0th element holds a 0
        max_rev = NEG_REV
        for i in range(j):
            print("Checking max_rev between " + str(max_rev)
                    + " and j = " + str(j) + "; i = " + str(i)
                    + "; j - i - 1 = " + str(j - i - 1))
            print("prices[i] = " + str(prices[i]) + 
                    "; revs[j - i - 1] = " + str(revs[j - i - 1]))
            max_rev = max(max_rev, prices[i] + revs[j - i - 1])

        print("Maximum revenue calculated at step " + str(j)
              + " = " + str(max_rev))
        revs[j] = max_rev

    return revs[n]


def ext_bottom_up_cut_rod(prices, n):
    """
        This calculates the maximum revenue, but also returns a list of what
        cuts generate it.
        Args:
            prices: an array of prices for different rod lengths
            n: length of rod
        Returns:
            max_rev: maximum revenue possible
    """
    if n > len(prices):
        print("Not enough prices for rod of len " + str(n))
        return None

    revs = [0 for i in range(n + 1)]  # CLRS only initializes first elem,
                                      # but no harm doing all
    cuts = [0 for i in range(n + 1)]
    for j in range(1, n + 1):  # 0th element holds a 0
        print("\n********\n Working on foot: " + str(j))
        max_rev = NEG_REV
        for i in range(j):
            prev_revs = revs[j - i - 1]
            print("Revs = " + str(revs))
            print("Comparing max_rev of " + str(max_rev)
                  + " with " + str(prices[i])
                  + " plus prev_rev of " + str(prev_revs))
            if max_rev < prices[i] + prev_revs:
                max_rev = prices[i] + prev_revs
                cuts[j] = i + 1

        revs[j] = max_rev

    return (revs, cuts, max_rev)


def print_cut_rod(prices, n):
    """
        Args:
            prices: price array
            n: length of rod
        Returns:
            None
            Prints optimal cuts
    """
    (revs, cuts, max_rev) = ext_bottom_up_cut_rod(prices, n)
    while n > 0:
        print("Make a cut of: " + str(cuts[n]))
        n = n - cuts[n]
    print("And we achieve revenue of " + str(max_rev))


# some price arrays for testing rod cutting:
p1 = [3]
p2 = [3, 7]
p3 = [3, 7, 9]
p4 = [3, 7, 9, 12]
p7 = [3, 5, 10, 11, 14, 17, 20]
p10 = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]


"""
On to determining optimal matrix multiplication order.
"""

BIG_NUM = sys.maxsize


def matrix_chain_order(p):
    """
        Args:
            p: a list of dimensions so that 
            matrix i's dimensions are found at
            p[i - 1] and p[i].
        Returns:
            list of m and list of s for parenthisation
    """
    n = len(p) - 1
    m = [[BIG_NUM for x in range(n)] for x in range(n)] 
    for i in range(n):
        m[i][i] = 0
    s = [[-1 for x in range(n)] for x in range(n)]

    for l in range(2, n + 1):
        print("Working on chain length: " + str(l))
        for i in range(0, n - l + 1):
            j = i + l - 1
            print("i = " + str(i) + "; j = " + str(j))
            m[i][j] = BIG_NUM
            for k in range(i, j):
                print("k = " + str(k))
                print("Cost = m[i][k] (" + str(m[i][k]) +
                        ") + m[k+1][j] (" + str(m[k + 1][j]) +
                        ") + p[i] (" + str(p[i]) +
                        ") * p[k+1] (" + str(p[k + 1]) +
                        ") * p[j+1] (" + str(p[j + 1]) + ")")
                q = (m[i][k] + m[k + 1][j]
                    + (p[i] * p[k+1] * p[j+1]))
                print("Comparing q = " + str(q) 
                      + " with m[i][j] = "
                      + str(m[i][j]) + " with i = "
                      + str(i) + " and j = " + str(j)
                      + " and k = " + str(k))
                if q < m[i][j]:
                    m[i][j] = q
                    s[i][j] = k
    return (m, s)


def print_optimal_parens(s, i, j):
    """
        Args:
            s: the list returned by matrix_chain_order()
            i: start index
            j: end index
        Returns: None; prints results.
    """
    if i == j:
        print(" A", end="")
    else:
        print("(", end="")
        print_optimal_parens(s, i, s[i][j])
        print_optimal_parens(s, s[i][j] + 1, j)
        print(")", end="")


# an M of size n holds the dimensions for n - 1 matrices!
# dims 2 ... n - 1 are the 2nd dim of one M and the 1st dim of the 
# next one.
M2 = [10, 100, 5]
M3 = [10, 100, 5, 50]
M4 = [10, 100, 5, 50, 80]
clrs_test = [30, 35, 15, 5, 10, 20, 25]  # this is the example from page 376


def optimal_bst(p, q, n):
    """
        Args:
            p: probabilities of actual items
            q: probabilities of failed searches (1 bigger than p!)
            n: number of items in p

        Returns:
            e: expected search costs (a 2D list)
            root: of the constructed BST
    """

    # three 2D arrays: e is expected search costs, w is probabilities,
    # and root is ?
    e = [[BIG_NUM for x in range(n + 1)] for x in range(n + 1)]
    w = [[0 for x in range(n + 1)] for x in range(n + 1)]
    root = [[BIG_NUM for x in range(n)] for x in range(n)]

    for i in range(0, n + 1):
        e[i][i] = q[i]
        print("i = " + str(i) + "; e[i][i] = " + str(e[i][i]))
        w[i][i] = q[i]
        print("i = " + str(i) + "; w[i][i] = " + str(w[i][i]))

    for l in range(0, n):
        print("\n*********")
        print("*********")
        print("*********")
        print("Outer loop; l = " + str(l))
        for i in range(0, n - l):
            j = i + l
            print("\n*********")
            print("*********")
            print("Middle loop; i = " + str(i) +
                  "; j = " + str(j))
            print("w[i][j + 1] = " + str(w[i][j]) + " + "
                  + str(p[j]) + " + " + str(q[j + 1]))
            w[i][j + 1] = w[i][j] + p[j] + q[j + 1]
            w[i][j + 1] = round(w[i][j + 1], 2)
            for r in range(i, j + 1):
                print("\n*********")
                print("Inner loop; r = " + str(r))
                t = e[i][r] + e[r + 1][j + 1] + w[i][j + 1]
                print("t = " + str(t))
                if t < e[i][j]:
                    e[i][j] = round(t, 2)
                    root[i][j] = r
    return (e, root)

# probabilities from CLRS:
p = [.15, .10, .05, .10, .20]
q = [.05, .10, .05, .05, .05, .10]

