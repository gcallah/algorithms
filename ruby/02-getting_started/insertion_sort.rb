module GettingStarted
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
  def self.insertion_sort(arr)
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
end
