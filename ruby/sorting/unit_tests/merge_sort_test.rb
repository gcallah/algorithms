require_relative '../merge_sort'
require 'minitest/autorun'

class MergeSortTest < Minitest::Test
  def test_merge_sort
    sorted_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    Sorting::merge_sort(arr)
    assert_equal(arr, sorted_arr)
  end

  def test_merge
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  	Sorting::merge(arr, 0, 4, 8)
  	assert_equal(arr, [5, 3, 6, 2, 4, 1, 8, 7, 9])
  end
end
