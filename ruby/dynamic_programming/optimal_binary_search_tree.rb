require 'pry'

module DynamicProgramming
  class OBST
    class << self
      def optimal_bst(p, q, n)
        e = Array.new(n+2) { Array.new(n+1) }
        w = Array.new(n+2) { Array.new(n+1) }
        root = Array.new(n+1) { Array.new(n) }

        (1..n+1).each do |i|
          e[i][i-1] = q[i-1]
          w[i][i-1] = q[i-1]
        end

        (1..n).each do |l|
          (1..n-l+1).each do |i|
            j = i + l - 1
            e[i][j] = Float::INFINITY
            w[i][j] = w[i][j-1] + p[j] + q[j]
            (i..j).each do |r|
              t = e[i][r-1] + e[r+1][j] + w[i][j]
              if t < e[i][j]
                e[i][j] = t
                root[i][j] = r
              end
            end
          end
        end
        [e, root]
      end
    end
  end
end
