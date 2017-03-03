module DynamicProgramming
  class LCS
    class << self
      # Internal: Find the length of the longest common subsequence of two strings
      #
      # x - First string
      # y - Second string
      #
      # Examples
      #   LCS_length("ABCBDAB", "BDCABA")

      #
      def LCS_length(x, y)
        m = x.length
        n = y.length

        b = Array.new(m+1) { Array.new(n+1) } # Trace array (CROSS, UP, LEFT)
        c = Array.new(m+1) { Array.new(n+1) } # Index array (Tracks the length)

        (0..m).each { |i| c[i][0] = 0 }      # Initialze the first row and first
        (0..n).each { |j| c[0][j] = 0 }      # column to zero in the index array

        (1..m).each do |i|               # Index is started from 1 and ends at m
          (1..n).each do |j|             # to make the recursion smoother without
            if x[i-1] == y[j-1]          # trying to manipulate the first condition
              c[i][j] = c[i-1][j-1] + 1
              b[i][j] = "CROSS"
            elsif c[i-1][j] >= c[i][j-1]
              c[i][j] = c[i-1][j]
              b[i][j] = "UP"
            else
              c[i][j] = c[i][j-1]
              b[i][j] = "LEFT"
            end
          end
        end
        [c, b]
      end

      # Internal: Print the longest common subsequence of two strings
      #
      # b - Matrix array which has the trace with CROSS, UP and LEFT directions
      # x - First string
      # i - Last row in the trace array
      # j - Last column in the trace array
      # output - Stores the final subsequence of two strings
      #
      # Examples
      #   print_LCS("ABCBDAB", "BDCABA")
      #   => BCBA
      #
      def print_LCS(b, x, i, j, output="")
        return output.reverse if ((i == 0) || (j == 0))
        if b[i][j] == "CROSS"
          output += x[i-1]
          print_LCS(b, x, i-1, j-1, output)
        elsif b[i][j] == "UP"
          print_LCS(b, x, i-1, j, output)
        else
          print_LCS(b, x, i, j-1, output)
        end
      end

    end
  end
end
