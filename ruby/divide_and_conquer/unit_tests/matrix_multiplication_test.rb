require_relative '../matrix_multiplication'
require_relative '../../unit_test'

@mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
@mat2 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

@mat1Xmat2 = [[90, 100, 110, 120], [202, 228, 254, 280], [314, 356, 398, 440], [426, 484, 542, 600]]

def square_matrix_multiply_test
  DivideAndConquer::square_matrix_multiply(@mat1, @mat2) == @mat1Xmat2
end

def matrix_partitioner_test
  DivideAndConquer::matrix_partitioner(@mat1) ==
  [[[1, 2], [5, 6]], [[3, 4], [7, 8]], [[9, 10], [13, 14]], [[11, 12], [15, 16]]]
end

def assemble_matrix_test
  partitioned_mat = [[[1, 2], [5, 6]], [[3, 4], [7, 8]], [[9, 10], [13, 14]], [[11, 12], [15, 16]]]
  DivideAndConquer::assemble_matrix(partitioned_mat) == @mat1
end

def square_matrix_multiply_recursive_test
  DivideAndConquer::square_matrix_multiply_recursive(@mat1, @mat2) == @mat1Xmat2
end

def strassen_multiplication_test
  DivideAndConquer::strassen_multiplication(@mat1, @mat2) == @mat1Xmat2
end

UnitTest.method('Square matix multiply', square_matrix_multiply_test)
UnitTest.method('Matrix partitioner', matrix_partitioner_test)
UnitTest.method('Assemble matrix', assemble_matrix_test)
UnitTest.method('Square matrix multiply Recursive', square_matrix_multiply_recursive_test)
UnitTest.method('Strassen muliplication', strassen_multiplication_test)
