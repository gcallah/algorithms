"""
Utilities used by test programs.
"""

import random


def rand_list(max_list=20):
    # set up a random list
    return random.sample(range(-1000, 1000), random.randint(0, max_list))

