module DynamicProgramming
  class RodCutting
    class << self

      # Internal: Method to calculate the maximum and optimal solution for cutting a
      #           rod of a particular length
      #           Recursive Strategy
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   cut_rod(p, 9)
      #   => 31
      def cut_rod(p, n)
        return 0 if n == 0
        q = -Float::INFINITY
        (0..n-1).each { |i| q = [q, p[i] + cut_rod(p, n-i-1)].max }
        return q
      end

      # Internal: Method to calculate the maximum and optimal solution for cutting a
      #           rod of a particular length
      #           Recursive Memoization Technique
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   memoized_cut_rod(p, 9)
      #   => 25
      def memoized_cut_rod(p, n)
        r = n.times.map { |x| -Float::INFINITY }
        memoized_cut_rod_aux(p, n, r)
      end

      # Internal: Auxiliary method to calculate the maximum and optimal solution
      #           for cutting a rod of a particular length while populating the
      #           optimal solution array
      #           Recursive Memoization Technique
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      # r - Optimal solution array
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   memoized_cut_rod_aux(p, 9, [-Float::INFINITY, -Float::INFINITY, ... , -Float::INFINITY])
      #   => 25
      def memoized_cut_rod_aux(p, n, r)
        return r[n-1] if r[n-1] >= 0
        if n == 0
          q = 0
        else
          q = -Float::INFINITY
          (0..n-1).each { |i| q = [q, p[i] + memoized_cut_rod_aux(p, n-i-1, r)].max }
        end
        r[n-1] = q
        q
      end

      # Internal: Extension method to memoized_cut_rod to return a tuple of
      #           max revenues and array consisting of optimal index cuts
      #           Recursive Memoization Technique
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   memoized_cut_rod_with_recorder(p, 9)
      #   => [
      #        [1, 5, 8, 10, 13, 17, 18, 22, 25, 30],
      #        [1, 2, 3, 2, 2, 6, 1, 2, 3, 10]
      #      ]
      def memoized_cut_rod_with_recorder(p, n)
        r = n.times.map { |x| -Float::INFINITY }
        s = n.times.map { |x| 0 }
        memoized_cut_rod_aux_with_recorder(p, n, r, s)
      end

      # Internal: Auxiliary extenstion method to memoized_cut_rod_aux to
      #           calculate the optimal revenue array and the cut index array
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      # r - Optimal solution array - NOTE: To be initialized to -INFINITY array
      # s - Cut index array - NOTE: To be initialized to a zero array by callee
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   memoized_cut_rod_aux(p, 9, [-Float::INFINITY, ..], [0, 0, ..])
      #   => [
      #        [1, 5, 8, 10, 13, 17, 18, 22, 25, 30],
      #        [1, 2, 3, 2, 2, 6, 1, 2, 3, 10]
      #      ]
      def memoized_cut_rod_aux_with_recorder(p, n, r, s)
        return r[n-1] if r[n-1] >= 0
        index = 0
        if n == 0
          index = 0
          q = 0
        else
          q = -Float::INFINITY
          (0..n-1).each do |i|
            old_optimal_revenue = memoized_cut_rod_aux_with_recorder(p, n-i-1, r, s)
            if old_optimal_revenue.class == Array
              old_optimal_revenue = old_optimal_revenue.first[n-i-2]
            end

            if p[i] + old_optimal_revenue > q
              q = p[i] + old_optimal_revenue
              index = i
            end
          end
        end
        s[n-1] = index+1
        r[n-1] = q
        [r, s]
      end

      # Internal: Auxiliary method to memoized_cut_rod_with_recorder to print
      #           the rod-lengths to be cut in order to maximize the revenue
      #
      # s - Optimal cut index array obtained from memoized_cut_rod_with_recorder
      # n - Length of rod to be cut
      #
      # Examples
      #   s = [1, 2, 3, 2, 2, 6, 1, 2, 3, 10]
      #   cut_locations(s, 7)
      #   => [1, 6]
      def cut_locations(s, n)
        breakable = false
        cut_list = []
        while true
          cut_list << s[n-1]
          n = n - s[n-1]
          break if n == 0
        end
        cut_list
      end

      # Internal: Method to calculate the maximum and optimal solution for cutting a
      #           rod of a particular length
      #           Recursive Memoization Technique. RUBIFIED METHOD!
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   memoized_cut_rod(p, 9)
      #   => 25
      def sleek_memoized_cut_rod_aux(p, n, r={})
        return 0 if n == 0
        q = -Float::INFINITY
        (0..n-1).each do |i|
          prevRodCut = r[n-i-1] || (r[n-i-1] = sleek_memoized_cut_rod_aux(p, n-i-1, r))
          q = [q, p[i] + prevRodCut].max
        end
        q
      end

      # Internal: Calculates the maximum price output by calculating in a bottom
      #           up fashion
      #           Iterative Bottom up strategy
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   bottom_up_cut_rod(p, 9)
      #   => 25
      def bottom_up_cut_rod(p, n)
        r = n.times.map { |x| 0 }
        (1..n).each do |j|
          q = -Float::INFINITY
          (0..j-1).each { |i| q = [q, p[i] + r[j-i-1]].max }
          r[j] = q
        end
        r[n]
      end

      # Internal: Calculates the maximum price output by calculating in a bottom
      #           up fashion with an optimal solution array to record the length
      #           of each rod cut at every iteration
      #           Iterative Bottom up strategy
      #
      # p - Price list to cut a rod of certain length
      # n - Length of rod to be cut
      #
      # Examples
      #   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
      #   extended_bottom_up_cut_rod(p, 9)
      #   => 25
      def extended_bottom_up_cut_rod(p, n)
        s = []
        s[0] = 0
        r = n.times.map{ |x| 0 }
        (1..n).each do |j|
          q = -Float::INFINITY
          (0..j-1).each do |i|
            if (q < p[i] + r[j-i-1])
              q = p[i] + r[j-i-1]
              s[j] = i+1
            end
            r[j] = q
          end
        end
        [r, s]
      end

      def print_cut_rod_solution(p, n)
        r, s = extended_bottom_up_cut_rod(p, n)
        while n > 0
          p s[n]
          n = n - s[n]
        end
      end

    end
  end
end
