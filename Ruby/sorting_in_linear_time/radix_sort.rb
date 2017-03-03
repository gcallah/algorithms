require_relative '../getting_started/bubble_sort'

module SortingInLinearTime
  class << self

    # Public: Sorts data with integer keys by grouping keys by the individual
    #         digits which share the same significant position and value.
    #
    # NOTE: USING STABLE SORT (BUBBLE SORT)
    #
    # ARGS:
    # a - Input array
    # d - Highest order digit
    #
    # RETURN: Sorted array
    #
    # COMPLEXITY: Θ(w*n)
    #
    # Examples
    #    radix_sort([329, 457, 657, 839, 436, 720, 355], 3)
    #    => [329, 355, 436, 457, 657, 720, 839]
    def radix_sort(arr, d)
      stable_sortable_array = arr.map { |x| [x, 0] }
      (0..d-1).reverse_each do |digit|
        stable_sortable_array = number_ndigit_pair(stable_sortable_array.map { |x| x[0]}, d - 1 - digit)
        GettingStarted::bubble_sort_for_radix_sort(stable_sortable_array)
      end
      stable_sortable_array.map { |x| x[0] }
    end

    # Public: Builds an array of arrays with first index as the number and
    #         second index as the digit at specified location from the number
    #
    # ARGS:
    # arr - Input array
    # digit_offset - Specific digit position (like 10's or 100's)
    #
    # RETURN: Sorted array
    #
    # Examples
    #    number_ndigit_pair([329, 457, 657, 839, 436, 720, 355], 0)
    #    => [[329, 9], [355, 5], [436, 6], [457, 7], [657, 7], [720, 0], [839, 9]]
    #    0 is the units digit, 1 is the 10's digit and 2 is the 100's digit and so on
    def number_ndigit_pair(array, digit_offset)
      pair_array = []
      array.each do |number|
        pair_array << [number, (number / 10 ** (digit_offset) % 10)]
      end
      pair_array
    end

    # Public: Sorts data with integer keys by grouping keys by the individual
    #         digits which share the same significant position and value.
    #
    # NOTE: USING UNSTABLE SORT (QUICK SORT)
    #
    # ARGS:
    # a - Input array
    # d - Highest order digit
    #
    # RETURN: Sorted array
    #
    # Examples
    #    radix_sort_unstable([329, 457, 657, 839, 436, 720, 355], 3)
    #    => [329, 355, 436, 457, 657, 720, 839]
    def radix_sort_unstable(arr, d)
      arrayified_hash = prepare_number_to_digit_array_map(arr, d).to_a

      (0..d-1).reverse_each do |digit|
        arrayified_hash.sort! { |x, y| x[1][digit] == y[1][digit] ?
                                       x[0] <=> y[0] :
                                       x[1][digit] <=> y[1][digit]
                               }
      end

      arrayified_hash.map { |x| x[0] }
    end

    # Public: Builds an hash of arrays where first index is the number and
    #         second index is an array with digits in each element
    #
    # ARGS:
    # a - Input array
    # d - Highest order digit
    #
    # Examples
    #    prepare_number_to_digit_array_map([329, 457, 657, 839, 436, 720, 355], 3)
    #    => [
    #         [329, [3, 2, 9]], [355, [3, 5, 5]], [436, [4, 3, 6]],
    #         [457, [4, 5, 7]], [657, [6, 5, 7]], [720, [7, 2, 0]],
    #         [839, [8, 3, 9]]
    #       ]
    def prepare_number_to_digit_array_map(arr, d)
      hash = {}
      arr.each do |number|
        hash[number] = number_to_digit_array(number, d)
      end
      hash
    end

    # Public: Builds an array with first index as the number and second index as
    #         the array with elements
    #
    # ARGS:
    # number - Number to be augmented
    # max_size - Length of second index in the result (OPTIONAL)
    #
    # Examples
    #    number_to_digit_array(329)
    #    => [329, [3, 2, 9]]
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
