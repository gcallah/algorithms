module Sorting
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
  def self.quick_sort(arr, p=0, r=arr.length-1, partition="partition")
  	if p < r
  		q = send(partition.to_sym, arr, p, r)
  		quick_sort(arr, p, q-1, partition)
  		quick_sort(arr, q+1, r, partition)
  	end
  	arr
  end

  # Internal: Sorts the elements of the array using QUICK sort algorithm
  # 					Iterative Recursive
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
  #   tail_recursive_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
  #   tail_recursive_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
  #   tail_recursive_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8, "hoare_partition")
  #   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
  #
  # Returns a sorted array.
  def self.tail_recursive_quick_sort(arr, p=0, r=arr.length-1, partition="partition")
  	while p < r
  		q = send(partition.to_sym, arr, p, r)
  		tail_recursive_quick_sort(arr, p, q-1, partition)
  		p = q + 1
  	end
  	return arr
  end

  # Internal: Divides the array into two segments by selecting last element as the key
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
  # Returns a sorted array.
  def self.partition(arr, p, r)
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

  # Internal: Sorts the elements of the array using RANDOMIZED QUICK sort algorithm
  # 					Divide and Conquer strategy
  # Dependancy: randomized_partition
  #
  # arr - Array of integer elements
  # p   - start index of array
  # r   - end index of array (array_length-1)
  #
  # COMPLEXITY: Θ(nlogn)
  # TODO: Update the code to handle any kind of datatype
  #       Make it a more sleek
  #
  # Examples
  #   randomized_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
  #   randomized_quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
  #   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
  #
  # Returns a sorted array.
  def self.randomized_quick_sort(arr, p=0, r=arr.length-1)
  	if p < r
  		q = randomized_partition(arr, p, r)
  		randomized_quick_sort(arr, p, q-1)
  		randomized_quick_sort(arr, q+1, r)
  	end
  	arr
  end

  # Internal: Divides the array into two segments by selecting random index element as the key
  #
  # arr - Array of integer elements
  # p   - start index of array
  # r   - end index of array (array_length-1)
  #
  # COMPLEXITY: Θ(n)
  #
  # Examples
  #   randomized_partition([1, 3, 8, 7, 9, 6, 2, 4, 5], 0, 8)
  #   => 4 (could be this, cannot be predicted due to the randomness)
  #
  # Returns a sorted array.
  def self.randomized_partition(arr, p, r)
  	i = rand(p..r)
  	arr[r], arr[i] = arr[i], arr[r]
  	partition(arr, p, r)
  end

  def self.hoare_partition(arr, p, r)
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
  	return i
  end
end
