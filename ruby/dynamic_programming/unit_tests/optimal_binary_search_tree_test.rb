require_relative '../optimal_binary_search_tree'
require 'minitest/autorun'

class OptimalBinarySearchTreeTest < Minitest::Test
  def test_optimal_bst
    p = [0.00, 0.15, 0.10, 0.05, 0.10, 0.20]
    q = [0.05, 0.10, 0.05, 0.05, 0.05, 0.10]
    k = DynamicProgramming::OBST.optimal_bst(p, q, 5)
    assert_equal(k.first[1][5], 2.75)
  end
end
