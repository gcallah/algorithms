require_relative '../min_heap'
require_relative '../monkey_patch'
require 'minitest/autorun'

using MonkeyPatch

class MinHeapTest < Minitest::Test
  def test_min_heapify
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    assert_equal((arr[2] > arr[2.left]) && (arr[2] > arr[2.right]), true)
    Heap::MinHeap.min_heapify(arr, 2)
    assert_equal((arr[2] < arr[2.left]) && (arr[2] < arr[2.right]), true)
  end

  def test_build_min_heap
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    assert(arr[0] != arr.min)
    Heap::MinHeap.build_min_heap(arr)
    assert(arr[0] == arr.min)
  end
end
