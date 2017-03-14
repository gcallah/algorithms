module MedianAndOrderStatistics
  class << self
    # Public: Returns the minimum number in an array.
    #
    # ARGS:
    # a - Input array
    #
    # RETURN: Number
    # NOTE: Ruby in-built method is array.min
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #    minimum([4, 1, 3, 2, 16, 9, 10, 14, 18, 7])
    #    => 1
    def minimum(a)
      min = a[0]
      (1..a.length-1).each do |i|
        if a[i] < min
          min = a[i]
        end
      end
      min
    end

    # Public: Returns the maximum number in an array.
    #
    # ARGS:
    # a - Input array
    #
    # RETURN: Number
    # NOTE: Ruby in-built method is array.max
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #    maximum([4, 1, 3, 2, 16, 9, 10, 14, 18, 7])
    #    => 18
    def maximum(a)
      max = a[0]
      (1..a.length-1).each do |i|
        if a[i] > max
          max = a[i]
        end
      end
      max
    end

  end
end
