#!/Users/gcallah/anaconda/bin/python3
"""
Test our heap code.
"""

from unittest import TestCase, main
from graph_algorithms import Graph, Edge, test_graph
from approximation_algorithms import approx_vertex_cover


class ApproximationTestCase(TestCase):
    def test_approx_vertex_cover(self):
        g = Graph(test_graph)
        cover_set = approx_vertex_cover(g)
        self.assertEqual(True, g.is_cover(cover_set))


if __name__ == '__main__':
    main()
