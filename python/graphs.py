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

NID = 0
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
        self.pred = None
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
        self.adj_lists = {}

        for l in alist:
            nid = l[NID]
            if nid not in self.adj_lists: 
                self.adj_lists[nid] = []  # each dict entry is a list
            self.adj_lists[nid].append(Node(nid))

            for neighbor in l[ALIST]:
                self.adj_lists[nid].append(neighbor)  # just a number!

    def get_node(self, nid):
        if nid in self.adj_lists:
            return self.adj_lists[nid][0]
        else:
            return None

    def get_alist(self, nid):
        if nid in self.adj_lists:
            return self.adj_lists[nid][1:]
        else:
            return None


def bfs(g, start_id):
    """
    Breadth-first search.
    """
    for nid in g.adj_lists:
        u = g.get_node(nid)
        u.color = WHITE
        u.dist = -1
        u.pred = None

    s = g.get_node(start_id)
    s.color = GRAY
    s.dist = 0
    s.pred = None

    q = queue.Queue()
    q.put(s.nid)
    while not q.empty():
        nid = q.get()
        print("Handling vertex: " + str(nid))
        u = g.get_node(nid)
        if u is not None:
            alist = g.get_alist(nid)
            for neighbor in alist:
                v = g.get_node(neighbor)
                if v.color == WHITE:
                    v.color = GRAY
                    v.dist = u.dist + 1
                    v.pred = u
                    q.put(v.nid)

            u.color = BLACK



test_list = [[1, [2, 3, 4]],
             [2, [9, 10]],
             [3, [7, 8]],
             [4, [5, 6]],
             [5, []],
             [6, []],
             [7, []],
             [8, []],
             [9, []],
             [10, [11, 12]],
             [11, []],
             [12, []],
            ]

