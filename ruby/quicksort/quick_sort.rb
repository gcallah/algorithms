require_relative './tail_recursive_quick_sort'

module Quicksort
  class << self
    # Internal: Sorts the elements of the array using QUICK sort algorithm
    # 					Divide and Conquer strategy
    # Dependancy: partition
    #
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
    #   quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
    #   quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
    #   quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8, "hoare_partition")
    #   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
    #
    # Returns a sorted array.
    def quick_sort(arr, p=0, r=arr.length-1, partition="partition")
    	if p < r
    		q = Quicksort.send(partition.to_sym, arr, p, r)
    		quick_sort(arr, p, q-1, partition)
    		quick_sort(arr, q+1, r, partition)
    	end
    	arr
    end

    # Internal: Divides the array into two segments by selecting last element
    #           as the key
    #
    # NOTE: Unfortunately, this causes worst-case behavior on already sorted
    #       arrays, which is a rather common use-case
    #
    # array - Array of integer elements
    # p     - start index of array
    # r     - end index of array (array_length-1)
    #
    # COMPLEXITY: Θ(n)
    #
    # Examples
    #   partition([1, 3, 8, 7, 9, 6, 2, 4, 5], 0, 8)
    #   => 4
    #
    # Returns the index where partition has to happen.
    def partition(arr, p, r)
    	key = arr[r]
    	i = p-1
    	(p..r-1).each do |j|
    		if arr[j] <= key
    			i += 1
    			arr[i], arr[j] = arr[j], arr[i]
    			# TODO: Show each step more clearly
    			# p "SWAPPING #{arr[i]} with #{arr[j]}"
    			# sleep(1.0)
    		end
    	end
    	arr[i+1], arr[r] = arr[r], arr[i+1]
    	i+1
    end
  end
end
