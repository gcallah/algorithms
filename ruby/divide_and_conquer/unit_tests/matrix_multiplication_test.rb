require_relative '../matrix_multiplication'
require 'minitest/autorun'

class MatrixMultiplicationTest < Minitest::Test
  def test_square_matrix_multiply
    mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    mat2 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

    mat1Xmat2 = [[90, 100, 110, 120], [202, 228, 254, 280], [314, 356, 398, 440], [426, 484, 542, 600]]

    assert_equal(DivideAndConquer::square_matrix_multiply(mat1, mat2), mat1Xmat2)
  end

  def test_matrix_partitioner
    mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    assert_equal(DivideAndConquer::matrix_partitioner(mat1),
      [[[1, 2], [5, 6]], [[3, 4], [7, 8]], [[9, 10], [13, 14]], [[11, 12], [15, 16]]])
  end

  def test_assemble_matrix
    mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    partitioned_mat = [[[1, 2], [5, 6]], [[3, 4], [7, 8]], [[9, 10], [13, 14]], [[11, 12], [15, 16]]]

    assert_equal(DivideAndConquer::assemble_matrix(partitioned_mat), mat1)
  end

  def test_square_matrix_multiply_recursive
    mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    mat2 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

    mat1Xmat2 = [[90, 100, 110, 120], [202, 228, 254, 280], [314, 356, 398, 440], [426, 484, 542, 600]]

    assert_equal(DivideAndConquer::square_matrix_multiply_recursive(mat1, mat2), mat1Xmat2)
  end

  def test_strassen_multiplication
    mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    mat2 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

    mat1Xmat2 = [[90, 100, 110, 120], [202, 228, 254, 280], [314, 356, 398, 440], [426, 484, 542, 600]]

    assert_equal(DivideAndConquer::strassen_multiplication(mat1, mat2), mat1Xmat2)
  end
end
