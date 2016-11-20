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
      #   => 31
      def memoized_cut_rod(p, n)
        r = n.times.map { |x| -Float::INFINITY }
        memoized_cut_rod_aux(p, n, r)
      end


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

      def sleek_memoized_cut_rod_aux(p, n, r={})
        return 0 if n == 0
        q = -Float::INFINITY
        (0..n-1).each do |i|
          prevRodCut = r[n-i-1] || (r[n-i-1] = sleek_memoized_cut_rod_aux(p, n-i-1, r))
          q = [q, p[i] + prevRodCut].max
        end
        q
      end

      def bottom_up_cut_rod(p, n)
        r = n.times.map { |x| 0 }
        (1..n).each do |j|
          q = -Float::INFINITY
          (0..j-1).each { |i| q = [q, p[i] + r[j-i-1]].max }
          r[j] = q
        end
        r[n]
      end

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


# p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
# p cut_rod(p, 9)
# p memoized_cut_rod(p, 9)
# p sleek_memoized_cut_rod_aux(p, 9)
# p bottom_up_cut_rod(p, 9)
# p extended_bottom_up_cut_rod(p, 10)
