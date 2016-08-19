"""
    Divide and conquer algorithms from Cormen et al.

    Contains:
        find_max_subarray()
        find_max_crossing_subarray()
        square_matrix_multiply()
        square_matrix_multiply_recursive()
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

        Performance: Θ(n ** 3) 
    """
    n = len(m1)  # we could use either m1 or m2!
    result = [[] for i in range(n)]
    for i in range(0, n):
        for j in range(0, n):
            result[i].append(0)
            for k in range(0, n):
                result[i][j] += m1[i][k] * m2[k][j]
    return result


def square_matrix_multiply_recursive(a, b):
    """
        Args:
            m1, m2: the two matrices to multiply. (Must be square matrices
            of the same size. Additionally, their size must be a power
            of 2, at least for now.)

        Returns:
            The resulting matrix.

        Performance: Θ(n ** 3) 
    """
    n = len(a)  # we could use either a or b!
    c = [[] for i in range(n)]
    if n == 1:
        print("In base case; multiplying " + str(a[0][0])
                + " and " + str(b[0][0]))
        c[0].append(a[0][0] * b[0][0])
    else:
        (a11, a12, a21, a22) = partition_matrix(a)
        print("partitioned a into: " + str(a11) + "; "
                + str(a12) + "; " + str(a21) + "; " + str(a22))
        (b11, b12, b21, b22) = partition_matrix(b)
        print("partitioned b into: " + str(b11) + "; "
                + str(b12) + "; " + str(b21) + "; " + str(b22))
        c11 = madd(square_matrix_multiply_recursive(a11, b11),
                square_matrix_multiply_recursive(a12, b21))
        c12 = madd(square_matrix_multiply_recursive(a11, b12),
                square_matrix_multiply_recursive(a12, b22))
        c21 = madd(square_matrix_multiply_recursive(a21, b11),
                square_matrix_multiply_recursive(a22, b21))
        c22 = madd(square_matrix_multiply_recursive(a21, b12),
                square_matrix_multiply_recursive(a22, b22))
        print("assembling c from: " + str(c11) + "; "
                + str(c12) + "; " + str(c21) + "; " + str(c22))
        c = assemble_matrix([c11, c12, c21, c22])
    return c


def madd(m1, m2):
    """
        Matrix add.

        Args:
            m1, m2: the matrices to add

        Returns:
            m: the result
    """
    n = len(m1)  # or m2!
    m = [[] for i in range(n)]
    for i in range(0, n):
        for j in range(0, n):
            m[i].append(m1[i][j] + m2[i][j])
    return m


def partition_matrix(m):
    """
        Args:
            m: the matrix to partition.

        Returns:
            m11, m12, m21, and m22: four equally sized partitions of m
    """
    n = len(m)
    partition = (n // 2)
    print("partition = " + str(partition))

    m11 = [m[i][0:partition] for i in range(0, partition)]
    m12 = [m[i][partition:n] for i in range(0, partition)]
    m21 = [m[i][0:partition] for i in range(partition, n)]
    m22 = [m[i][partition:n] for i in range(partition, n)]
    return (m11, m12, m21, m22)


def assemble_matrix(matrix_list):
    """
        Args:
            matrix_list: a list of four equally sized square matrices

        Returns:
            m, the four list elements built back into one matrix
    """
    sub_len = len(matrix_list[0])  # get the dims of our result
    n = sub_len * 2  # the number of rows in the result
    m = [[] for i in range(n)]

    # first we loop over m's rows
    for row in range(0, len(m)):
        bottom = 0
        if row >= sub_len:
            bottom = 1
        # now loop over each subarray that has entries for this row:
        for i in range(0, 2):
            sub_matrix = matrix_list[(bottom * 2) + i]
            sub_row = row
            if bottom == 1:
                sub_row -= sub_len
            for elem in sub_matrix[sub_row]:
                m[row].append(elem)

    return m
