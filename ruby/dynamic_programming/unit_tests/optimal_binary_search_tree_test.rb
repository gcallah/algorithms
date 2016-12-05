require_relative '../../unit_test'
require_relative '../optimal_binary_search_tree'

def optimal_bst_test
  p = [0.00, 0.15, 0.10, 0.05, 0.10, 0.20]
  q = [0.05, 0.10, 0.05, 0.05, 0.05, 0.10]
  k = DynamicProgramming::OBST.optimal_bst(p, q, 5)
  k.first[1][5] == 2.75
end

UnitTest::method('Optimal BST', optimal_bst_test)
