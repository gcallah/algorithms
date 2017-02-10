require_relative './min_heap'
require_relative './monkey_patch'

using MonkeyPatch

module Heap
  module MinPriorityQueue
    class << self
      # Public: Returns the minimum element in the heap, which is the element at
      #         index 0 after building the heap structure
      #
      # ARGS:
      # arr - Input array
      #
      # Return: Integer
      #
      # Examples
      #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
      #    build_min_heap(arr)
      #    heap_mimimum(arr)
      #    => 1
      def heap_mimimum(arr)
        arr[0]
      end

      # Public: Returns the minimum element in the heap, which is the element at
      #         index 0 after building the heap structure
      #
      # ARGS:
      # arr - Input array
      #
      # Return: Integer
      #
      # Examples
      #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
      #    build_min_heap(arr)
      #    heap_extract_min(arr)
      #    => 1
      def heap_extract_min(arr)
        arr.heap_size ||= arr.length
        # raise 'heap underflow' if arr.heap_size < 1
        return nil if arr.heap_size < 1
        min = arr[0]
        arr[0] = arr[arr.heap_size-1]
        arr.heap_size -= 1
        Heap::MinHeap::min_heapify(arr, 0)
        min
      end

      # Public: Decreases the element at the specified position to the value provided
      #         and makes sure the max-heap property holds
      #
      # ARGS:
      # arr - Input array
      # i   - Index at which the element has to be increased
      # key - New value of the index location
      #
      # Return: nil
      #
      # Examples
      #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
      #    heap_decrease_key(arr, 8, 0)
      #
      # Modifies the input array
      def heap_decrease_key(arr, i, key)
        raise 'new key is bigger than current key' if key > arr[i]
        arr[i] = key
        while i > 0 && arr[i.parent] > arr[i]
          arr[i], arr[i.parent] = arr[i.parent], arr[i]
          i = i.parent
        end
      end

      # Public: Inserts an element into the array by maintaining the heap property
      #
      # ARGS:
      # arr - Input array
      # key - value to be inserted into the array
      #
      # Return: nil
      #
      # Examples
      #    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
      #    min_heap_insert(arr, 0)
      #
      # Modifies the input array
      def min_heap_insert(arr, key)
        arr.heap_size ||= arr.length
        arr.heap_size += 1
        arr[arr.heap_size-1] = -Float::INFINITY
        heap_decrease_key(arr, arr.heap_size-1, key)
      end
    end
  end
end
