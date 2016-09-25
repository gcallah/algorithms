#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of hashing algorithms from
Intro to Algorithms direct_address_search(Cormen et al.)
The aim here is not efficient Python implementations (we'd just call
the native sort if we wanted that) but to duplicate the pseudo-code
in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
I have been helped by code from http://interactivepython.org/
in creating these examples.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
    direct_address_search()
    direct_address_insert()
    direct_address_delete()
    direct_address_guessing()
"""

import random


def direct_address_search(t, k):
    """
        Find the value for a key.
        Args:
            t: our dictionary
            k: our key
        Returns:
            The value associated with the key.
        Performance:
            O(1)
    """
    return t[k]


def direct_address_insert(t, k, x):
    """
        Insert a value for a key.
        Args:
            t: our dictionary
            k: our key
            x: the value to insert at k

        Returns:
            None
    """
    t[k] = x


def direct_address_delete(t, k):
    """
        Remove a value for a key.
        Args:
            t: our dictionary
            k: our key
        Returns:
            None
    """
    t[k] = None


def direct_address_guessing(n):
    """
        Guess a number; numbers already guessed are rejected.
        Args:
            n: max number
        Returns:
            None
    """
    answer = random.randint(1, n)
    guesses = [None for x in range(n + 1)]
    print("Use Ctrl-C to stop guessing.")
    while True:
        guess = int(input("Guess a number between 1 and %d: " % (n)))
        if guess < 1:
            print("Number too small!")
        elif guess > n:
            print("Number too large!")
        else:
            x = direct_address_search(guesses, guess)
            if x is None:
                if guess == answer:
                    print("You've guessed it!")
                    break
                else:
                    direct_address_insert(guesses, guess, True)
            else:
                print("You already guessed that!")

