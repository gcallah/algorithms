require_relative '../../unit_test'
require_relative '../matrix_chain_multiplication'

def matrix_chain_order_test
  p = [30, 35, 15, 5, 10, 20, 25] # implies number of matrices = 6 = p.length - 1
  DynamicProgramming::MatrixChain.matrix_chain_order(p).first[0][p.length-2] == 15125
end

def recursive_matrix_chain_test
  p = [30, 35, 15, 5, 10, 20, 25] # implies number of matrices = 6 = p.length - 1
  DynamicProgramming::MatrixChain.recursive_matrix_chain(p, 0, p.length-2) == 15125
end

def memoized_matrix_chain_test
  p = [30, 35, 15, 5, 10, 20, 25]
  DynamicProgramming::MatrixChain.memoized_matrix_chain(p) == 15125
end

UnitTest.method('Matrix Chain Order', matrix_chain_order_test)
UnitTest.method('Recursive Matrix Chain', recursive_matrix_chain_test)
UnitTest.method('Memoized Matrix Chain', memoized_matrix_chain_test)
