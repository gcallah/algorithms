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

import math
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
        Performance:
            O(1)
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
        Performance:
            O(1)
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


"""
We provide a small hashtable and a function for clearing it.
The students can also declare their own, of whatever size they want.
They will then have to manage it themselves.
"""
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


A = ((5.0**.5) - 1) / 2.0  # Knuth's suggestion for a good value of A

def mult_hash(k, ts):
    """
        Hashing using the multiplication method.
        Since Python integers potentially have an infinite number of bits,
        it is not clear how to implement the bit-shifing method here.
        So we have just done the hashing by writing h(k) = floor(m (k A mod 1))
        directly.
        Args:
            k: the key to hash
            ts: table size

        Returns:
            The hashed version of the key.

    """
    hindex = math.floor(ts * ((k * A) % 1))
    print("A = " + str(A) + "; hindex = " + str(hindex))
    return hindex


KEY = 0
VAL = 1

DIV = 0
MULT = 1
dm = DIV


def h(k, ts):
    """
        Our hash function.
        Args:
            k: key to hash (for now, we only accept strings!)
            ts: Table Size
        Returns:
            Hashed version of k.
    """
    if dm == DIV:
        return div_hash(string_to_int(k), ts)
    else:
        return mult_hash(string_to_int(k), ts)


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
            print("Checking key: " + str(kv_pair[KEY]))
            if kv_pair[KEY] == k:
                key_exists = True
                kv_pair[VAL] = x

        if not key_exists:
            print("Inserting at index: " + str(hindex))
            chain.append([k, x])  # we must append both k and x!


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
        print("Looking at key: " + kv_pair[KEY])
        if kv_pair[KEY] == k:
            return kv_pair[VAL]

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
        if kv_pair[KEY] == k:
            del l[i]
        i += 1


"""
Here are our open hashing functions. CLRS simply returns the hash
key's index. At the index is only the hash key itself. Thus, they pseudo-code
a completely useless hash table, since if we look up "Rahul", we get back
the index of "Rahul," and if we retrieve what is at that index, the answer
is... "Rahul"! But if I already have Rahul at hand, I certainly don't need
to search a hash table to retrieve... Rahul. Thus, we added an actual value,
which does not really complicate the pseudo-code very much.
Also, their naming here breaks the pattern they have established with
"direct_addr" and "chained" by not using the prefix "open" so we use it.
We also want our own table for the open addressing functions, since we want to
initialize to None, not an empty list.
"""

TABLE_SIZE = 15
otable = [None for x in range(TABLE_SIZE)]


def linear_h(k, i, m):
    """
        Implements linear probing.
        Args:
            k: the key
            i: the index of the slot to check.
            m: the table size
        Returns:
            The value associated with k.

    """
    return (h(k, m) + i) % m


def open_hash_insert(t, k, x):
    """
        Args:
            t: our dictionary
            k: our key (for now, we only accept strings!)
            x: the value to insert at k
        Returns:
            The index at which we have inserted (k, x).
    """
    m = len(t)
    i = 0
    print("Launching search with i = " + str(i)
          + " and m = " + str(m))

    while i <= m:
        j = linear_h(k, i, m)
        print("Looking to see if slot " + str(j) + " is used.")
        if t[j] is None:
            t[j] = [k, x]
            return j
        else:
            i += 1
    print("Hash table is full!")


def open_hash_search(t, k):
    """
        Args:
            t: our dictionary
            k: our key (for now, we only accept strings!)
        Returns:
            The value at t(k).
    """
    m = len(t)
    i = 0
    while i <= m:
        j = linear_h(k, i, m)
        if t[j] is None:
            return None
        elif t[j][KEY] == k:
            return t[j][VAL]
        i += 1
    return None
