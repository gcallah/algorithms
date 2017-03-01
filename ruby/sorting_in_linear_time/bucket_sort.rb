require_relative '../getting_started/insertion_sort'

module SortingInLinearTime
  class << self
    # Public: Distribute the elements of an array into a number of buckets.
    #         Each bucket is then sorted individually, either using a different
    #         sorting algorithm, or by recursively applying the bucket sorting
    #         algorithm
    #
    # ARGS:
    # a - Input array
    #
    # RETURN: Sorted array
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #    bucket_sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])
    #    => [0.12, 0.17, 0.21, 0.23, 0.26, 0.39, 0.68, 0.72, 0.78, 0.94]
    def bucket_sort(a, n=10)
      b = Array.new(n)
      n = a.length

      b = n.times.map { |i| [] }

      (0..n-1).each do |i|
        b[(n*a[i]).floor] << a[i]
      end

      (0..n-1).each do |i|
        GettingStarted::insertion_sort(b[i])
      end

      b.flatten
    end
  end
end
