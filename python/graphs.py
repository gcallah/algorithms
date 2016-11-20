#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of graphs
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
    Plus auxilliary functions that support the above.
"""

WHITE = 0
GRAY = 1
BLACK = 2


class Node():
    """
    The nodes in our graph.
    """

    def __init__(self, num):
        """
            Args:
                k: this node's key

            Returns:
                None
        """
        self.num = num
        self.color = WHITE
        self.pred = NIL
        self.dist = -1


class Graph():
    """
    The graph structure, here an adjacency list.
    """
    self.adj_list = []


def bfs(g, s):
    """
    Breadth-first search.
    """
