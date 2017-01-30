require_relative './utils'

module Sorting
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
  def self.bubble_sort(arr, n=arr.length-1)
  	(0..n).each do |i|
  		(i..n).reverse_each do |j|
  			(arr[j], arr[j-1] = arr[j-1], arr[j]) if arr[j] < arr[j-1]
  		end
  	end
  	arr
  end
end
