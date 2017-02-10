require_relative '../min_priority_queue'
require_relative '../min_heap'
require 'minitest/autorun'

class MinPrioriryQueue < Minitest::Test
  def test_heap_minimum
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    Heap::MinHeap.build_min_heap(arr)
    assert_equal(Heap::MinPriorityQueue.heap_minimum(arr), arr.min)
  end

  def test_heap_extract_min
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    Heap::MinHeap.build_min_heap(arr)
    min = Heap::MinPriorityQueue.heap_extract_min(arr)
    assert_equal(min, 1)
    min = Heap::MinPriorityQueue.heap_extract_min(arr)
    assert_equal(min, 2)
  end

  def test_heap_decrease_key

  end

  def test_min_heap_insert

  end
end
