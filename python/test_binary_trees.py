#!/Users/gcallah/anaconda/bin/python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
import binary_trees as bt

fibs = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987]


class BinaryTreesTestCase(TestCase):
    def test_naive(self):
        fnum = 13
        n = fib.naive_fib(fnum)
        self.assertEqual(fibs[fnum], n)


if __name__ == '__main__':
    main()
