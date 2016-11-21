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

import queue


WHITE = 0
GRAY = 1
BLACK = 2

NODE = 0
ALIST = 1


class Node():
    """
    The nodes in our graph.
    """

    def __init__(self, nid):
        """
            Args:
                k: this node's key

            Returns:
                None
        """
        self.nid = nid
        self.color = WHITE
        self.pred = NIL
        self.dist = -1


class Graph():
    """
    The graph structure, here an adjacency list.
    """

    def __init__(self, alist):
        """
        Args:
            alist: a list of ints for the nodes and a list of what they are
            connected to.
        """
        # the following item is a heterogeneous list. The first item is a node,
        # but the rest of the items are just node ids.
        self.adj_list = {}

        for nid in alist:
            if nid[NODE] not in self.adj_list: 
                self.adj_list[nid] = []  # each dict entry is a list
            self.adj_list[nid].append(Node(nid))

            for neighbor in nid[ALIST]:
                self.adj_list[nid].append(neighbor)  # just a number!

    def get_node(self, nid):
        if nid in self.adj_list:
            return self.adj_list[nid][0]
        else:
            return None

    def get_alist(self, nid):
        if nid in self.adj_list:
            return self.adj_list[nid][1:]
        else:
            return None


def bfs(g, s):
    """
    Breadth-first search.
    """
    for u in g:
        u.color = WHITE
        u.dist = -1
        u.pred = None

    s.color = GRAY
    s.dist = 0
    s.pred = None

    q = new Queue()
    q.push(s.nid)
    while not q.empty():
        nid = q.get()
        u = g.get_node(nid)
        if u is not None:
            alist = g.get_list(nid)
            for neighbor in alist:
                v = g.get_node(neighbor)
                v.color = GRAY
                v.dist = u.dist + 1
                v.pred = u
                q.push(v.nid)

            u.color = BLACK



test_list = [[1, [2, 5]],
             [2, [1, 5, 3, 4]],
             [3, [2, 4]],
             [4, [2, 5, 3]],
             [5, [4, 1, 2]]
            ]

