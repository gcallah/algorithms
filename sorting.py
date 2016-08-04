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
    """
    Helper function for merge_sort: this actually
    merges the split and already sorted sub-lists.
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
    for j in range(1, len(l)):
        key = l[j]
        print("key = " + str(key))
        i = j - 1
        while i >= 0 and l[i] > key:
            print("moving " + str(l[i]) + " forward one.")
            l[i + 1] = l[i]
            i -= 1
        l[i + 1] = key
    print(l)


def bubble_sort(l):
    for i in range(0, len(l) - 1):
        for j in range(len(l) - 1, i + 1, -1):
            if l[j] < l[j - 1]:
                temp = l[j]
                l[j] = l[j - 1]
                l[j - 1] = temp
    print(l)
