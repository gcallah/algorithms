"""
This file contains Python implementations of sorting algorithms from
Intro to Algorithms (Cormen et al.)
The aim here is not efficient Python implementations (we'd just call
the native sort if we wanted that) but to duplicate the pseudo-code
in the book as closely as possible.
"""

import sys

SENTINEL = sys.maxsize


def merge_sort(l):
    """
    l is the list to sort
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
    sorted = []
    left.append(SENTINEL)
    right.append(SENTINEL)
    i = 0
    j = 0
    for k in range(len(right) + len(left) - 2):
        if left[i] <= right[j]:
            print("Appending " + str(left[i]))
            sorted.append(left[i])
            i += 1
        else:
            print("Appending " + str(right[j]))
            sorted.append(right[j])
            j += 1
    return sorted
