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
