"""
This file contains simple functions for computing the n-th
Fibonacci number, to allow students to compare their running times.
This is not from the Introduction to Algorithms book, but was part of Prof.
Boris Aronov's syllabus, so I include it in this repository.
Functions:
    naive_fib()

"""

ops = 0


def naive_fib(n, first_call=True):
    """
        The naive, recursive way to get fibonacci numbers.
        We report on the number of "basic" operations the algorithm 
        takes to execute.
        Args:
            n: the fibonacci number to return
        Returns:
            The n-th fibonacci number.

    """
    global ops
    if first_call:
        ops = 0  # make sure we don't count some other call's operations!

    if n < 0:
        print("n must be >= 0!")
        return -1
    elif n == 0:
        return 0
    elif n == 1:
        ops += 1
        return 1
    else:
        ops += 3  # one for the addition and two for the function calls
        return naive_fib(n - 1, False) + naive_fib(n - 2, False)


def iter_fib(n):
    """
        An iterative approach to getting the n-th fibonacci number.
        Args:
            n: the fibonacci number to return
        Returns:
            The n-th fibonacci number.
    """
    ops = 0
    if n < 0:
        print("n must be >= 0!")
        return -1
    elif n == 0:
        return 0
    else:
        v = [0, 1]
        ops += 1
        for i in range(1, n):
            temp = v[0]
            v[0] = v[1]
            v[1] = v[1] + temp
            ops += 4  # three asignments and an addition
        print("Ops = " + str(ops))
        return v[1]
