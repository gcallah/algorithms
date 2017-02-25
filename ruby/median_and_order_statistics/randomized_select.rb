require_relative '../quicksort/randomized_quick_sort'

module MedianAndOrderStatistics
  class << self
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

    def randomized_select_iterative(a, p, r, i)
      k = 1
      while i != k
        q = Quicksort::randomized_partition(a, p, r)
        
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
