#!/usr/bin/env python3
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of binary search tree
from Intro to Algorithms (Cormen et al.).
The aim here is not efficient Python implementations 
but to duplicate the pseudo-code in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
    The class definition for Node.
    The class definition for Tree.
    tree_insert()
    inorder_tree_walk()
    tree_search()
    iter_tree_search()
    tree_minimum()
    tree_maximum()
    tree_successor()
    Plus auxilliary functions that support the above.
"""

class Tree():
    """
    The binary search tree.
    """
    def __init__(self, root=None):
        self.root = root

    def __str__(self):
        return "Binary tree with root of " + str(self.root)


class Node():
    """
    The nodes in our binary search tree.
    """

    def __init__(self, k):
        """
            Args:
                k: this node's key

            Returns:
                None
        """
        self.key = k
        self.p = None
        self.left = None
        self.right = None

    def __str__(self):
        return str(self.key)


def tree_insert(t, z):
    """
    Insert a node in a bst.
    Args:
        t: the tree in which to insert
        z: the node to insert
    Return:
        None
    """
    y = None
    x = t.root

    while x is not None:
        print("Looping: x is " + str(x.key) + "; z is " + str(z.key))
        y = x
        if z.key < x.key:
            x = x.left
        else:
            x = x.right
    z.p = y
    if y is None:
        t.root = z  # the tree was empty
    elif z.key < y.key:
        y.left = z
    else:
        y.right = z
    return z


def inorder_tree_walk(x, l=None):
    """
        Walk and print the tree in order.
        Args:
            x: the node at which to start the walk
        Returns:
            None
    """
    if l is None:
        l = []
    if x is not None:
        inorder_tree_walk(x.left, l)
        l.append(x)
        print(str(x.key))
        inorder_tree_walk(x.right, l)
    return l


def tree_search(x, k):
    """
        Recursively searches a binary tree for a particular key.
        Args:
            x: the node at which to start the search
        Returns:
            None, or the node containing the key.
    """
    if x is None:
        return None
    elif k == x.key:
        return x
    elif k < x.key:
        return tree_search(x.left, k)
    else:
        return tree_search(x.right, k)


def iter_tree_search(x, k):
    """
        Iteratively searches a binary tree for a particular key.
        Args:
            x: the node at which to start the search
        Returns:
            None, or the node containing the key.
    """
    while x is not None and k != x.key:
        if k < x.key:
            x = x.left
        else:
            x = x.right
    return x


def tree_minimum(x):
    """
        Searches a tree for the node with the min key.
        Args:
            x: the node at which to start the search
        Returns:
            The node with the min key in the tree, or
            None if the tree is empty.
    """
    if x is None:
        return None
    while x.left is not None:
        x = x.left
    print("min is " + str(x.key))
    return x


def tree_maximum(x):
    """
        Searches a tree for the node with the max key.
        Args:
            x: the node at which to start the search
        Returns:
            The node with the max key in the tree, or
            None if the tree is empty.
    """
    if x is None:
        return None
    while x.right is not None:
        x = x.right
    print("max is " + str(x.key))
    return x


def tree_successor(x):

    """
        Searches a tree for the node with the smallest key
        greater than x.key.
        Args:
            x: the node at which to start the search
        Returns:
            The node with the successor key, or
            None if x has the largest key.
    """
    if x is None:
        return None
    elif x.right is not None:
        return tree_minimum(x.right)
    else:
        orig_x = x
        y = x.p
        if y is not None:
            print("Climbing tree to check " + str(y.key))
        while y is not None and x == y.right:
            x = y
            y = y.p
        print("successor of x (" + str(x.key)
              + ") is " + str(y.key))
        return y
