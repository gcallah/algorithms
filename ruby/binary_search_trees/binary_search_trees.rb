# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE

# INDEX
#      inorder_tree_walk
#      preoder_tree_walk
#      postorder_tree_walk
#      tree_search
#      iterative_tree_search
#      tree_minimum
#      tree_maximum
#      tree_successor
#      tree_insert
#      tree_delete -> transplant
#

# Comment the below line while running the tests. Installation steps for ruby-graphviz
# and GraphViz will be added soon to a readme file
require 'ruby-graphviz'
# Public: Analogous to a struct in C/C++ for building linked lists.
# This class only contains an initialize method which acts a constructor for
# setting and accessing the object properties
#
# There are multiple ways this can be defined, this is my personal favorite
# Other ways are listed at the bottom of the file
# Choose whatever is convenient for YOU.
#
# Examples
#   Tree.new(nil)
#   # => #<Tree:0x007ffeab2187a0 @root=nil>
class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end
end

# Public: Analogous to a struct in C/C++ for building linked lists.
# This class only contains an initialize method which acts a constructor for
# setting and accessing the object properties
#
# NOTE: Two constructors, one with satellite data and another without. The later
#       one will be used predominantly
#
# Examples
#   Node.new(10, "HELLO", nil, nil, nil)
#   # => #<Node:0x007ffeab2187a0 @key=10, @satellite_data="HELLO", @p=nil, @left=nil, @right=nil>
class Node
  attr_accessor :key, :satellite_data, :p, :left, :right
  def initialize(key, satellite_data, p, left, right)
    @key, @satellite_data, @p, @left, @right = key, satellite_data, p, left, right
  end

  #   Node.new(10, nil, nil, nil)
  #   # => #<Node:0x007ffeab2187a0 @key=10, @p=nil, @left=nil, @right=nil>
  def initialize(key, p, left, right)
    @key, @p, @left, @right = key, p, left, right
  end
end

#             TREE structure
#                  F
#                /   \
#              B      G
#            /  \      \
#          A     D      I
#              /  \    /
#             C   E   H
#   tree = Tree.new(F)   NOTE: Whole tree is assumed to have been constructed alread

# TODO: Add documentation on how to install GRAPHVIZ AND RUBY-GRAPHVIZ GEM
# Public: Same as tree_insert method only here this generates a graphical image(.PNG)
#         for tree visualization. Added a new method to not mix the actual logic with
#         this gem specific code
#
# NOTE: Images are generated at a location where the code is executed
#       Eg: If you are at /Users/whoami/Documents directory and ran the code
#           by executing ruby /algorithms/ruby/binary_trees/binary_tree.rb, then
#           images will be generated at /Users/whoami/Documents location and not
#           at the location of the ruby file
#
# t - Tree structure
# z - Node to be INSERTED
# g - GraphViz instance to draw and update the graph
def tree_insert_graphical(t, z, g)
  return if (t.nil? || z.nil? || g.nil?)
  y = nil
  x = t.root
  while !x.nil?
    y = x
    (z.key < x.key) ? (x = x.left) : (x = x.right)
  end
  z.p = y

  # TODO: Document this
  if y.nil?
    t.root = z
    g.add_nodes( "#{z.key}", "shape" => "record", "label" => "<left> left|<key> #{z.key}|<p> p|<right> right" )
  elsif z.key < y.key
    y.left = z
    g.add_nodes( "#{y.key}", "shape" => "record", "label" => "<left> left|<key> #{y.key}|<p> parent|<right> right" )
    g.add_nodes( "#{z.key}", "shape" => "record", "label" => "<left> left|<key> #{z.key}|<p> parent|<right> right" )

    g.add_edges( { "#{y.key}" => :left}, {"#{z.key}" => :key} )
    g.add_edges( { "#{z.key}" => :p}, {"#{y.key}" => :key} )
  else
    y.right = z
    g.add_nodes( "#{y.key}", "shape" => "record", "label" => "<left> left|<key> #{y.key}|<p> parent|<right> right" )
    g.add_nodes( "#{z.key}", "shape" => "record", "label" => "<left> left|<key> #{z.key}|<p> parent|<right> right" )

    g.add_edges( { "#{y.key}" => :right}, {"#{z.key}" => :key} )
    g.add_edges( { "#{z.key}" => :p}, {"#{y.key}" => :key} )
  end
end

