"""
This file contains simple functions for computing the n-th
Fibonacci number, to allow students to compare their running times.
This is not from the Introduction to Algorithms book, but was part of Prof.
Boris Aronov's syllabus, so I include it in this repository.
Functions:
    naive_fib()
    memo_fib()
    iter_fib()
    closed_form_fib(n):
"""

ops = 0


def naive_fib(n, first_call=True):
    """
        The naive, recursive way to get fibonacci numbers.
        We report on the number of "basic" operations the algorithm 
        takes to execute.
        Args:
            n: the fibonacci number to return
            first_call: Is this the top-level call to this function?
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
        ops += 1
        return 0
    elif n == 1:
        ops += 1
        return 1
    else:
        ops += 5  # one for the addition, two for the function calls
                  # and two for the subtractions
        return naive_fib(n - 1, False) + naive_fib(n - 2, False)


results = []

def memo_fib(n, first_call=True):
    """
        A memo-ized version of naive fib, that runs much faster.

        Args:
            n: the fibonacci number to return
            first_call: Is this the top-level call to this function?
        Returns:
            The n-th fibonacci number.
    """
    global ops
    global results
    if first_call:
        ops = 0  # make sure we don't count some other call's operations!
        results = [-1 for x in range(1000)]

    if n < 0:
        print("n must be >= 0!")
        return -1
    elif n == 0:
        ops += 1
        return 0
    elif n == 1:
        ops += 1
        return 1
    else:
        # Here we check and see if we have calculated the results
        # we need earlier. If so, use them. If not, calculate and
        # then store ("memo-ize") them.
        n_minus_one = 0
        n_minus_two = 0
        if results[n - 1] >= 0:
            ops += 3  # if, assignment, and subtraction
            n_minus_one = results[n - 1]
        else:
            ops += 5  # two assignments, two subtractions, function call
            n_minus_one = memo_fib(n - 1, False)
            results[n - 1] = n_minus_one
        if results[n - 2] >= 0:
            ops += 3  # if, assignment, and subtraction
            n_minus_two = results[n - 2]
        else:
            ops += 5  # two assignments, two subtractions, function call
            n_minus_two = memo_fib(n - 2, False)
            results[n - 2] = n_minus_two

        ops += 1
        return n_minus_one + n_minus_two


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


def closed_form_fib(n):
    """
        Closed form method to get the n-th fibonacci number.
        Args:
            n: the fibonacci number to return
        Returns:
            The n-th fibonacci number.
    """
    sqrt_five = 5 ** .5
    return (1 / sqrt_five) * (((1 + sqrt_five) / 2) ** n
                              - ((1 - sqrt_five) / 2) ** n)

