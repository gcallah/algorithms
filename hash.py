#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of hashing algorithms from
Intro to Algorithms direct_addr_search(Cormen et al.)
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
    direct_addr_search()
    direct_addr_insert()
    direct_addr_delete()
    direct_addr_guessing()
    chained_hash_insert()
    chained_hash_search()
    chained_hash_delete()
"""

import random


def direct_addr_search(t, k):
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


def direct_addr_insert(t, k, x):
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


def direct_addr_delete(t, k):
    """
        Remove a value for a key.
        Args:
            t: our dictionary
            k: our key
        Returns:
            None
    """
    t[k] = None


def direct_addr_guessing(n):
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
            x = direct_addr_search(guesses, guess)
            if x is None:
                if guess == answer:
                    print("You've guessed it!")
                    break
                else:
                    print("That's not it!")
                    direct_addr_insert(guesses, guess, True)
            else:
                print("You already guessed that!")


def string_to_int(s):
    """
        Turns a string into an integer for hashing.
        Args:
            s: the string
        Returns:
            The int value of the string.
    """
    int_val = 0
    i = 0    # place in string
    ASCII = 128

    for letter in s:
        digit = ord(letter) * ASCII**i
        # print("Next digit is: " + str(digit))
        int_val += digit
        i += 1
    return int_val


TABLE_SIZE = 13  # we want a prime not near a power of two
                 # we are making table small deliberately to get collisions!
htable = [[] for x in range(TABLE_SIZE)]


def clear_htable():
    """
        Clears the global hash table.
        Args:
            None

        Returns:
            None

    """

    htable = [[] for x in range(TABLE_SIZE)]


def div_hash(k, ts):
    """
        Hashing using the division method.
        Args:
            k: the key to hash
            ts: table Size
        Returns:
            The hashed version of the key.
    """
    return k % ts


def mult_hash(k, ts):
    """
        Hashing using the multiplication method.
        Args:
            k: the key to hash
            ts: table size

        Returns:
            The hashed version of the key.

    """
    pass


DIV = 0
MULT = 1


def h(k, ts, div_or_mult=DIV):
    """
        Our hash function.
        Args:
            k: key to hash (for now, we only accept strings!)
            ts: Table Size
        Returns:
            Hashed version of k.
    """
    return div_hash(string_to_int(k), ts)


def chained_hash_insert(t, k, x):
    """
        Args:
            t: our dictionary
            k: our key (for now, we only accept strings!)
            x: the value to insert at k

        Returns:
            None
    """

    hindex = h(k, len(t))
    chain = t[hindex]
    key_exists = False
    if len(chain)  == 0:
        print("Inserting at index: " + str(hindex))
        chain.append([k, x])  # we must append both k and x!
    else:
        for kv_pair in chain:
            print("Checking key: " + str(kv_pair[K]))
            if kv_pair[K] == k:
                key_exists = True
                kv_pair[X] = x

        if not key_exists:
            print("Inserting at index: " + str(hindex))
            chain.append([k, x])  # we must append both k and x!

K = 0
X = 1


def chained_hash_search(t, k):
    """
        Find a value in our hash table.
        Args:
            t: our dictionary
            k: our key (for now, we only accept strings!)

        Returns:
            The value associated with k or None.

    """
    hindex = h(k, len(t))
    chain = t[hindex]
    for kv_pair in chain:
        print("Looking at key: " + kv_pair[K])
        if kv_pair[K] == k:
            return kv_pair[X]

    return None


def chained_hash_delete(t, k):
    """
        Args:
            t: our dictionary
            k: our key (for now, we only accept strings!)

        Returns:
            None

    """
    hindex = h(k, len(t))
    chain = t[hindex]
    i = 0
    for kv_pair in chain:
        if kv_pair[K] == k:
            del l[i]
        i += 1

