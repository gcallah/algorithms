#!/Users/gcallah/anaconda/bin/python3
"""
Test our heap code.
"""

from unittest import TestCase, main
from Heapsort.heapsort import heapsort, build_heap, heap_extract_extr
from utils.test_utils import rand_list

NUM_TESTS = 10
MAX_LIST = 100


class HeapsortTestCase(TestCase):
    def test_heapsort(self):
        for j in range(NUM_TESTS):
            l = rand_list(max_list=MAX_LIST)

            # no return!
            heapsort(l)

            for i in range(0, len(l) - 1):
                self.assertLessEqual(l[i], l[i + 1])

    def test_heap_extract_extr(self):
        for j in range(NUM_TESTS):
            l = rand_list(max_list=MAX_LIST)
            build_heap(l)  # heapifies l in place
            out = []
            for i in range(0, len(l)):
                out.append(heap_extract_extr(l))

            for i in range(0, len(out) - 1):
                self.assertGreaterEqual(out[i], out[i + 1])


if __name__ == '__main__':
    main()
