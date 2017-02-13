"""
A little program for comparing hashing functions
"""

import random

MAX_KEY = 20200
EXP_KEYS = 10

hash_funcs = [
    lambda i: (i**2) % EXP_KEYS,
    lambda i: (i**3) % EXP_KEYS,
    lambda i: (11 * i**2) % EXP_KEYS,
    lambda i: (12 * i) % EXP_KEYS,
]

def test_funcs(max_key=MAX_KEY, exp_keys=EXP_KEYS):
    """
    Run each function against a sample; print results, collect statistics.
    """
    keys = random.sample(range(0, max_key), EXP_KEYS)

    i = 0
    for f in hash_funcs:
        hvals = []
        for k in keys:
            hvals.append(f(k))
        seen = [0]*exp_keys
        collisions = 0
        j = 0
        for v in hvals:
            print("For key = " + str(keys[j])
                  + " we got val " + str(v))
            if seen[v] == 0:
                seen[v] = 1
            else:
                collisions += 1
            j += 1

        print("______________")
        print("For function " + str(i) + " collisions = "
              + str(collisions))
        print("********************************")
        i += 1

