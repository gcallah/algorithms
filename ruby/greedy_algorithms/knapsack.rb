module GreedyAlgorithms
  class Knapsack
    class << self
      def zero_one_recursive(w, c, max_weight, n)
        if n == 0 || max_weight == 0
          return 0
        elsif w[n-1] > max_weight
          return zero_one_recursive(w, c, max_weight, n-1)
        else
          return [c[n-1] + zero_one_recursive(w, c, max_weight - w[n-1], n-1),
                  zero_one_recursive(w, c, max_weight, n-1)].max
        end
      end

      def zero_one_memoized(w, c, max_weight, n)
        r = Array.new(n+1) { Array.new(max_weight) }
        r.each { |x| x[0] = 0 }
        zero_one_dp_aux(w, c, max_weight, n, r)
      end

      def zero_one_dp_aux(w, c, max_weight, n, r)
        if n == 0 || max_weight == 0
          q = 0
        elsif w[n-1] > max_weight
          q = r[n-1][max_weight] ||= zero_one_dp_aux(w, c, max_weight, n-1, r).first
        else
          q = [
            c[n-1] +
            r[n-1][max_weight - w[n-1]] ||= zero_one_dp_aux(w, c, max_weight - w[n-1], n-1, r).first,
            r[n-1][max_weight] ||= zero_one_dp_aux(w, c, max_weight, n-1, r).first
          ].max
        end
        r[n][max_weight] = q
        [q, r]
      end

      def zero_one_bottom_up(w, c, max_weight)
        n = w.length
        r = Array.new(n) { Array.new(max_weight) }
        (0..n-1).each do |i|
          (0..max_weight-1).each do |j|
            if j == 0 || i == 0
              r[i][j] = 0
            elsif w[i-1] > max_weight
              r[i][j] = r[i-1][j]
            else
              r[i][j] = [c[i-1] + r[i - 1][j - w[i - 1]], r[i - 1][j]].max
            end
          end
        end
        r.last.last
      end

      def fractional

      end
    end
  end
end
