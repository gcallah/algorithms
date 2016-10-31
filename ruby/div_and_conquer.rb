# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE

# INDEX
#      find_max_crossing_subarray
#      find_max_subarray
#
#      square_matrix_multiply
#      strassen_multiplication
#      square_matrix_multiply_recursive
#      mat_add_or_subtract
#      matrix_partitioner
#      assemble_matrix

# Internal: Computes the sum of the left, right halves and their index where max is reached
#
# Examples
#   find_max_crossing_subarray([-2, -3, 4, -1, -2, 1, 5, -3], 0, 3, 7)
#   => [2, 6, 7]
#
# Returns an Array.
def find_max_crossing_subarray(arr, low, mid, high)
  sum = max_left = 0
  left_sum = -Float::INFINITY
  max_left = 0
  (low..mid).reverse_each do |i|
    sum += arr[i]
    if sum > left_sum
      left_sum = sum
      max_left = i
    end
  end

  sum = max_right = 0
  right_sum = -Float::INFINITY
  (mid+1..high).each do |j|
    sum += arr[j]
    if sum > right_sum
      right_sum = sum
      max_right = j
    end
  end

  [max_left, max_right, left_sum+right_sum]
end

# Internal: Computes the maximum sub array which returns maximum sum over a range
#
# Examples
#   find_max_subarray([-2, -3, 4, -1, -2, 1, 5, -3], 0, 7)
#   find_max_subarray([-2, -3, 4, -1, -2, 1, 5, -3])
#   => [2, 6, 7]
#
# Returns an Array.
def find_max_subarray(arr, low=0, high=arr.length-1)
  low ||= 0
  high ||= arr.length-1

  return [low, high, arr[low]] if low == high
  mid = (low+high)/2
  left_subarray = find_max_subarray(arr, low, mid)
  right_subarray = find_max_subarray(arr, mid+1, high)
  cross_subarray = find_max_crossing_subarray(arr, low, mid, high)

  return left_subarray if left_subarray[2] > right_subarray[2] && left_subarray[2] > cross_subarray[2]
  return right_subarray if right_subarray[2] > left_subarray[2] && right_subarray[2] > cross_subarray[2]
  return cross_subarray
end

# Internal: Square matrix multiplication
#           Brute force iteration strategy
#
# COMPLEXITY: Θ(n^3)
#
# m1 - Matrix 1
# m2 - Matrix 2
#
# Examples
#   square_matrix_multiply([[1, 2], [3, 4]], [[1, 0], [0, 1]])
#   => [[1, 2], [3, 4]]
#
# Returns an Array.
def square_matrix_multiply(m1, m2)
  n = m1.length
  c = n.times.map { |x| [] }

  (0..n-1).each do |i|
    (0..n-1).each do |j|
      c[i] << 0
      (0..n-1).each do |k|
        c[i][j] += m1[i][k] * m2[k][j]
      end
    end
  end
  c
end

# Internal: Square matrix multiplication
#           Recursive strategy - STRASSEN's METHOD
#
# COMPLEXITY: Θ(n^log7)
#
# a - Matrix 1
# b - Matrix 2
#
# Examples
#   strassen_multiplication([[1, 2], [3, 4]], [[1, 0], [0, 1]])
#   => [[1, 2], [3, 4]]
#
# Returns an Array (a*b).
def strassen_multiplication(a, b)
  a11, a12, a21, a22 = matrix_partitioner(a)
  b11, b12, b21, b22 = matrix_partitioner(b)

  # 10 helper matrices
  s1 = mat_add_or_subtract(b12, b22, '-')
  s2 = mat_add_or_subtract(a11, a12, '+')
  s3 = mat_add_or_subtract(a21, a22, '+')
  s4 = mat_add_or_subtract(b21, b11, '-')
  s5 = mat_add_or_subtract(a11, a22, '+')
  s6 = mat_add_or_subtract(b11, b22, '+')
  s7 = mat_add_or_subtract(a12, a22, '-')
  s8 = mat_add_or_subtract(b21, b22, '+')
  s9 = mat_add_or_subtract(a11, a21, '-')
  s10 = mat_add_or_subtract(b11, b12, '+')

  # 7 recursive calls
  p1 = square_matrix_multiply_recursive(a11, s1)
  p2 = square_matrix_multiply_recursive(s2, b22)
  p3 = square_matrix_multiply_recursive(s3, b11)
  p4 = square_matrix_multiply_recursive(a22, s4)
  p5 = square_matrix_multiply_recursive(s5, s6)
  p6 = square_matrix_multiply_recursive(s7, s8)
  p7 = square_matrix_multiply_recursive(s9, s10)

  # mat_add_or_subtract does not support multiplication of multiple matrices,
  # hence the additional two calculations
  c111 = mat_add_or_subtract(p5, p6, '+')
  c112 = mat_add_or_subtract(p4, p2, '-')
  c11 = mat_add_or_subtract(c111, c112, '+')

  c12 = mat_add_or_subtract(p1, p2, '+')

  c21 = mat_add_or_subtract(p3, p4, '+')

  # mat_add_or_subtract does not support multiplication of multiple matrices,
  # hence the additional two calculations
  c221 = mat_add_or_subtract(p5, p3, '-')
  c222 = mat_add_or_subtract(p1, p7, '-')
  c22 = mat_add_or_subtract(c221, c222, '+')

  assemble_matrix([c11, c12, c21, c22])
