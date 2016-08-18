"""
    Divide and conquer algorithms from Cormen et al.

    Contains:
        find_max_subarray()
        find_max_crossing_subarray()
        square_matrix_multiply()
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
    print("find_max_crossing_subarray called with low, high, mid = %i, %i, %i"
            % (low, high, mid))
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


def find_max_subarray(l, low=None, high=None):
    """
        Args:
            l: the list to search.
            low: the lowest index to look at.
            high: the highest index to look at.

        Returns:
            A tuple containing the low and high indices
            of the max subarray, and its sum.
    """
    if low is None:
        low = 0
    if high is None:
        high = len(l) - 1

    if low == high:
        print("At base case with low = " + str(low)
                + " and high = " + str(high))
        return (low, high, l[low])  # base case: only one element!
    else:
        mid = (low + high) // 2
        print("Setting mid to " + str(mid))
        (left_low, left_high, left_sum) = find_max_subarray(l, low, mid)
        print("Left low, high, sum = %i, %i, %i" % (left_low, left_high,
            left_sum))
        (right_low, right_high, right_sum) = find_max_subarray(l, mid + 1,
                                                               high)
        print("Right low, high, sum = %i, %i, %i" % (right_low, right_high,
            right_sum))
        (cross_low, cross_high, cross_sum) = \
                find_max_crossing_subarray(l, low, high, mid)
        print("Cross low, high, sum = %i, %i, %i" % (cross_low, cross_high,
            cross_sum))
        if left_sum >= right_sum and left_sum >= cross_sum:
            return (left_low, left_high, left_sum)
        elif right_sum >= left_sum and right_sum >= cross_sum:
            return (right_low, right_high, right_sum)
        else:
            return (cross_low, cross_high, cross_sum)


def square_matrix_multiply(m1, m2):
    """
        Args:
            m1, m2: the two matrices to multiply. (Must be square matrices
            of the same size.)

        Returns:
            The resulting matrix.
    """
    n = len(m1)  # we could use either m1 or m2!
    result = [[] for i in range(n)]
    for i in range(0, n):
        for j in range(0, n):
            result[i].append(0)
            for k in range(0, n):
                result[i][j] += m1[i][k] * m2[k][j]
    return result
