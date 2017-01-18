#!/Users/gcallah/anaconda/bin/python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
import fibonacci as fib

fibs = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987]


class FibonacciTestCase(TestCase):
    def test_naive(self):
        fnum = 13
        n = fib.naive_fib(fnum)
        self.assertEqual(fibs[fnum], 1)

    def test_memo(self):
        fnum = 14   # might as well try different numbers
        n = fib.memo_fib(fnum)
        self.assertEqual(fibs[fnum], n)

    def test_iter(self):
        fnum = 11   # might as well try different numbers
        n = fib.iter_fib(fnum)
        self.assertEqual(fibs[fnum], n)

    def test_closed_form(self):
        fnum = 15   # might as well try different numbers
        n = fib.closed_form_fib(fnum)
        self.assertEqual(fibs[fnum], n)


if __name__ == '__main__':
    main()
