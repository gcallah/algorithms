require_relative './tree'
require_relative './node'

# INDEX
#      inorder_tree_walk
#      preoder_tree_walk
#      postorder_tree_walk

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

    # Public: Prints the elements inside tree nodes in a LEFT - PARENT - RIGHT manner
    #
    # x - Node, Preferably a root node
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   inorder_tree_walk(F)
    #   => A B C D E F G H I
    def inorder_tree_walk(x)
      unless x.nil?
        inorder_tree_walk(x.left)
        p x.key
        inorder_tree_walk(x.right)
      end
    end

    # Public: Prints the elements inside tree nodes in a PARENT - LEFT - RIGHT manner
    #
    # x - Node, Preferably a root node
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   preoder_tree_walk(F)
    #   => F B A D C E G I H
    def preoder_tree_walk(x)
      unless x.nil?
        p x.key
        preoder_tree_walk(x.left)
        preoder_tree_walk(x.right)
      end
    end

    # Public: Prints the elements inside tree nodes in a LEFT - RIGHT - PARENT manner
    #
    # x - Node, Preferably a root node
    #
    # Examples
    #   NOTE: Based on the mock tree structure at LINE:61
    #   postorder_tree_walk(F)
    #   => A C E D B H I G F
    def postorder_tree_walk(x)
      unless x.nil?
        postorder_tree_walk(x.left)
        postorder_tree_walk(x.right)
        p x.key
      end
    end
  end
end
