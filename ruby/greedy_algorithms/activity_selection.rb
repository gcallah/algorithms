module GreedyAlgorithms
  class ActivitySelection
    class << self
      def recursive_activity_selector(s, f, k, n)
        m = k + 1
        while (m <= n) && (s[m] < f[k])
          m += 1
        end

        if m <= n
          return [m] | recursive_activity_selector(s, f, m, n)
        else
          return []
        end
      end

      def greedy_activity_selector(s, f)
        n = s.length
        activity_list = [1]
        k = 1
        (2..n-1).each do |m|
          if s[m] >= f[k]
            activity_list = activity_list | [m]
            k = m
          end
        end
        activity_list
      end
    end
  end
end
