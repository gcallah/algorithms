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
    The class definition for Vertex and Graph.
    bfs(): breadth-first search.
    dfs(): depth-first search.
    dfs_visit(): depth-first search helper.
    Plus auxilliary functions that support the above.
We have dfs perform a topological sort along the way.
"""

import queue

from graph import Vertex, Edge, Graph, test_graph


WHITE = 0
GRAY = 1
BLACK = 2

def init_vertices(g):
    """
    Args:
        g: graph to initialize
    Return: None
    """
    for vid in g.adj_lists:
        u = g.get_vertex(vid)
        u.color = WHITE
        u.discover = -1
        u.pred = None


def bfs(g, start_id):
    """
    Breadth-first search.
    Args:
        g: graph
        start_id: the vertex with which to start
    """
    init_vertices(g)

    s = g.get_vertex(start_id)
    s.color = GRAY
    s.discover = 0
    s.pred = None

    q = queue.Queue()
    q.put(s.vid)
    while not q.empty():
        vid = q.get()
        print("Visiting vertex: " + str(vid))
        v = g.get_vertex(vid)
        if v is not None:
            alist = g.get_alist(vid)
            for uid in alist:
                print("In loop for " + str(vid)
                      + " processing neighbor " + str(uid))
                u = g.get_vertex(uid)
                if u.color == WHITE:
                    print("Coloring " + str(u.vid) + " gray.")
                    u.color = GRAY
                    u.discover = v.discover + 1
                    u.pred = v
                    q.put(uid)

            print("Coloring " + str(vid) + " black.")
            v.color = BLACK


def print_path(g, s, v):
    """
        Trace shortest path between s and v.
        Args:
            g: graph
            s: start vertex
            v: end vertex
        Returns: None. Prints along the way.
    """
    if v == s:
        print("==> " + str(s))
    else:
        vnode = g.get_vertex(v)
        if vnode:
            if vnode.pred is None:
                print("No path exists.")
            else:
                print_path(g, s, vnode.pred.vid)
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
    init_vertices(g)
    time = 0
    for vid in g.adj_lists:
        u = g.get_vertex(vid)
        if u.color == WHITE:
            dfs_visit(g, u)
    print("Total time = " + str(time))
    print("Topological sort: " + str(topological))


def dfs_visit(g, u):
    """
    Depth-first search helper.
    Args:
        g: graph
        u: vertex to work on
    """
    print("Going to visit " + str(u.vid))

    global time
    time += 1
    u.d = time
    u.color = GRAY
    alist = g.get_alist(u.vid)
    for neighbor in alist:
        v = g.get_vertex(neighbor)
        if v.color == WHITE:
            v.pred = u
            dfs_visit(g, v)
    u.color = BLACK
    time += 1
    u.finish = time
    topological.insert(0, u.vid)

