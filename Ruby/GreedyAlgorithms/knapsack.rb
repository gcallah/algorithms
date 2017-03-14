module GreedyAlgorithms
  class Knapsack
    class << self
      # Public: 0-1 Knapsack problem to find maximum revenue that can be obtained
      #         from a given set of weights and maximum weight
      #         Exhaustive Recursive Strategy
      #
      # w - Weight list of items
      # c - Cost list of the corresponding weights
      # max_weight - Maximum weight that the burglar can carry
      # n - Number of items present
      #
      # Examples
      #   w = [1, 3, 4, 5]
      #   c = [1, 4, 5, 7]
      #
      #   zero_one_recursive(w, c, 7, 4)
      #   => 9
      def zero_one_recursive(w, c, max_weight, n = w.length)
        if n == 0 || max_weight == 0
          return 0
        elsif w[n-1] > max_weight
          return zero_one_recursive(w, c, max_weight, n-1)
        else
          return [c[n-1] + zero_one_recursive(w, c, max_weight - w[n-1], n-1),
                  zero_one_recursive(w, c, max_weight, n-1)].max
        end
      end

      # Public: 0-1 Knapsack problem to find maximum revenue that can be obtained
      #         from a given set of weights and maximum weight
      #         Memoized Recursive Strategy
      #
      # w - Weight list of items
      # c - Cost list of the corresponding weights
      # max_weight - Maximum weight that the burglar can carry
      # n - Number of items present
      #
      # Examples
      #   w = [1, 3, 4, 5]
      #   c = [1, 4, 5, 7]
      #
      #   zero_one_memoized(w, c, 7, 4)
      #   => [9, [
      #             [0, 0, 0, 0, 0, nil, 0, 0],
      #             [0, nil, 1, 1, 1, nil, nil, 1],
      #             [0, nil, 1, 4, nil, nil, nil, 5],
      #             [0, nil, 1, nil, nil, nil, nil, 9],
      #             [0, nil, nil, nil, nil, nil, nil, 9]]
      #          ]
      #       ]
      def zero_one_memoized(w, c, max_weight, n = w.length)
        r = Array.new(n+1) { Array.new(max_weight) }
        r.each { |x| x[0] = 0 }
        zero_one_memoized_aux(w, c, max_weight, n, r)
      end

      # Public: Auxiliary method to zero_one_memoized methodto construct
      #         optimal matrix and find maximum optimal solution to the
      #         0-1 Knapsack problem
      #         Memoized Recursive Strategy
      #
      # w - Weight list of items
      # c - Cost list of the corresponding weights
      # max_weight - Maximum weight that the burglar can carry
      # n - Number of items present
      # r - Auxiliary storage to store optimal revenues at each max_weight
      #
      # Examples
      #   w = [1, 3, 4, 5]
      #   c = [1, 4, 5, 7]
      #
      #   zero_one_memoized_aux(w, c, 7, 4, r)
      #   => [9, [
      #             [0, 0, 0, 0, 0, nil, 0, 0],
      #             [0, nil, 1, 1, 1, nil, nil, 1],
      #             [0, nil, 1, 4, nil, nil, nil, 5],
      #             [0, nil, 1, nil, nil, nil, nil, 9],
      #             [0, nil, nil, nil, nil, nil, nil, 9]]
      #          ]
      #       ]
      def zero_one_memoized_aux(w, c, max_weight, n, r)
        if n == 0 || max_weight == 0
          q = 0
        elsif w[n-1] > max_weight
          q = r[n-1][max_weight] ||= zero_one_memoized_aux(w, c, max_weight, n-1, r).first
        else
          q = [
            c[n-1] +
            r[n-1][max_weight - w[n-1]] ||= zero_one_memoized_aux(w, c, max_weight - w[n-1], n-1, r).first,
            r[n-1][max_weight] ||= zero_one_memoized_aux(w, c, max_weight, n-1, r).first
          ].max
        end
        r[n][max_weight] = q
        [q, r]
      end

      # Public: Dynamic program recipie for 0-1 Knapsack
      #         Iterative Strategy
      #
      # w - Weight list of items
      # c - Cost list of the corresponding weights
      # max_weight - Maximum weight that the burglar can carry
      #
      # Examples
      #   w = [1, 3, 4, 5]
      #   c = [1, 4, 5, 7]
      #
      #   zero_one_bottom_up(w, c, 7)
      #   => [
      #         [0, 0, 0, 0, 0, 0, 0, 0],
      #         [0, 1, 1, 1, 1, 1, 1, 1],
      #         [0, 1, 1, 4, 5, 5, 5, 5],
      #         [0, 1, 1, 4, 5, 6, 6, 9],
      #         [0, 1, 1, 4, 5, 7, 8, 9]
      #      ]
      def zero_one_bottom_up(w, c, max_weight)
        n = w.length
        r = Array.new(n+1) { Array.new(max_weight+1) }
        (0..n).each do |i|
          (0..max_weight).each do |j|
            if j == 0 || i == 0
              r[i][j] = 0
            elsif w[i-1] > j
              r[i][j] = r[i-1][j]
            else
              r[i][j] = [c[i-1] + r[i - 1][j - w[i - 1]], r[i - 1][j]].max
            end
          end
        end
        r
      end

      def fractional

      end
    end
  end
end
