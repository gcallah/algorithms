"""
    Divide and conquer algorithms from Cormen et al.

    Contains:
        find_max_subarray()
        find_max_crossing_subarray()
"""

import sys

NEG_INF = -1 * sys.maxsize


def find_max_crossing_subarray(l, low, high, mid):
    """
        Args:
            l: the list to search.
            low: the lowest index to look at.
            high: the highest index to look at.
            mid: the mid-point to use.

        Returns:
            A tuple containing the low and high indices
            of the max crossing subarray, and its sum.
    """
    max_left = None
    max_right = None
    left_sum = NEG_INF
    sum = 0
    for i in range(mid, low - 1, -1):
        sum += l[i]
        if sum > left_sum:
            left_sum = sum
            max_left = i

    right_sum = NEG_INF
    sum = 0
    for i in range(mid + 1, high + 1):
        sum += l[i]
        if sum > right_sum:
            right_sum = sum
            max_right = i

    return (max_left, max_right, left_sum + right_sum)


def find_max_subarray(l, low, high):
    """
        Args:
            l: the list to search.
            low: the lowest index to look at.
            high: the highest index to look at.

        Returns:
            A tuple containing the low and high indices
            of the max crossing subarray, and its sum.
    """
    if low == high:
        return (low, high, l[low])  # base case: only one element!
    else:
        mid = (low + high) // 2
        (left_low, left_high, left_sum) = find_max_subarray(l, low, mid)
        (right_low, right_high, right_sum) = find_max_subarray(l, mid + 1,
                                                               high)
        (cross_low, cross_high, cross_sum) = \
                find_max_crossing_subarray(l, low, mid, high)
        if left_sum >= right_sum and left_sum >= cross_sum:
            return (left_low, left_high, left_sum)
        elif right_sum >= left_sum and right_sum >= cross_sum:
            return (right_low, right_high, right_sum)
        else:
            return (cross_low, cross_high, cross_sum)
