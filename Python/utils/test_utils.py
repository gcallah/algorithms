"""
Utilities used by test programs.
"""

import random


def rand_list(max_list=20, lrange=-1000, hrange=1000):
    # set up a random list of a random length
    return random.sample(range(lrange, hrange), random.randint(0, max_list))

def assert_sorted(testobj, l):
    for i in range(0, len(l) - 1):
        testobj.assertLessEqual(l[i], l[i + 1])

