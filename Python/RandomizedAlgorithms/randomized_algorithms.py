#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of randomized algorithms from
Intro to Algorithms (Cormen et al.).
The aim here is not efficient Python implementations
but to duplicate the pseudo-code
in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
    hire_assistant()
    simulate_hires()

    Plus auxilliary functions that support the above.
"""

import math
import random


def hire_assistant(n, suppress_msgs=False):
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
    ICOST = .01  # fixed cost to do an interview
    HCOST = 1.0  # fixed cost to do a hire
    cost_i = 0.0
    cost_h = 0.0
    best = 0
    candidates = list(range(1, n + 1))
    random.shuffle(candidates)
    for candidate in candidates:
        if not suppress_msgs:
            print("Comparing candidates " + str(candidate) + " and " + str(best))
        cost_i += ICOST
        if candidate > best:
            if not suppress_msgs:
                print("Hiring new candidate: " + str(candidate))
            best = candidate
            cost_h += HCOST

    cost = cost_i + cost_h
    if not suppress_msgs:
        print("Costs: interviewing = $%0.2f; hiring = $%0.2f; total = $%0.2f" 
              % (cost_i, cost_h, cost))
    return cost_h


def simulate_hires(ntrials, ncand):
    """
        Runs hire_assistant() n times, with pool size of POOL_SIZE,
        and collects statistics on candidates interviewed and total hiring
        cost.
        Args:
            ntrials: number of simulations to run
            ncand: number of candidates to interview
        Returns:
            None
    """
    tot_hcost = 0
    tot_candidates = 0
    for i in range(0, ntrials):
        tot_hcost += hire_assistant(ncand, True)
        tot_candidates += ncand

    avg_cost = tot_hcost / ntrials
    print("We interviewed %d candidates at an avg. hiring cost of $%0.2f per %d cand."
          % (tot_candidates, avg_cost, ncand))
    print("log n = " + str(math.log(ncand)))
