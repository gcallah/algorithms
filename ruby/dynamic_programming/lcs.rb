module DynamicProgramming
  class LCS
    class << self
      def LCS_length(x, y)
        m = x.length
        n = y.length
        b = Array.new(m+1) { Array.new(n+1) }
        c = Array.new(m+1) { Array.new(n+1) }

        (0..m).each do |i|
          c[i][0] = 0
        end
        (0..n).each do |j|
          c[0][j] = 0
        end

        (1..m).each do |i|
          (1..n).each do |j|
            if x[i-1] == y[j-1]
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

      def print_LCS(b, x, i, j, output="")
        return output.reverse if ((i == 0) || (j == 0))
        if b[i][j] == "CROSS"
          output += x[i-1]
          print_LCS(b, x, i-1, j-1, output)
          # print x[i-1]
        elsif b[i][j] == "UP"
          print_LCS(b, x, i-1, j, output)
        else
          print_LCS(b, x, i, j-1, output)
        end
      end

    end
  end
end

# DynamicProgramming::LCS.LCS_length(x, y).last
# DynamicProgramming::LCS.print_LCS(DynamicProgramming::LCS.LCS_length(x, y).last, x, x.length, y.length)
