require_relative '../Quicksort/quick_sort'
require_relative '../Quicksort/randomized_quick_sort'

module MedianAndOrderStatistics
  class << self
    # Public: Returns ith smallest element in the array
    #         Recursive Strategy
    #
    # ARGS:
    # a - Input array
    #
    # RETURN: Number
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #    randomized_select([4, 1, 3, 2, 16, 9, 10, 14, 18, 7], 0, 9, 5)
    #    => 7
    def randomized_select(a, p, r, i)
      return a[p] if p == r
      q = Quicksort::randomized_partition(a, p, r)
      k = q - p + 1

      if i == k
        return a[q]
      elsif i < k
        return randomized_select(a, p, q - 1, i)
      else
        return randomized_select(a, q + 1, r, i - k)
      end
    end

    # Public: Returns ith smallest element in the array
    #         Iterative Strategy (NOTE: Working with partition and not randomized_partition)
    #
    # ARGS:
    # a - Input array
    #
    # RETURN: Number
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #    randomized_select_iterative([4, 1, 3, 2, 16, 9, 10, 14, 18, 7], 0, 9, 5)
    #    => 7
    def randomized_select_iterative(a, p, r, i)
      k = 0
      while i != k
        q = Quicksort::partition(a, p, r)
        # NOTE: For some reason using randomized_partition is failing at times
        # TODO: Debug more!
        # q = Quicksort::randomized_partition(a, p, r)

        k = q - p + 1
        if i < k
          r = q - 1
        elsif i > k
          p = q + 1
          i = i - k
        end
      end
      a[p + i - 1]
    end

  end
end
