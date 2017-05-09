#!/Users/gcallah/anaconda/bin/python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
from Quicksort.quicksort import quicksort, hoare_partition
from utils.test_utils import rand_list


class QuicksortTestCase(TestCase):

    def assert_sorted(self, l):
        for i in range(0, len(l) - 1):
            self.assertLessEqual(l[i], l[i + 1])

    def test_quicksort(self):
        for j in range(10):
            l = rand_list(max_list=100)

            # no return!
            quicksort(l)
            self.assert_sorted(l)

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
