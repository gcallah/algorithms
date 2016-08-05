"""
This file contains Python implementations of sorting algorithms from
Intro to Algorithms (Cormen et al.)
The aim here is not efficient Python implementations (we'd just call
the native sort if we wanted that) but to duplicate the pseudo-code
in the book as closely as possible.
Also, since the goal is to bring students to see how the algorithm
works, there are print statements placed at key points in the code.
I have been helped by code from http://interactivepython.org/
in creating these examples.
The performance of each sort is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
"""

import sys

SENTINEL = sys.maxsize


def swap(l, i, j):
    """
    Since several sort algorithms need to swap list
    elements, we provide a swap function.
    l: the list
    i, j: the indices of the elements to swap.
    """
    temp = l[i]
    l[i] = l[j]
    l[j] = temp


def merge_sort(l):
    """
    l: the list to sort
    Returns: a sorted list
    Performance: Θ(n * log n) 
    """
    length = len(l)
    if length <= 1:
        return l
    else:
        print("Splitting ", l)
        mid = length // 2
        left = l[:mid]
        right = l[mid:]
        left = merge_sort(left)
        right = merge_sort(right)
        return merge(left, right)

def merge(left, right):
    """
    Helper function for merge_sort: this actually
    merges the split and already sorted sub-lists.
    left: a sorted list
    right: a sorted list
    """
    sorted = []
    left.append(SENTINEL)
    right.append(SENTINEL)
    i = 0
    j = 0
    for k in range(len(right) + len(left) - 2):
        if left[i] <= right[j]:
            print("Appending " + str(left[i])
                    + " to " + str(sorted))
            sorted.append(left[i])
            i += 1
        else:
            print("Appending " + str(right[j])
                    + " to " + str(sorted))
            sorted.append(right[j])
            j += 1
    return sorted


def insert_sort(l):
    """
    l: the list to sort
    Returns: a sorted list.
    Performance: Θ(n**2) 
    """
    for j in range(1, len(l)):
        key = l[j]
        print("key = " + str(key))
        i = j - 1
        while i >= 0 and l[i] > key:
            print("moving " + str(l[i]) + " forward one.")
            l[i + 1] = l[i]
            i -= 1
        l[i + 1] = key
    return l


def bubble_sort(l):
    """
    l: the list to sort
    Returns: a sorted list.
    Performance: Θ(n**2) 
    """
    for i in range(0, len(l) - 1):
        for j in range(len(l) - 1, i, -1):
            if l[j] < l[j - 1]:
                print("Swapping " + str(l[j]) + " and "
                        + str(l[j - 1]))
                swap(l, j, j - 1)
    print(l)


def quick_sort(l, p=None, r=None):
    """
    l: the list to sort
    p: the first index in a partition
    r: the last index in a partition
    Returns: a sorted list.
    Performance:
        Worst case: Θ(n**2) 
        Expected case: Θ(n * log n) 
        Sorts in place.
    """
    if p is None:
        p = 0
    if r is None:
        r = len(l) - 1
    if p < r:
        q = partition(l, p, r)
        print("Partitioning list at index " + str(q))
        print("The list is now: " + str(l))
        quick_sort(l, p, q - 1)
        quick_sort(l, q + 1, r)

def partition(l, p, r):
    """
    Helper function for quick_sort.
    Returns: the new partition index.
    """
    x = l[r]
    print("Our pivot element x = " + str(x))
    i = p - 1
    for j in range(p, r):
        if l[j] <= x:
            i += 1
            print("i = " + str(i) + " and j = " + str(j))
            if i != j:
                print("Swapping elements " + str(l[i]) + " and "
                     + str(l[j]))
                swap(l, i, j)
    if (i + 1) != r:
        swap(l, i + 1, r)
        print("Swapping elements " + str(l[i + 1]) + " and "
              + str(l[r]))
    return i + 1
