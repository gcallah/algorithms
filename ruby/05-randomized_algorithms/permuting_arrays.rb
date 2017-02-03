module RandomizedAlgorithms
  class << self
    # Public: Randomizes the array by sorting the n^3 priorities
    #
    # ARGS:
    # arr  - Array to be randomized
    #
    # Return: Array
    #
    # Examples
    #   permute_by_sorting([0, 9, 2, 15, 17, 9, 10, 20])
    #   => [9, 10, 17, 9, 20, 15, 2, 0]
    #   => [20, 9, 2, 10, 15, 9, 0, 17]
    #   => [0, 17, 10, 9, 15, 2, 9, 20]
    #   NOTE: Every output will be different due to the randomization
    def permute_by_sorting(arr)
      n = arr.length
      p = {}
      (0..n-1).each do |i|
        p[i] = rand(1..(n**3))
      end
      p.sort_by { |k, v| v }.map { |k, v| arr[k] }
    end

    # Public: Randomizes the array by swapping with random indices over [i..n]
    #
    # ARGS:
    # arr  - Array to be randomized
    #
    # Return: Array
    #
    # Examples
    #   randomize_in_place([0, 9, 2, 15, 17, 9, 10, 20])
    #   => [15, 9, 0, 17, 9, 2, 20, 10]
    #   => [9, 17, 10, 9, 0, 2, 15, 20]
    #   => [10, 20, 9, 15, 2, 0, 17, 9]
    #   NOTE: Every output will be different due to the randomization
    def randomize_in_place(arr)
      n = arr.length
      (0..n-1).each do |i|
        random_index = rand(i..n-1)
        arr[i], arr[random_index] = arr[random_index], arr[i]
      end
      arr
    end

    # Public: Randomizes the array by producing at random any permutation
    #         besides the identity permutation
    #
    # ARGS:
    # arr  - Array to be randomized
    #
    # Return: Array
    #
    # Examples
    #   permute_without_identity([0, 9, 2, 15, 17, 9, 10, 20])
    #   => [10, 17, 20, 9, 15, 0, 2, 9]
    #   => [9, 10, 15, 17, 9, 0, 20, 2]
    #   => [17, 15, 9, 2, 20, 0, 9, 10]
    #   NOTE: Every output will be different due to the randomization
    def permute_without_identity(arr)
      n = arr.length
      (0..n-2).each do |i|
        random_index = rand((i+1)..(n-1))
        arr[i], arr[random_index] = arr[random_index], arr[i]
      end
      arr
    end

    # Public: Randomizes the array by swapping with random indices over [i..n]
    #
    # ARGS:
    # arr  - Array to be randomized
    #
    # Return: Array
    #
    # Examples
    #   permute_with_all([0, 9, 2, 15, 17, 9, 10, 20])
    #   => [9, 0, 15, 2, 9, 17, 10, 20]
    #   => [9, 0, 9, 2, 20, 10, 17, 15]
    #   => [9, 15, 17, 9, 10, 2, 0, 20]
    #   NOTE: Every output will be different due to the randomization
    def permute_with_all(arr)
      n = arr.length
      (0..n-1).each do |i|
        random_index = rand(1..n-1)
        arr[i], arr[random_index] = arr[random_index], arr[i]
      end
      arr
    end
  end
end
