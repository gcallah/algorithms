#!/Users/gcallah/anaconda/bin/python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
import quicksort as qs

l = [9, 7, 2, 6, 4, 21, 8, 15, 1, 12]
sorted = [1, 2, 4, 6, 7, 8, 9, 12, 15, 21]


class QuicksortTestCase(TestCase):

    def test_quick(self):
        # sorts in place: let's copy list first!
        my_l = list(l)
        # no return!
        qs.quicksort(my_l)
        self.assertEqual(my_l, sorted)

if __name__ == '__main__':
    main()
