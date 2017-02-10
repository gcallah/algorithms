require_relative './tree'
require_relative './node'
require_relative './search'

# INDEX
#      tree_insert
#      tree_delete -> transplant
#

module BinarySearchTree
  class << self
    #             TREE structure
    #                  F
    #                /   \
    #              B      G
    #            /  \      \
    #          A     D      I
    #              /  \    /
    #             C   E   H
    #   tree = Tree.new(F)   NOTE: Whole tree is assumed to have been constructed alread

    # Public: Inserts a node at the appropriate location in the tree without not disturbing
    #         Binary search tree property
    #
    # t - Tree structure
    # z - Node to be INSERTED
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   tree_insert(t, J)
    #             TREE structure
    #                  F
    #                /   \
    #              B      G
    #            /  \      \
    #          A     D      I
    #              /  \   /  \
    #             C   E  H    J(INSERTED NODE)
    def tree_insert(t, z)
      return if (t.nil? || z.nil?)
      y = nil
      x = t.root
      while !x.nil?
        y = x
        (z.key < x.key) ? (x = x.left) : (x = x.right)
      end
      z.p = y

      if y.nil?
        t.root = z
      elsif z.key < y.key
        y.left = z
      else
        y.right = z
      end
    end

    # Public: Replaces the subtree of a node with subtree of another node
    #
    # t - Tree structure
    # u - Node which gets replaced
    # v - Node which replaces u
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61 with an inserted node J
    #        transplant(t, G, I)
    #                F
    #              /   \
    #             B     I
    #            / \   / \
    #           A   D H   J
    #              / \
    #             C   E
    def transplant(t, u, v)
      return if (u.nil? || v.nil? || t.nil?)
      if u.p.nil?
        t.root = v
      elsif u == u.p.left
        u.p.left = v
      else
        u.p.right = v
      end
      v.p = u.p unless v.nil?
    end

    # Public: Deletes a node at the appropriate location in the tree without disturbing
    #         Binary search tree property
    # NOTE: Uses SUCCESSOR transplant i.e next largest element to the deletable node
    #
    # t - Tree structure
    # z - Node to be DELETED
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61 with an inserted node J
    #                        TREE structure
    #                                F
    #                              /   \
    #                             B     G
    #                            / \     \
    #                           A   D     I
    #                              / \   / \
    #                             C   E H   J
    # tree_delete(t, F)        tree_delete(t, B)           tree_delete(t, D)
    #       G                        F                           F
    #     /   \                    /   \                       /   \
    #    B     I                  C     G                     B     G
    #   / \   / \                / \     \                   / \     \
    #  A   D H   J              A   D     I                 A   E     I
    #     / \                        \   / \                   /     / \
    #    C   E                        E H   J                 C     H   J
    def tree_delete(t, z)
      return if z.nil?
      if z.left.nil?
        transplant(t, z, z.right)
      elsif z.right.nil?
        transplant(t, z, z.left)
      else
        y = BinarySearchTree::tree_minimum(z.right)
        if y.p != z
          transplant(t, y, y.right)
          y.right = z.right
          y.right.p = y
        end
        transplant(t, z, y)
        y.left = z.left
        y.left.p = y
      end
    end

    # Public: Deletes a node at the appropriate location in the tree without disturbing
    #         Binary search tree property
    # NOTE: Uses PREDECESSOR transplant i.e next largest element to the deletable node
    #
    # t - Tree structure
    # z - Node to be DELETED
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61 with an inserted node J
    #                        TREE structure
    #                                F
    #                              /   \
    #                             B     G
    #                            / \     \
    #                           A   D     I
    #                              / \   / \
    #                             C   E H   J
    # tree_delete(t, F)        tree_delete(t, B)           tree_delete(t, D)
    #       E                        F                           F
    #     /   \                    /   \                       /   \
    #    B     G                  A     G                     B     G
    #   / \     \                  \     \                   / \     \
    #  A   D     I                  D     I                 A   C     I
    #     /     / \                / \   / \                     \   / \
    #    C     H   J              C  E H   J                     E   H   J
    def tree_delete_predecessor(t, z)
      if z.left.nil?
        transplant(t, z, z.right)
      elsif z.right.nil?
        transplant(t, z, z.left)
      else
        y = BinarySearchTree::tree_maximum(z.left)
        if y.p != z
          transplant(t, y, y.left)
          y.left = z.left
          y.left.p = y
        end
        transplant(t, z, y)
        y.right = z.right
        y.right.p = y
      end
    end
  end
end
