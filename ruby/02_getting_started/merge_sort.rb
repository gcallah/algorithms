module GettingStarted
  # Internal: Sorts the elements of the array using MERGE sort algorithm
  # 					Divide and Conquer strategy
  # Dependancy: merge
  #
  # arr - Array of integer elements
  # first - start index of array
  # last  - end index of array (array_length-1)
  #
  # COMPLEXITY: Θ(nlogn)
  # TODO: Update the code to handle any kind of datatype
  #       Make it a more sleek
  #
  # Examples
  #   merge_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
  #   merge_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
  #   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
  #
  # Returns a sorted array.
  def self.merge_sort(arr, first=0, last=arr.length-1)
  	mid = (last+first)/2
  	if first < last
  		merge_sort(arr, first, mid)
  		merge_sort(arr, mid+1, last)
  		merge(arr, first, mid, last)
  	end
  	arr
  end

  # Internal: Creates and merges two arrays into a sorted array
  #
  # array - Array of interger elements for now
  # first - start index of array
  # mid   - middle index of array
  # last  - end index of array (array_length-1)
  # TODO: Update the code to handle any kind of datatype
  #       Make it a more sleek
  #
  # Examples
  #   merge([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 4, 8)
  #   => [5, 3, 6, 2, 4, 1, 8, 7, 9]
  #
  # Returns a sorted array.
  def self.merge(arr, first, mid, last)
  	l1 = []
  	l2 = []

  	(first..mid).each { |i| l1 << arr[i] }
  	l1 << Float::INFINITY

  	(mid+1..last).each { |i| l2 << arr[i] }
  	l2 << Float::INFINITY

  	l1_index = 0
  	l2_index = 0

  	for i in first..last
  		if l1[l1_index] < l2[l2_index]
  			arr[i] = l1[l1_index]
  			l1_index = l1_index + 1
  		else
  			arr[i] = l2[l2_index]
  			l2_index = l2_index + 1
  		end
  	end
  end

end
