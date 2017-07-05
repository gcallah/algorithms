#!/usr/bin/env python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
from Quicksort.quicksort import quicksort, hoare_partition
from utils.test_utils import rand_list, assert_sorted

NUM_TESTS = 100
MAX_LIST = 100

class QuicksortTestCase(TestCase):
    def test_quicksort(self):
        for j in range(NUM_TESTS):
            l = rand_list(max_list=MAX_LIST)

            # no return!
            quicksort(l, prnt=False)
            assert_sorted(self, l)

"""
    def test_hoare(self):
        for j in range(10):
            l = rand_list(max_list=100)

            # no return!
            quicksort(l, partf=hoare_partition)
            self.assert_sorted(l)
"""

if __name__ == '__main__':
    main()
