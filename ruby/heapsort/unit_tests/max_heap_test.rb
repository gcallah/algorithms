require_relative '../max_heap'
require_relative '../monkey_patch'

using MonkeyPatch

require 'minitest/autorun'

class MaxHeapTest < Minitest::Test
  def test_max_heapify
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    assert_equal((arr[2] < arr[2.left]) && (arr[2] < arr[2.right]), true)
    Heap::MaxHeap.max_heapify(arr, 2)
    assert_equal((arr[2] > arr[2.left]) && (arr[2] > arr[2.right]), true)
  end

  def test_build_max_heap
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    assert(arr[0] != arr.max)
    Heap::MaxHeap.build_max_heap(arr)
    assert(arr[0] == arr.max)
  end
end
