require_relative './tree'
require_relative './node'

# INDEX
#      tree_search
#      iterative_tree_search
#      tree_minimum
#      tree_maximum
#      tree_successor


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

    # Public: Traverses and finds the element if present by using the Binary tree
    #         property - lesser elements on left and greater elements on right
    #         Recursive strategy
    #
    # x - Node, Preferably a root node
    # k - Key to be searched
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   tree_search(F, 'I')
    #   => I
    def tree_search(x, k)
      return x if (x.nil? || k == x.key)
      return (k < x.key) ? tree_search(x.left, k) : tree_search(x.right, k)
    end

    # Public: Traverses and finds the element if present by using the Binary tree
    #         property - lesser elements on left and greater elements on right
    #         Iterative strategy
    #
    # x - Node, Preferably a root node
    # k - Key to be searched
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   tree_search(F, 'I')
    #   => I
    def iterative_tree_search(x, k)
      while !x.nil? && k != x.key
        x = (k < x.key) ? x.left : x.right
      end
      x
    end

    # Public: Traverses to LEFT and finds the minimum element using the Binary tree
    #         property - lesser elements on left and greater elements on right
    #
    # Node, Root/Subtree node
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   tree_minimum(F)
    #   => A
    def tree_minimum(x)
      return if x.nil?
      while !x.left.nil?
        x = x.left
      end
      x
    end

    # Public: Traverses to RIGHT and finds the maximum element using the Binary tree
    #         property - lesser elements on left and greater elements on right
    #
    # Node, Root/Subtree node
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   tree_maximum(F)
    #   => H
    def tree_maximum(x)
      return if x.nil?
      while !x.right.nil?
        x = x.right
      end
      x
    end

    # Public: Finds the next biggest element to the given node in a Binary tree
    #
    # Node, Root/Subtree node
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   tree_successor(F)
    #   => G
    def tree_successor(x)
      return if x.nil?
      return tree_minimum(x.right) unless x.right.nil?
      y = x.p
      while !y.nil? && x == y.right
        x = y
        y = y.p
      end
      y
    end

    # Public: Finds the highest element that is just smaller than the provided node
    #
    # Node, Root/Subtree node
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   tree_predecessor(F)
    #   => E
    def tree_predecessor(x)
      return if x.nil?
      return tree_maximum(x.left) unless x.left.nil?
      y = x.p
      while !y.nil? && x == y.left
        x = y
        y = y.p
      end
      y
    end
  end
end
