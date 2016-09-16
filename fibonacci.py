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
        print("n must be > 0!")
        return -1
    elif n == 0:
        return 0
    elif n == 1:
        ops += 1
        return 1
    else:
        ops += 3  # one for the addition and two for the function calls
        return naive_fib(n - 1, False) + naive_fib(n - 2, False)

