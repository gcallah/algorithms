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
from utils.graph import Graph, Edge


def mst_prim(g):
    """
        Args:
            g: the graph for which we are creating a minimum spanning tree
            r: the root of the MST
        Return:
            ?
    """