end

# Internal: Square matrix multiplication
#           Recursive strategy
# NOTE: SIZE OF MATRICES SHOULD BE A POWER OF 2
#
# a - Matrix 1
# b - Matrix 2
#
# Examples
#   square_matrix_multiply([[1, 2], [3, 4]], [[1, 0], [0, 1]])
#   => [[1, 2], [3, 4]]
#
# Returns an Array.
def square_matrix_multiply_recursive(a, b)
  n = a.size
  c = n.times.map { |x| [] }
  if n == 1
    c[0] << a[0][0]*b[0][0]
  else
    a11, a12, a21, a22 = matrix_partitioner(a)
    b11, b12, b21, b22 = matrix_partitioner(b)

    c11 = mat_add_or_subtract(square_matrix_multiply_recursive(a11, b11),
                              square_matrix_multiply_recursive(a12, b21))

    c12 = mat_add_or_subtract(square_matrix_multiply_recursive(a11, b12),
                              square_matrix_multiply_recursive(a12, b22))

    c21 = mat_add_or_subtract(square_matrix_multiply_recursive(a21, b11),
                              square_matrix_multiply_recursive(a22, b21))

    c22 = mat_add_or_subtract(square_matrix_multiply_recursive(a21, b12),
                              square_matrix_multiply_recursive(a22, b22))
    c = assemble_matrix([c11, c12, c21, c22])
  end
  c
end

# Internal: Add matrix elements
#
# Examples
#   mat_add_or_subtract([[1, 2], [3, 4]], [[1, 0], [0, 1]])
#   => [[1, 2], [3, 4]]
#
# Returns an Array.
def mat_add_or_subtract(mat1, mat2, operation='+')
  n = mat1.size
  result = n.times.map{ |x| [] }
  (0..n-1).each do |i|
    (0..n-1).each do |j|
      result[i] << (operation == '+' ? (mat1[i][j] + mat2[i][j]) : (mat1[i][j] - mat2[i][j]))
    end
  end
  result
end

# Internal: Divides the given square matrix into sub matrices
# NOTE: SIZE OF MATRICES SHOULD BE A POWER OF 2
#
# Examples
#   matrix_partitioner([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])
#             a11               a12                a21                   a22
#   => [[1, 2], [5, 6]], [[3, 4], [7, 8]], [[9, 10], [13, 14]], [[11, 12], [15, 16]]
#
# Returns an Array.
def matrix_partitioner(mat)
  n = mat.size-1
  n_half = mat.size/2

  m11 = (0..n_half-1).map { |x| mat[x][0..n_half-1] }
  m12 = (0..n_half-1).map { |x| mat[x][n_half..n] }

  m21 = (n_half..n).map { |x| mat[x][0..n_half-1] }
  m22 = (n_half..n).map { |x| mat[x][n_half..n] }
  [m11, m12, m21, m22]
end

# Internal: Assembles the partitioned matrix
#
# Examples
#   assemble_matrix([[1], [2], [3], [4]])
#   => [[1, 2], [3, 4]]
#
# Returns an Array.
def assemble_matrix(mat_list)
  sub_len = mat_list[0].size
  n = sub_len*2
  m = n.times.map{ |x| [] }

  (0..n-1).each do |row|
    bottom = 0
    if row >= sub_len
      bottom = 1
    end

    for i in (0..1)
      sub_matrix = mat_list[(bottom*2) + i]
      sub_row = row
      if bottom == 1
          sub_row -= sub_len
      end
      (sub_matrix[sub_row]).each do |elem|
        m[row] << elem
      end
    end
  end
  m
end

def div_and_conquer_test
  find_max_subarray_test
  square_matrix_multiply_test
  square_matrix_multiply_recursive_test
  strassen_multiplication_test
end

def find_max_subarray_test
end

def square_matrix_multiply_test
end

def square_matrix_multiply_recursive_test
end

def strassen_multiplication_test
end
