#!/usr/bin/env python3
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of the quicksort algorithm from
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
    quicksort()
    rand_quicksort()
    And auxilliary functions that these sorts use, such as
        partition().
"""

from utils.misc import swap

swaps = 0

def hoare_partition(l, p, r):
    """
    Alternate helper function for quicksort.

    """
    global swaps
    x = l[p]
    i = p - 1
    j = r + 1
    print("Hoare: Our pivot element x = " + str(x))
    while i < j:
        while True:
            j -= 1
            if l[j] <= x:
                break
        while True:
            i += 1
            if l[i] >= x:
                break
        if i < j:
            print("Swapping elements "
                  + "i (" + str(i) + ") = "
                  + str(l[i])
                  + " and "
                  + "j (" + str(j) + ") = "
                  + str(l[j]))
            swap(l, i, j)
            swaps += 1
            print("Swaps = " + str(swaps))
    return j

def partition(l, p, r, prnt=True):
    """
    Helper function for quicksort.
    Args:
        prnt: turn on printing

    Returns: the new partition index.
    """
    global swaps
    x = l[r]
    if prnt:
        print("Checking print flag; = " + str(prnt))
        print("Partition: Our pivot element x = " + str(x))
    i = p - 1
    for j in range(p, r):
        if l[j] <= x:
            i += 1
            if prnt:
                print("i = " + str(i) + " and j = " + str(j))
            if i != j:
                if prnt:
                    print("Swapping elements " + str(l[i]) + " and "
                          + str(l[j]))
                swap(l, i, j)
                swaps += 1
                if prnt:
                    print("Swaps = " + str(swaps))
    if (i + 1) != r:
        if prnt:
            print("Swapping elements " + str(l[i + 1]) + " and "
                  + str(l[r]))
        swap(l, i + 1, r)
        swaps += 1
        if prnt:
            print("Swaps = " + str(swaps))
    return i + 1

def quicksort(l, p=None, r=None, partf=partition, prnt=True):
    """
    Args:
        l: the list to sort
        p: the first index in a partition
        r: the last index in a partition
        prnt: turn on printing

    Returns: None

    Performance:
        Worst case: Θ(n**2) 
        Expected case: Θ(n * lg n) 
        Sorts in place.
    """
    global swaps
    if p is None:
        swaps = 0
        p = 0
    if r is None:
        r = len(l) - 1
    if p < r:
        q = partf(l, p, r, prnt=prnt)
        if prnt:
            print("Partitioning list at index " + str(q))
            print("The list is now: " + str(l))
        quicksort(l, p, q - 1, partf=partf, prnt=prnt)
        quicksort(l, q + 1, r, partf=partf, prnt=prnt)


def rand_quicksort(l, p=None, r=None):
    """
    Args:
        l: the list to sort
        p: the first index in a partition
        r: the last index in a partition

    Returns: a sorted list.

    Performance:
        Worst case: Θ(n**2) 
        Expected case: Θ(n * lg n) 
        Sorts in place.

    This is a version of quicksort where the pivot
    element is chosen randomly. By randomly choosing the pivot,
    we expect a better balanced split of the input 
    list on average.
    quicksort() and rand_quicksort() could easily be
    rewritten as a single function taking a pointer
    to the partition function to be used.
    """
    if p is None:
        p = 0
    if r is None:
        r = len(l) - 1
    if p < r:
        q = rand_partition(l, p, r)
        print("Partitioning list at index " + str(q))
        print("The list is now: " + str(l))
        rand_quicksort(l, p, q - 1)
        rand_quicksort(l, q + 1, r)

def rand_partition(l, p, r):
    """
    This function simply chooses a random index value between
    p and r, swaps that value with the one at r,
    and then calls partition on the new List.
    """
    i = random.randint(p, r)
    print("We have randomly chosen between values " + str(p) +
            " and " + str(r) + ": " + str(i) + " as our pivot.")
    swap(l, i, r)
    return partition(l, p, r)
