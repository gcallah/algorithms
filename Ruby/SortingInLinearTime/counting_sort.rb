module SortingInLinearTime
  class << self

    # Public: Counting sort assumes that each of the n input elements is an
    #         integer in the range 0 to k.
    #
    # Visualization link: https://www.cs.usfca.edu/~galles/visualization/CountingSort.html
    #
    # ARGS:
    # a - Input array
    # b - Array that holds the sorted output
    # k - Maxmimum number in the input array (~ a.max)
    #
    # RETURN: nil
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #    counting_sort([2, 5, 3, 0, 2, 3, 0, 3], [], 5)
    #    => nil
    #    b = [0, 0, 2, 2, 3, 3, 3, 5]
    #
    # Modifies the provided array (i.e b)
    def counting_sort(a, b, k)
      c = Array.new(k)
      (0..k).each do |i|
        c[i] = 0
      end

      (0..a.length-1).each do |j|
        c[a[j]] = c[a[j]] + 1
      end
      # C[i] now contains the number of elements equal to i
      (1..k).each do |i|
        c[i] = c[i] + c[i-1]
      end
      # C[i] now contains the number of elements less than of equal to i
      (0..a.length-1).reverse_each do |j|
        b[c[a[j]]-1] = a[j]
        c[a[j]] = c[a[j]] - 1
      end
    end
  end
end
