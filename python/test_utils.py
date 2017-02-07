"""
Utilities used by test programs.
"""

import random


def rand_list(max_list=20):
    # set up a random list of a random length
    # in the future, the range parameters should be added as parameters to
    # rand_list() as well.
    return random.sample(range(-1000, 1000), random.randint(0, max_list))

