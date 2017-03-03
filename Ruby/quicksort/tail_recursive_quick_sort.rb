require_relative './quick_sort'

module Quicksort
  class << self
    # Internal: Sorts the elements of the array using QUICK sort algorithm
    # 					Iterative Recursive
    # Dependancy: partition
    #
    # ARGS:
    # arr       - Array of integer elements
    # p         - start index of array
    # r         - end index of array (array_length-1)
    # partition - Type of partition to be used, defaults to "partition" method
    #
    # COMPLEXITY: Θ(nlogn)
    # TODO: Update the code to handle any kind of datatype
    #       Make it a more sleek
    #
    # Examples
    #   tail_recursive_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
    #   tail_recursive_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
    #   tail_recursive_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8, "hoare_partition")
    #   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
    #
    # Returns a sorted array.
    def tail_recursive_quick_sort(arr, p=0, r=arr.length-1, partition="hoare_partition")
      while p < r
        q = Quicksort.send(partition.to_sym, arr, p, r)
        tail_recursive_quick_sort(arr, p, q-1, partition)
        p = q + 1
      end
      return arr
    end

    # Internal: Hoare uses two indices that start at the ends of the array
    #           being partitioned, then move toward each other, until
    #           they detect an inversion
    #
    # ARGS:
    # arr       - Array of integer elements
    # p         - start index of array
    # r         - end index of array (array_length-1)
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #   hoare_partition([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
    #   => 4
    #
    # Returns the index where partition has to happen.
    def hoare_partition(arr, p, r)
    	x = arr[p]
    	i = p+1
    	j = r

    	while i != j
    		j -= 1 while (i < j && arr[j] >= x)
    		i += 1 while (i < j && arr[i] < x)
    		arr[i], arr[j] = arr[j], arr[i]
    	end

    	return p if arr[i] >= x
    	arr[i], arr[p] = arr[p], arr[i]
    	i
    end
  end
end
