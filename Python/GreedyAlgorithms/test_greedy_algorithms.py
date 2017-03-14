#!/Users/gcallah/anaconda/bin/python3
"""
Test our heap code.
"""

from unittest import TestCase, main
from greedy_algorithms import recursive_activity_selector
from greedy_algorithms import greedy_activity_selector

s = [0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
f = [0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16]
opt = [1, 4, 8, 11]


class GreedyTestCase(TestCase):
    def test_recursive_activity_selector(self):
        out = recursive_activity_selector(s, f, 0)
        self.assertEqual(out, opt)

    def test_greedy_activity_selector(self):
        out = greedy_activity_selector(s, f)
        self.assertEqual(out, opt)

if __name__ == '__main__':
    main()
