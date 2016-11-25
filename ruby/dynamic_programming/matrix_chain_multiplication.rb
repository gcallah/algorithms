module DynamicProgramming
  class MatrixChain
    class << self

      # Internal: Find the optimal execution steps to multiply p-1 matrices
      #           Iterative strategy
      #
      # p - Order of each matrix, taken two indices at a time
      # Eg: Order of 1st matrix is p[0]Xp[1], 2nd matrix is p[1]Xp[2]
      #
      # Examples
      #   matrix_chain_order([30, 35, 15, 5, 10, 20, 25])
      #   =>
      #
      def matrix_chain_order(p)
        n = p.length - 1
        m = n.times.map { |x| [] }
        s = n.times.map { |x| [] }
        n.times.each do |i|
          m[i][i] = 0
        end
        (2..n).each do |l|
          (0..n-l).each do |i|
            j = i + l - 1
            m[i][j] = Float::INFINITY
            (i..j-1).each do |k|
              q = m[i][k] + m[k+1][j] + (p[i] * p[k+1] * p[j+1])
              if q < m[i][j]
                m[i][j] = q
                s[i][j] = k
              end
            end
          end
        end
        [m, s]
      end

      # Internal: Find the optimal execution steps to multiply p-1 matrices
      #           Recursive strategy
      #
      # p - Order of each matrix, taken two indices at a time
      # i -
      # j -
      # m - Initialize an array of arrays of length p
      #
      # Examples
      #   p = [30, 35, 15, 5, 10, 20, 25]
      #   recursive_matrix_chain(p, 0, p.length-2)
      #   => 15125
      #
      def recursive_matrix_chain(p, i, j, m = p.length.times.map { |x| [] })
        return 0 if i == j
        m[i][j] = Float::INFINITY
        (i..j-1).each do |k|
          q = recursive_matrix_chain(p, i, k, m) + recursive_matrix_chain(p, k+1, j, m) + p[i]*p[k+1]*p[j+1]
          m[i][j] = q if q < m[i][j]
        end
        m[i][j]
      end

      # Internal: Find the optimal execution steps to multiply p-1 matrices
      #           Recursive strategy
      #
      # p - Order of each matrix, taken two indices at a time
      #
      # Examples
      #   p = [30, 35, 15, 5, 10, 20, 25]
      #   memoized_matrix_chain(p, 0, p.length-2)
      #   => 15125
      #
      def memoized_matrix_chain(p)
        n = p.length - 1
        m = n.times.map { |x| [] }
        (0..n-1).each do |i|
          (0..n-1).each do |j|
            m[i][j] = Float::INFINITY
          end
        end
        return lookup_chain(m, p, 0, n-1)
      end

      # Internal: Find the optimal execution steps to multiply p-1 matrices
      #           Recursive strategy
      #
      # p - Order of each matrix, taken two indices at a time
      #
      # Examples
      #   p = [30, 35, 15, 5, 10, 20, 25]
      #   memoized_matrix_chain(p, 0, p.length-2)
      #   => 15125
      #
      def lookup_chain(m, p, i, j)
        return m[i][j] if m[i][j] < Float::INFINITY
        if i == j
          m[i][j] = 0
        else
          (i..j-1).each do |k|
            q = lookup_chain(m, p, i, k) + lookup_chain(m, p, k+1, j) + p[i]*p[k+1]*p[j+1]
            m[i][j] = q if q < m[i][j]
          end
        end
        m[i][j]
      end

      def print_optimal_parens(s, i, j)
        if i == j
          print "#{i+1}"
        else
          print "("
          print_optimal_parens(s, i, s[i][j])
          print_optimal_parens(s, s[i][j]+1, j)
          print ")"
        end
      end

    end
  end
end
