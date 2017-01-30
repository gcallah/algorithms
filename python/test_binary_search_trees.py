#!/Users/gcallah/anaconda/bin/python3
"""
Test our binary tree code.
"""

from unittest import TestCase, main
import binary_search_trees as bt

n7 = bt.Node(7)
t = bt.Tree(n7)
n4 = bt.tree_insert(t, bt.Node(4))
n9 = bt.tree_insert(t, bt.Node(9))
n2 = bt.tree_insert(t, bt.Node(2))
n13 = bt.tree_insert(t, bt.Node(13))
n1 = bt.tree_insert(t, bt.Node(1))
n22 = bt.tree_insert(t, bt.Node(22))
n3 = bt.tree_insert(t, bt.Node(3))
n18 = bt.tree_insert(t, bt.Node(18))


class BinaryTreesTestCase(TestCase):
    def test_minimum(self):
        min = bt.tree_minimum(t.root)
        self.assertEqual(min.key, 1)

    def test_maximum(self):
        max = bt.tree_maximum(t.root)
        self.assertEqual(max.key, 22)

    def test_successor(self):
        suc = bt.tree_successor(n9)
        self.assertEqual(suc.key, 13)

    def test_inorder(self):
        inorder = [n1, n2, n3, n4, n7, n9, n13, n18, n22]
        l = bt.inorder_tree_walk(t.root)
        self.assertEqual(l, inorder)

    def test_search(self):
        node = bt.tree_search(n7, 22)
        self.assertEqual(node.key, 22)

    def test_iter_search(self):
        node = bt.tree_search(n7, 22)
        self.assertEqual(node.key, 22)

if __name__ == '__main__':
    main()
