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
