#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of randomized algorithms from
Intro to Algorithms (Cormen et al.).
The aim here is not efficient Python implementations (we'd just call
the native sort if we wanted that) but to duplicate the pseudo-code
in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
    direct_addr_search()
    direct_addr_insert()
    direct_addr_delete()
    direct_addr_guessing()

    chained_hash_insert()
    chained_hash_search()
    chained_hash_delete()

    open_hash_insert()
    open_hash_search()

    Plus auxilliary functions that support the above.
"""

import random


def hire_assistant(n):
    """
        We have to interview a new assistant every day. If the interviewee is
        better than the current assistant, we fire the old, bring in the new.
        Interviewing has a low fixed cost, while hiring has a high fixed cost.
        We get candidates in random order.
        Args:
            n: number of possible assistants
        Returns:
            Cost of hiring process.
    """
    ICOST = 1  # fixed cost to do an interview
    HCOST = 10  # fixed cost to do a hire
    cost_i = 0
    cost_h = 0
    best = 0
    candidates = list(range(1, n + 1))
    random.shuffle(candidates)
    for candidate in candidates:
        print("Comparing candidates " + str(candidate) + " and "
              + str(best))
        cost_i += ICOST
        if candidate > best:
            print("Hiring new candidate: " + str(candidate))
            best = candidate
            cost_h += HCOST

    cost = cost_i + cost_h
    print("Costs: interviewing = $" + str(cost_i) + "; hiring = $" + str(cost_h)
          + " total = $" + str(cost))

