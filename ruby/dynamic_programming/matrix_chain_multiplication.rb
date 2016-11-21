module DynamicProgramming
  class MatrixChain
    class << self

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

      def recursive_matrix_chain(p, i, j, m = p.length.times.map { |x| [] })
        return 0 if i == j
        m[i][j] = Float::INFINITY
        (i..j-1).each do |k|
          q = recursive_matrix_chain(p, i, k, m) + recursive_matrix_chain(p, k+1, j, m) + p[i]*p[k+1]*p[j+1]
          m[i][j] = q if q < m[i][j]
        end
        m[i][j]
      end

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

p = [30, 35, 15, 5, 10, 20, 25]
# p memoized_matrix_chain(p)
# p recursive_matrix_chain(p, 1, 4)
# p matrix_chain_order(p)[0][1][4]
# print_optimal_parens(matrix_chain_order(p)[1], 0, 5)
