require_relative '../matrix_chain_multiplication'
require 'minitest/autorun'

class MatrixChainMultiplicationTest < Minitest::Test
  def test_matrix_chain_order
    p = [30, 35, 15, 5, 10, 20, 25] # implies number of matrices = 6 = p.length - 1
    assert_equal(DynamicProgramming::MatrixChain.matrix_chain_order(p).first[0][p.length-2], 15125)
  end

  def test_recursive_matrix_chain
    p = [30, 35, 15, 5, 10, 20, 25] # implies number of matrices = 6 = p.length - 1
    assert_equal(DynamicProgramming::MatrixChain.recursive_matrix_chain(p, 0, p.length-2), 15125)
  end

  def test_memoized_matrix_chain
    p = [30, 35, 15, 5, 10, 20, 25]
    assert_equal(DynamicProgramming::MatrixChain.memoized_matrix_chain(p), 15125)
  end
end
