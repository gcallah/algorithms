require 'pry'

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
    def radix_sort(arr, d)
      arrayified_hash = prepare_number_to_digit_array_map(arr, d).to_a

      (0..d-1).reverse_each do |digit|
        arrayified_hash = arrayified_hash.sort { |x, y| x[1][digit] == y[1][digit] ? x[0] <=> y[0] : x[1][digit] <=> y[1][digit] }
      end

      arrayified_hash.map { |x| x[0] }
    end

    def prepare_number_to_digit_array_map(arr, d)
      hash = {}
      arr.each do |number|
        hash[number] = number_to_digit_array(number, d)
      end
      hash
    end

    def number_to_digit_array(number, max_size=0)
      array = []
      while number != 0
        array << number % 10
        number /= 10
      end
      (0..((max_size)-(array.length)-1)).each do |x|
        array << 0
      end
      array.reverse
    end
  end
end
