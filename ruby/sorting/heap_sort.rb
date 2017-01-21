require_relative '../heaps/max_heap'
require_relative '../heaps/monkey_patch'

using MonkeyPatch

module Sorting
  # Public: Sorts the array by adhering to the Max-Heap property and simulataneously
  #         decreasing the heap size
  #
  # ARGS:
  # arr - Input array
  #
  # RETURN: Array
  #
  # Examples
  #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  #    heap_sort(arr)
  #    => [1, 2, 3, 4, 5, 6, 7, 8, 9]
  #
  # Modifies the provided array.
  def self.max_heap_sort(arr)
    Heap::MaxHeap.build_max_heap(arr)
    (1..(arr.length-1)).reverse_each do |i|
      arr[0], arr[i] = arr[i], arr[0]
      arr.heap_size -= 1
      Heap::MaxHeap.max_heapify(arr, 0)
    end
    arr
  end
end
