module GettingStarted
  # Internal: Sorts the elements of the array using BUBBLE sort algorithm
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

  # Internal: Variant of bubble sort that not from the text and is only
  #           implemented to provide a valid stable sort that bubble sorts on
  #           specific input as expected by the RADIX SORT algorithm that is in
  #           the SortingInLinearTime chapter
  #
  # arr - Array of arrays with two elements in each
  # n   - one less than the length of provided array *OPTIONAL*
  #
  # COMPLEXITY: Θ(n^2)
  #
  # Examples
  #   bubble_sort_for_radix_sort([[329, 9], [457, 7], [657, 7], [839, 9], [436, 6], [720, 0], [355, 5]])
  #   => [[720, 0], [355, 5], [436, 6], [457, 7], [657, 7], [329, 9], [839, 9]]
  #
  # Returns a sorted array.
  def self.bubble_sort_for_radix_sort(arr, n=arr.length-1)
  	(0..n).each do |i|
  		(i..n).reverse_each do |j|
        if arr[j][1] < arr[j-1][1] ||
           arr[j][1] == arr[j-1][1] && arr[j][0] < arr[j-1][0]

  			   (arr[j], arr[j-1] = arr[j-1], arr[j])
        end
  		end
  	end
  	arr
  end
end
