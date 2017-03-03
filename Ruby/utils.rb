module Utils
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
    self.def cool_swap(arr, v1, v2)
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
    self.def swap(arr, v1, v2)
    	temp = arr[v1]
    	arr[v1] = arr[v2]
    	arr[v2] = temp
    end
  end
end
