require_relative '../tail_recursive_quick_sort'
require 'minitest/autorun'

class TailRecursiveQuickSortTest < Minitest::Test
  def test_tail_recursive_quick_sort
    sorted_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    Quicksort::tail_recursive_quick_sort(arr)
    assert_equal(arr, sorted_arr)
  end

  def test_normal_parition_tail_recursive_quick_sort
    sorted_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  	Quicksort::tail_recursive_quick_sort(arr, 0, 8, 'partition')
  	assert_equal(arr, sorted_arr)
  end

  def test_hoare_partition
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    partition_index = Quicksort::hoare_partition(arr, 0, 8)
    assert_equal(partition_index, 4)
  end
end
