require_relative './max_heap'
require_relative './min_heap'
require_relative './monkey_patch'

using MonkeyPatch

module Heap
  # Public: Sorts the array by adhering to the Max-Heap property and simulataneously
  #         decreasing the heap size
  #         NOTE: Returns an ASCENDING list
  #
  # ARGS:
  # arr - Input array
  #
  # RETURN: Array
  #
  # Examples
  #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  #    max_heap_sort(arr)
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

  # Public: Sorts the array by adhering to the Min-Heap property and simulataneously
  #         decreasing the heap size
  #         NOTE: Retuns a DESCENDING list
  #
  # ARGS:
  # arr - Input array
  #
  # RETURN: Array
  #
  # Examples
  #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  #    min_heap_sort(arr)
  #    => [9, 8, 7, 6, 5, 4, 3, 2, 1]
  #
  # Modifies the provided array.
  def self.min_heap_sort(arr)
    Heap::MinHeap.build_min_heap(arr)
    (1..(arr.length-1)).reverse_each do |i|
      arr[0], arr[i] = arr[i], arr[0]
      arr.heap_size -= 1
      Heap::MinHeap.min_heapify(arr, 0)
    end
  end
end
