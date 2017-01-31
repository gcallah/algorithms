require_relative './monkey_patch'
require_relative './max_heap'
require_relative './min_heap'

using MonkeyPatch

module Heap
  module PriorityQueue
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
    #    heap_extract_max(arr)
    #    => 9
    def self.heap_extract_max(arr)
      arr.heap_size ||= arr.length
      raise 'heap underflow' if arr.heap_size < 1
      max = arr[0]
      arr[0] = arr[a.heap_size]
      arr.heap_size -= 1
      Heap::MaxHeap::max_heapify(arr, 1)
      max
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
    #    heap_extract_max(arr)
    #    => 9
    def self.heap_extract_min(arr)
      arr.heap_size ||= arr.length
      raise 'heap underflow' if arr.heap_size < 1
      max = arr[0]
      arr[0] = arr[a.heap_size]
      arr.heap_size -= 1
      Heap::MinHeap::min_heapify(arr, 1)
      max
    end

    # Public: Increases the element at the specified position to the value provided
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
    #    heap_increase_key(arr, 3, 10)
    #    arr = [10, 5, 8, 3, 9, 6, 2, 4, 1]
    #
    # Modifies the input array
    def self.heap_increase_key(arr, i, key)
      raise 'new key is smaller than current key' if key < arr[i]
      arr[i] = key
      while i > 0 && arr[i.parent] < arr[i]
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
    #    max_heap_insert(arr, 10)
    #    arr = [10, 5, 3, 7, 8, 6, 2, 4, 1, 9]
    #
    # Modifies the input array
    def self.max_heap_insert(arr, key)
      arr.heap_size ||= arr.length
      arr.heap_size += 1
      arr[arr.heap_size-1] = -Float::INFINITY
      heap_increase_key(arr, arr.heap_size-1, key)
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
    #    heap_mimimum(arr)
    #    => 1
    def self.heap_mimimum(arr)
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
    def self.heap_extract_min(arr)
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
    def self.heap_decrease_key(arr, i, key)
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
    def self.min_heap_insert(arr, key)
      arr.heap_size ||= arr.length
      arr.heap_size += 1
      arr[arr.heap_size-1] = -Float::INFINITY
      heap_decrease_key(arr, arr.heap_size-1, key)
    end
  end
end
