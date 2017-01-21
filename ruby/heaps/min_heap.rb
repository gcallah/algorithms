require_relative './heap_monkey_patch'

using MonkeyPatch

module Heap
  module MinHeap
    # Public: Ensures the min-heap property is being maintained from the index provided
    #         Recursive, Min-Heap property A[parent] <= A[left] as well as A[right]
    #
    # ARGS:
    # arr - Input array
    # i   - Index at which the Min-Heap property is to be applied
    #
    # RETURN: nil
    #
    # COMPLEXITY: Θ(lgn)
    #
    # Examples
    #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    #    min_heapify(arr, 5)
    #
    # Modifies the provided array.
    def min_heapify(arr, i)
      arr.heap_size ||= arr.length

      l = i.left
      r = i.right

      smallest = (l <= arr.heap_size-1 && arr[l] < arr[i]) ? l : i
      smallest = r if (l <= arr.heap_size-1 && arr[l] < arr[smallest])
      if smallest != i
        arr[i], arr[smallest] = arr[smallest], arr[i]
        min_heapify(arr, smallest)
      end
    end
  end
end
