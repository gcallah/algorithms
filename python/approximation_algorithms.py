#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""
This file contains Python implementations of 
approximation algorithms from Intro to Algorithms (Cormen et al.).
The aim here is not efficient Python implementations 
but to duplicate the pseudo-code in the book as closely as possible.
Also, since the goal is to help students to see how the algorithm
works, there are print statements placed at key points in the code.
The performance of each function is stated in the docstring, and
loop invariants are expressed as assert statements when they
are not too complex.
This file contains:
"""

import random
from graph_algorithms import Graph, Node, Edge


def approx_vertex_cover(g):
    """
        Args:
            g: the graph for which we are creating a vertex cover
        Return:
            c: the cover set we return
    """
    c = []
    edges = g.get_edges()
    while len(edges) > 0:
        e = random.choice(edges)  # choose a random edge
        (u, v) = e.get_vertices()
        c.append((u, v))
        for edge in edges:
            if edge.is_incident(u) or edge.is_incident(v):
                pass

    return c

