require_relative '../max_priority_queue'
require_relative '../max_heap'
require 'minitest/autorun'

class MaxPrioriryQueue < Minitest::Test
  def test_heap_maximum
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    Heap::MaxHeap.build_max_heap(arr)
    assert_equal(Heap::MaxPriorityQueue.heap_maximum(arr), arr.max)
  end

  def test_heap_extract_max
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    Heap::MaxHeap.build_max_heap(arr)
    max = Heap::MaxPriorityQueue.heap_extract_max(arr)
    assert_equal(max, 18)
    max = Heap::MaxPriorityQueue.heap_extract_max(arr)
    assert_equal(max, 16)
  end

  def test_heap_increase_key

  end

  def test_max_heap_insert

  end
end
