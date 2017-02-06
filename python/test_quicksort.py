#!/Users/gcallah/anaconda/bin/python3
"""
Test our sorting code.
"""

import random
from unittest import TestCase, main
import quicksort as qs


class QuicksortTestCase(TestCase):

    def test_quick(self):
        for j in range(10):
            # set up a random list
            n = random.randint(0, 100)
            my_l = random.sample(range(1, 1000), n)
    
            # no return!
            qs.quicksort(my_l)
    
            for i in range(0, n - 1):
                self.assertLessEqual(my_l[i], my_l[i + 1])

if __name__ == '__main__':
    main()
