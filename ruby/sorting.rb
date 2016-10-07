# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE
# TODO: RUBY WAY IMPLEMENTATION and MORE DOCUMENTATION

# Internal: Sorts the elements of the array using Insertion sort algorithm
#
# array - Array of interger elements for now
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


# Internal: Sorts the elements of the array using Merge sort algorithm
# 					Divide and Conquer strategy
#
# array - Array of integer elements
# first - start index of array
# last  - end index of array (array_length-1)
# TODO: Update the code to handle any kind of datatype
#       Make it a more sleek
# Examples
#
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
