#!/Users/gcallah/anaconda/bin/python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
import sorting as srt

l = [9, 7, 2, 6, 4, 21, 8, 15, 1, 12]
sorted = [1, 2, 4, 6, 7, 8, 9, 12, 15, 21]


class SortingTestCase(TestCase):
    def test_swap(self):
        srt.swap(l, 2, 4)
        self.assertEqual(l[2], 4)
        self.assertEqual(l[4], 2)

    def test_merge(self):
        l2 = srt.merge_sort(l)
        self.assertEqual(l2, sorted)

    def test_insert(self):
        # sorts in place: let's copy list first!
        my_l = list(l)
        l2 = srt.insert_sort(my_l)
        self.assertEqual(l2, sorted)

    def test_bubble(self):
        # sorts in place: let's copy list first!
        my_l = list(l)
        l2 = srt.bubble_sort(my_l)
        self.assertEqual(l2, sorted)

    def test_quick(self):
        # sorts in place: let's copy list first!
        my_l = list(l)
        # no return!
        srt.quicksort(my_l)
        self.assertEqual(my_l, sorted)

if __name__ == '__main__':
    main()
