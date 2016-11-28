# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE
# TODO: RUBY WAY IMPLEMENTATION and MORE DOCUMENTATION

# Internal: Swap two elements in an array - THE RUBY WAY
#
# arr - Array of integer elements
# v1  - Location of element in the array
# v2  - Location of element in the array
#
# Examples
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
#   swap([5, 3, 8, 7, 9, 6, 2, 4, 1], 2, 5)
#   => [5, 3, 6, 7, 9, 8, 2, 4, 1]
#
def swap(arr, v1, v2)
	temp = arr[v1]
	arr[v1] = arr[v2]
	arr[v2] = temp
end

# Internal: Sorts the elements of the array using BUBBLE sort algorithm
# 					Divide and Conquer strategy
#
# arr - Array of integer elements
# n     - one less than the length of provided array *OPTIONAL*
#
# COMPLEXITY: Θ(n^2)
# TODO: Update the code to handle any kind of datatype
#       Make it a more sleek
#
# Examples
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
# arr - Array of interger elements for now
#
# COMPLEXITY: Θ(n^2)
# TODO: Update the code to handle any kind of datatype
#
# Examples
#   insertion_sort([5, 3, 8, 7, 9, 6, 2, 4, 1])
#   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# Returns a sorted array.
def insertion_sort(arr)
	for i in 1..arr.length-1
		j=i-1;
		key = arr[i]
		while j >= 0 && arr[j] > key
			arr[j+1] = arr[j]
			j = j-1
		end
		arr[j+1] = key
	end
	arr
end


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
def merge_sort(arr, first=0, last=arr.length-1)
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
def merge(arr, first, mid, last)
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
	return i
end

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
def tail_recursive_quick_sort(arr, p=0, r=arr.length-1, partition="partition")
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
def randomized_quick_sort(arr, p=0, r=arr.length-1)
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
def randomized_partition(arr, p, r)
	i = rand(p..r)
	arr[r], arr[i] = arr[i], arr[r]
	partition(arr, p, r)
end

@sorted_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def unit_test_sorting
	test('Swap', swap_test)
	test('Bubble sort', bubble_sort_test)
	test('Insertion sort', insertion_sort_test)
	test('Merge', merge_test)
	test('Merge sort', merge_sort_test)
	test('Partition', partition_test)
	test('Hoare Parition', hoare_partition_test)
	test('Quick sort', quick_sort_test)
	test('Hoare Quick sort', hoare_quick_sort_test)
	test('Tail Recursive Quick sort', tail_recursive_quick_sort_test)
	test('Randomized Quick sort', randomized_quick_sort_test)
end

def test(method_name, method_test)
  if method_test
    p "#{method_name} OK"
  else
    p "#{method_name} FAIL"
  end
end

def swap_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	swap(arr, 1, 2)
	arr[1] == 8 && arr[2] == 3
end

def bubble_sort_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	bubble_sort(arr)
	arr == @sorted_arr
end

def insertion_sort_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	insertion_sort(arr)
	arr == @sorted_arr
end

def merge_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	merge(arr, 0, 4, 8)
	arr  == [5, 3, 6, 2, 4, 1, 8, 7, 9]
end

def merge_sort_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	merge_sort(arr)
	arr == @sorted_arr
end

def quick_sort_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	quick_sort(arr)
	arr == @sorted_arr
end

def tail_recursive_quick_sort_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	tail_recursive_quick_sort(arr)
	arr == @sorted_arr
end

def hoare_quick_sort_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	quick_sort(arr, 0, 8, 'hoare_partition')
	arr == @sorted_arr
end

def partition_test
	4 == partition([1, 3, 8, 7, 9, 6, 2, 4, 5], 0, 8)
end

def hoare_partition_test
	4 == hoare_partition([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8)
end

def randomized_quick_sort_test
	arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
	randomized_quick_sort(arr)
	arr == @sorted_arr
end

unit_test_sorting
