#!/Users/gcallah/anaconda/bin/python3
"""
Test our heap code.
"""

from unittest import TestCase, main
from utils.graph import Graph, Edge, graph_from_alist, test_alist
from .approximation_algorithms import approx_vertex_cover


class ApproximationTestCase(TestCase):
    def test_approx_vertex_cover(self):
        g = graph_from_alist(test_alist)
        cover_set = approx_vertex_cover(g)
        self.assertEqual(True, g.iscover(cover_set))


if __name__ == '__main__':
    main()