# TEST inorder_tree_walk
#      preoder_tree_walk
#      postorder_tree_walk
#      tree_search
#      iterative_tree_search
#      tree_minimum
#      tree_maximum
#      tree_successor
#      tree_predecessor
#      tree_insert
#      tree_delete
#      tree_delete_predecessor
def unit_test_binary_tree
  node_a = Node.new('A', nil, nil, nil)
  node_b = Node.new('B', nil, nil, nil)
  node_c = Node.new('C', nil, nil, nil)
  node_d = Node.new('D', nil, nil, nil)
  node_e = Node.new('E', nil, nil, nil)
  node_f = Node.new('F', nil, nil, nil)
  node_g = Node.new('G', nil, nil, nil)
  node_h = Node.new('H', nil, nil, nil)
  node_i = Node.new('I', nil, nil, nil)
  node_j = Node.new('J', nil, nil, nil)

  tree = Tree.new(nil)

  p "--------------------  BEGIN CONSTRUCTING TREE -------------------- "
  [node_f, node_b, node_g, node_a, node_d, node_c, node_e, node_i, node_h].each_with_index do |x, i|
    tree_insert(tree, x)
  end
  p "                              F                      "
  p "                            // \\                    "
  p "                           B     G                   "
  p "                         // \\    \\                 "
  p "                         A   D     I                 "
  p "                           // \\ //                  "
  p "                           C   E H                   "

  p "--------------------  END CONSTRUCTING TREE -------------------- "

  print "\n"

  p "--------------------  BEGIN INRODER TREE WALK -------------------- "
  p inorder_tree_walk(tree.root)
  p "--------------------  END INRODER TREE WALK -------------------- "

  print "\n"

  p "--------------------  BEGIN PREORDER TREE WALK -------------------- "
  p preoder_tree_walk(tree.root)
  p "--------------------  END PREORDER TREE WALK -------------------- "

  print "\n"

  p "--------------------  BEGIN POSTORDER TREE WALK -------------------- "
  p postorder_tree_walk(tree.root)
  p "--------------------  END PREORDER TREE WALK -------------------- "

  print "\n"

  p "--------------------  BEGIN RECURSIVE TREE SEARCH -------------------- "
  p tree_search(tree.root, 'I')
  p "--------------------  END RECURSIVE TREE SEARCH -------------------- "

  print "\n"

  p "--------------------  BEGIN ITERATIVE TREE SEARCH -------------------- "
  p iterative_tree_search(tree.root, 'I')
  p "--------------------  END ITERATIVETREE SEARCH -------------------- "

  print "\n"

  p "--------------------  BEGIN SEARCHING FOR TREE MIN -------------------- "
  p tree_minimum(tree.root)
  p "--------------------  END SEARCHING FOR TREE MIN -------------------- "

  print "\n"

  p "--------------------  BEGIN SEARCHING TREE MAX -------------------- "
  p tree_maximum(tree.root)
  p "--------------------  END SEARCHING TREE MAX -------------------- "

  print "\n"

  p "--------------------  BEGIN SEARCHING FOR SUCCESSOR -------------------- "
  p tree_successor(node_g)
  p "--------------------  END SEARCHING FOR SUCCESSOR -------------------- "

  print "\n"

  p "--------------------  BEGIN SEARCHING FOR PREDECESSOR -------------------- "
  p tree_predecessor(node_g)
  p "--------------------  END SEARCHING FOR PREDECESSOR -------------------- "

  print "\n"

  p "--------------------  BEGIN NODE INSERTION -------------------- "
  tree_insert(tree, node_j)
  p "                              F                      "
  p "                            // \\                    "
  p "                           B     G                   "
  p "                         // \\    \\                 "
  p "                         A   D     I                 "
  p "                           // \\ // \\               "
  p "                           C   E H   J               "
  p "--------------------  END NODE INSERTION -------------------- "

  print "\n"

  p "--------------------  BEGIN NODE DELETION (SUCCESSOR) -------------------- "
  tree_delete(tree, node_d)
  p "                              F                      "
  p "                            // \\                    "
  p "                           B     G                   "
  p "                         // \\    \\                 "
  p "                         A   E     I                 "
  p "                           //    // \\               "
  p "                           C     H   J               "
  p "--------------------  END NODE DELETION (SUCCESSOR) -------------------- "
  preoder_tree_walk(tree.root)

  print "\n"

  p "--------------------  BEGIN NODE DELETION (PREDECESSOR) -------------------- "
  tree_delete_predecessor(tree, node_b)
  p "                              F                      "
  p "                            // \\                    "
  p "                           A     G                   "
  p "                            \\    \\                 "
  p "                             E     I                 "
  p "                           //    // \\               "
  p "                           C     H   J               "
  p "--------------------  END NODE DELETION (PREDECESSOR) -------------------- "
  preoder_tree_walk(tree.root)
end

def build_visualization_images
  node_a = Node.new('A', nil, nil, nil)
  node_b = Node.new('B', nil, nil, nil)
  node_c = Node.new('C', nil, nil, nil)
  node_d = Node.new('D', nil, nil, nil)
  node_e = Node.new('E', nil, nil, nil)
  node_f = Node.new('F', nil, nil, nil)
  node_g = Node.new('G', nil, nil, nil)
  node_h = Node.new('H', nil, nil, nil)
  node_i = Node.new('I', nil, nil, nil)
  node_j = Node.new('J', nil, nil, nil)

  tree_graphical = Tree.new(nil)

  g = GraphViz.new( :G, :type => :digraph )

  p "--------------------  BEGIN GENERATING IMAGES -------------------- "
  [node_f, node_b, node_g, node_a, node_d, node_c, node_e, node_i, node_h].each_with_index do |x, i|
    tree_insert_graphical(tree_graphical, x, g) # For image generation
    g.output( :png => "Order #{i.to_i} - Inserted #{x.key}.png", :canon => nil)
  end
  p "                              F                      "
  p "                            // \\                    "
  p "                           B     G                   "
  p "                         // \\    \\                 "
  p "                         A   D     I                 "
  p "                           // \\ //                  "
  p "                           C   E H                   "

  p "--------------------  END GENERATING IMAGES -------------------- "
end

# Uncomment the lines below to run the minimal unit tests
unit_test_binary_tree
build_visualization_images
