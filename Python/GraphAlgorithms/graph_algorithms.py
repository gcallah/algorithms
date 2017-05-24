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
    issc(): returns True if graph is strongly connected.
    Plus auxilliary functions that support the above.
We have dfs perform a topological sort along the way.
"""

import queue

from utils.graph import Vertex, Edge, Graph

test_strong = [(0, 1), (1, 2), (2, 0)]
test_weak = [(0, 1), (1, 2)]

WHITE = 0
GRAY = 1
BLACK = 2

def init_vertices(g):
    """
    Args:
        g: graph to initialize
    Return: None
    """
    first_v = None
    for v in g.get_vertices():
        if first_v is None:
            first_v = v
        v.color = WHITE
        v.discover = -1
        v.pred = None
    return first_v  # just a convenience when we want someplace to start!


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
            alist = g.get_adj_list(vid)
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
topological = []

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
    topological = []  # re-initialize
    acyclical = True
    init_vertices(g)
    time = 0
    for v in g.get_vertices():
        if v.color == WHITE:
            cycle = dfs_visit(g, v)
            if cycle:
                print("Setting acyclical to false")
                acyclical = False

    print("Total time = " + str(time))
    if g.isdirected():
        if acyclical:
            print("Topological sort: " + str(topological))
        else:
            print("Graph contains a cycle; topological sort not possible.")


def dfs_visit(g, u):
    """
    Depth-first search helper.
    Args:
        g: graph
        u: vertex to work on
    Return: contains a cycle or not?
    """
    print("Going to visit " + str(u.vid))

    cycle = False
    global time
    time += 1
    u.d = time
    u.color = GRAY
    alist = g.get_adj_list(u.vid)
    for neighbor in alist:
        v = g.get_vertex(neighbor)
        if v.color == WHITE:
            v.pred = u
            c = dfs_visit(g, v)
            if c == True:
                cycle = True
        elif v.color == BLACK:
            print("Detected cycle at node " + str(v))
            cycle = True
    u.color = BLACK
    time += 1
    u.finish = time
    if not cycle and g.isdirected():
        topological.insert(0, u.vid)
    return cycle

def all_visited(verts):
    # we assume a search has been run to color vertices:
    for v in verts:
        if v.color == WHITE:
            return False
    return True

def issc(g):
    """
        Args:
            g: graph to check
        Returns:
            True if graph is strongly connected, False if not.
    """
    # if graph is not directed, just return if is is connected:
    if not g.isdirected():
        return g.isconnected()

    # for a directed graph, see if we can walk it in both directions 
    # from a random starting place:
    start = init_vertices(g)
    print("Starting dfs at: " + str(start))
    dfs_visit(g, start)

    if not all_visited(g.get_vertices()):
        return False

    t = g.transpose()
    init_vertices(t)
    print("Starting dfs at: " + str(start))
    dfs_visit(t, start)  # use the SAME start as first dfs
    return all_visited(t.get_vertices())

def strongly_connected_components(g):
    dfs(g)
    t = g.transpose()
    dfs(t)
