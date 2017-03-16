module GreedyAlgorithms
  class ActivitySelection
    class << self
      # Public: Select events so as to fit maximum of those in the provided
      #         start and end times
      #         The indices returned correspond to the activity 1 => a1
      #         Recursive Strategy
      #
      # s - Start times for events
      # f - Finish times for events
      # k - Kth subproblem to be solved (0 => the whole problem)
      # n - Number of events
      #
      # Examples
      #   s = [0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
      #   f = [0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16]
      #   recursive_activity_selector(s, f, 0, 11)
      #   => [1, 4, 8, 11]
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

      # Public: Select events so as to fit maximum of those in the provided
      #         start and end times
      #         The indices returned correspond to the activity 1 => a1
      #         Iterative Strategy
      #
      # s - Start times for events
      # f - Finish times for events
      # k - Kth subproblem to be solved (0 => the whole problem)
      # n - Number of events
      #
      # Examples
      #   s = [0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
      #   f = [0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16]
      #   greedy_activity_selector(s, f)
      #   => [1, 4, 8, 11]
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
