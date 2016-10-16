#!/usr/bin/env python
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
    The class definition for BinTree.
    tree_insert()
    inorder_tree_walk()
    tree_search()
    Plus auxilliary functions that support the above.
"""

class Tree():
    """
    The binary search tree.
    """
    root = None


class Node():
    """
    The nodes in our binary search tree.
    """
    key = None
    p = None
    left = None
    right = None

    def __init__(self, k):
        """
            Args:
                k: this node's key

            Returns:
                None
        """
        self.key = k


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


def inorder_tree_walk(x):
    """
        Walk and print the tree in order.
        Args:
            x: the node at which to start the walk
        Returns:
            None
    """
    if x is not None:
        inorder_tree_walk(x.left)
        print(str(x.key))
        inorder_tree_walk(x.right)
    
    
def tree_search(x, k):
    """
        Searches a binary tree for a particular key.
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




