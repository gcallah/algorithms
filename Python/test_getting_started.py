#!/Users/gcallah/miniconda/bin/python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
from GettingStarted.getting_started import merge_sort, insert_sort, bubble_sort
from utils.test_utils import rand_list, assert_sorted

NUM_TESTS = 10
MAX_LIST = 100


class SortingTestCase(TestCase):

    def test_merge(self):
        for j in range(NUM_TESTS):
            l = rand_list(max_list=MAX_LIST)
            l2 = merge_sort(l)
            assert_sorted(self, l2)

    def test_insert(self):
        for j in range(NUM_TESTS):
            l = rand_list(max_list=MAX_LIST)
            l2 = insert_sort(l)
            assert_sorted(self, l2)

    def test_bubble(self):
        for j in range(NUM_TESTS):
            l = rand_list(max_list=MAX_LIST)
            l2 = bubble_sort(l)
            assert_sorted(self, l2)

if __name__ == '__main__':
    main()
