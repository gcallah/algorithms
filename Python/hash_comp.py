"""
A little program for comparing hashing functions
"""

import random

MAX_KEY = 80
EXP_KEYS = 10

NOT_SEEN = 0
SEEN = 1


def test_funcs(max_key=MAX_KEY, exp_keys=EXP_KEYS):
    """
    Run each function against a sample; print results, collect statistics.
    """
    hash_funcs = [
        lambda i: (i**2) % exp_keys,      # f0
        lambda i: (i**3) % exp_keys,      # f1
        lambda i: (11 * i**2) % exp_keys, # f2
        lambda i: (12 * i) % exp_keys,    # f3
        lambda i: (7 * i**2) % exp_keys,      # f0
    ]
    # we can put as many hash funcs as we'd like in the above array!
    keys = random.sample(range(0, max_key), exp_keys)

    i = 0
    for f in hash_funcs:
        hvals = []
        for k in keys:
            hvals.append(f(k))
        seen = [NOT_SEEN]*exp_keys
        collisions = 0
        for (k, v) in zip(keys, hvals):
            print("For key = " + str(k)
                  + " we got val " + str(v))
            if seen[v] == NOT_SEEN:
                seen[v] = SEEN
            else:
                # hash value was seen before: collision!
                collisions += 1

        print("______________")
        print("For function " + str(i) + " collisions = "
              + str(collisions))
        print("\n********************************")
        i += 1


M = 14
P = 7
a = random.randint(1, P - 1)
b = random.randint(0, P - 1)

def test_universal(key, m=M, p=P):
    """
    Try out Carter-Wegman hash functions.
    """
    h = ((a*key + b) % p) % m
    print("For key = " + str(key)
          + " with a, b = " + str(a) + ", " + str(b)
          + " hash = " + str(h))
