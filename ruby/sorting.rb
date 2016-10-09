# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE
# TODO: RUBY WAY IMPLEMENTATION and MORE DOCUMENTATION

# Internal: Swap two elements in an array - THE RUBY WAY
#
# arr - Array of integer elements
# v1  - Location of element in the array
# v2  - Location of element in the array
#
# Examples
#
#   swap([5, 3, 8, 7, 9, 6, 2, 4, 1], 2, 5)
#   => [5, 3, 6, 7, 9, 8, 2, 4, 1]
#
def cool_swap(arr, v1, v2)
	arr[v1], arr[v2] = arr[v2], arr[v1]
end

# Internal: Swap two elements in an array
#
# arr - Array of integer elements
# v1  - Location of element in the array
# v2  - Location of element in the array
#
# Examples
#
#   swap([5, 3, 8, 7, 9, 6, 2, 4, 1], 2, 5)
#   => [5, 3, 6, 7, 9, 8, 2, 4, 1]
#
def swap(arr, v1, v2)
	temp = array[v1]
	arr[v1] = arr[v2]
	arr[v2] = temp
end

# Internal: Sorts the elements of the array using BUBBLE sort algorithm
# 					Divide and Conquer strategy
#
# array - Array of integer elements
# n     - one less than the length of provided array *OPTIONAL*
#
# COMPLEXITY: Θ(n^2)
# TODO: Update the code to handle any kind of datatype
#       Make it a more sleek
# Examples
#
#   bubble_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
#   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# Returns a sorted array.
def bubble_sort(arr, n=arr.length-1)
	(0..n).each do |i|
		(i..n).reverse_each do |j|
			(arr[j], arr[j-1] = arr[j-1], arr[j]) if arr[j] < arr[j-1]
		end
	end
	arr
end

# Internal: Sorts the elements of the array using INSERTION sort algorithm
#
# array - Array of interger elements for now
#
# COMPLEXITY: Θ(n^2)
# TODO: Update the code to handle any kind of datatype
# Examples
#
#   insertion_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
#   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# Returns a sorted array.
def insertion_sort(array)
	for i in 1..array.length-1
		j=i-1;
		key = array[i]
		while j >= 0 && array[j] > key
			array[j+1] = array[j]
			j = j-1
		end
		array[j+1] = key

		# PRINT THE ARRAY TO SEE WHAT IS HAPPENED
		p array
		sleep(1.0)
	end
	array
end


# Internal: Sorts the elements of the array using MERGE sort algorithm
# 					Divide and Conquer strategy
#
# array - Array of integer elements
# first - start index of array
# last  - end index of array (array_length-1)
#
# COMPLEXITY: Θ(nlogn)
# TODO: Update the code to handle any kind of datatype
#       Make it a more sleek
# Examples
#
#   merge_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
#   merge_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
#   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# Returns a sorted array.
def merge_sort(array, first=0, last=array.length-1)
	mid = (last+first)/2
	if first < last
		merge_sort(array, first, mid)
		merge_sort(array, mid+1, last)
		merge(array, first, mid, last)
	end
	array
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
#
#   merge_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
#   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# Returns a sorted array.
def merge(array, first, mid, last)
	l1 = []
	l2 = []

	(first..mid).each { |i| l1 << array[i] }
	l1 << Float::INFINITY

	(mid+1..last).each { |i| l2 << array[i] }
	l2 << Float::INFINITY

	l1_index = 0
	l2_index = 0

	for i in first..last
		if l1[l1_index] < l2[l2_index]
			array[i] = l1[l1_index]
			l1_index = l1_index + 1
		else
			array[i] = l2[l2_index]
			l2_index = l2_index + 1
		end
	end
end

# Internal: Sorts the elements of the array using QUICK sort algorithm
# 					Divide and Conquer strategy
#
# array - Array of integer elements
# p     - start index of array    
# r     - end index of array (array_length-1)
#
# COMPLEXITY: Θ(nlogn)
# TODO: Update the code to handle any kind of datatype
#       Make it a more sleek
# Examples
#
#   quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
#   quick_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
#   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# Returns a sorted array.
def quick_sort(arr, p=0, r=arr.length-1)
	if p < r
		q = partition(arr, p, r)
		quick_sort(arr, p, q-1)
		quick_sort(arr, q+1, r)
	end
	arr
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
#
#   partition([1, 3, 8, 7, 9, 6, 2, 4, 5], 0, 8)
#   => 4
#
# Returns a sorted array.
def partition(arr, p, r)
	key = arr[r]
	i = p-1
	(p..r-1).each do |j|
		if arr[j] <= key
			i += 1
			arr[i], arr[j] = arr[j], arr[i]
		end
	end
	arr[i+1], arr[r] = arr[r], arr[i+1]
	i+1
end
