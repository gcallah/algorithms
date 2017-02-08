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
    The class definition for Node and Graph.
    bfs(): breadth-first search.
    dfs(): depth-first search.
    dfs_visit(): depth-first search helper.
    Plus auxilliary functions that support the above.
We have dfs perform a topological sort along the way.
"""

import queue


WHITE = 0
GRAY = 1
BLACK = 2

NID = 0
ALIST = 1


test_graph = [[1, [2, 3, 4]],
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
        self.discover = -1
        self.finish = -1


class Edge():
    """
    The edges of our graph.
    """
    def __init__(self, v1, v2):
        self.v1 = v1
        self.v2 = v2

    def __str__(self):
        return str(self.v1) + "<-->" + str(self.v2)

    def get_vertices(self):
        return (self.v1, self.v2)

    def is_incident(self, v):
        return (v == self.v1) or (v == self.v2)


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
        self.edges = []

        for l in alist:
            nid = l[NID]
            if nid not in self.adj_lists: 
                self.adj_lists[nid] = []  # each dict entry is a list
            self.adj_lists[nid].append(Node(nid))

            for neighbor in l[ALIST]:
                self.adj_lists[nid].append(neighbor)  # just a number!
                self.edges.append(Edge(nid, neighbor))

    def get_node(self, nid):
        if nid in self.adj_lists:
            return self.adj_lists[nid][NID]
        else:
            return None

    def get_alist(self, nid):
        if nid in self.adj_lists:
            return self.adj_lists[nid][ALIST:]
        else:
            return None

    def get_edges(self):
        return self.edges


def init_nodes(g):
    """
    Args:
        g: graph to initialize
    Return: None
    """
    for nid in g.adj_lists:
        u = g.get_node(nid)
        u.color = WHITE
        u.discover = -1
        u.pred = None


def bfs(g, start_id):
    """
    Breadth-first search.
    Args:
        g: graph
        start_id: the vertext with which to start
    """
    init_nodes(g)

    s = g.get_node(start_id)
    s.color = GRAY
    s.discover = 0
    s.pred = None

    q = queue.Queue()
    q.put(s.nid)
    while not q.empty():
        nid = q.get()
        print("Visiting vertex: " + str(nid))
        u = g.get_node(nid)
        if u is not None:
            alist = g.get_alist(nid)
            for neighbor in alist:
                v = g.get_node(neighbor)
                if v.color == WHITE:
                    print("Coloring " + str(v.nid) + " gray.")
                    v.color = GRAY
                    v.discover = u.discover + 1
                    v.pred = u
                    q.put(v.nid)

            print("Coloring " + str(u.nid) + " black.")
            u.color = BLACK


def print_path(g, s, v):
    """
        Trace shortest path between s and v.
        Args:
            g: graph
            s: start
            v: end vertext
        Returns: None. Prints along the way.

    """
    if v == s:
        print("==> " + str(s))
    else:
        vnode = g.get_node(v)
        if vnode:
            if vnode.pred is None:
                print("No path exists.")
            else:
                print_path(g, s, vnode.pred.nid)
                print("==> " + str(v))


time = 0
topological = None

def dfs(g):
    """
    Depth-first search.
    We include topological sorting here.
    Args:
        g: graph
    Returns: topologically sorted list.
    """
    global time
    global topological
    topological = []
    init_nodes(g)
    time = 0
    for nid in g.adj_lists:
        u = g.get_node(nid)
        if u.color == WHITE:
            dfs_visit(g, u)
    print("Total time = " + str(time))
    print("Topological sort: " + str(topological))


def dfs_visit(g, u):
    """
    Depth-first search helper.
    Args:
        g: graph
        u: vertext to work on
    """
    print("Going to visit " + str(u.nid))

    global time
    time += 1
    u.d = time
    u.color = GRAY
    alist = g.get_alist(u.nid)
    for neighbor in alist:
        v = g.get_node(neighbor)
        if v.color == WHITE:
            v.pred = u
            dfs_visit(g, v)
    u.color = BLACK
    time += 1
    u.finish = time
    topological.insert(0, u.nid)

