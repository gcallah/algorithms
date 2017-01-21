require_relative './monkey_patch'

using MonkeyPatch

module Heap
  module MaxHeap
    # Public: Ensures the max-heap property is being maintained from the index provided
    #         Recursive, Max-Heap property A[parent] >= A[left] as well as A[right]
    #
    # ARGS:
    # arr - Input array
    # i   - Index at which the Max-Heap property is to be applied
    #
    # RETURN: nil
    #
    # COMPLEXITY: Θ(lgn)
    #
    # Examples
    #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    #    max_heapify(arr, 5)
    #
    # Modifies the provided array.
    def self.max_heapify(arr, i)
      arr.heap_size ||= arr.length

      l = i.left
      r = i.right

      largest = (l <= arr.heap_size-1 && arr[l] > arr[i]) ? l : i
      largest = r if (r <= arr.heap_size-1 && arr[r] > arr[largest])
      if largest != i
        arr[i], arr[largest] = arr[largest], arr[i]
        max_heapify(arr, largest)
      end
    end

    # Public: Re-order the input array to adhere to the Max-Heap property at all indices
    #
    # ARGS:
    # arr - Input array
    #
    # RETURN: nil
    #
    # Examples
    #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    #    build_max_heap(arr)
    #
    # Modifies the provided array.
    def self.build_max_heap(arr)
      arr.heap_size = arr.length
      (0..arr.length.half).reverse_each do |i|
        max_heapify(arr, i)
      end
    end

    # Public: Returns the maximium element in the heap, which is the element at
    #         index 0 after building the heap structure
    #
    # ARGS:
    # arr - Input array
    #
    # Return: Integer
    #
    # Examples
    #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    #    build_max_heap(arr)
    #    heap_maximum(arr)
    #    => 9
    def self.heap_maximum(arr)
      arr[0]
    end
  end
end
