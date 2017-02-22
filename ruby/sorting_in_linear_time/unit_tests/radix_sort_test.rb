require_relative '../radix_sort'
require 'minitest/autorun'

class RadixSortTest < Minitest::Test
  def test_radix_sort
    arr = [329, 457, 657, 839, 436, 720, 355]
    sorted_arr = [329, 355, 436, 457, 657, 720, 839]
    assert_equal(SortingInLinearTime::radix_sort(arr, 3), sorted_arr)
  end

  def test_radix_sort_unstable
    arr = [329, 457, 657, 839, 436, 720, 355]
    sorted_arr = [329, 355, 436, 457, 657, 720, 839]
    assert_equal(SortingInLinearTime::radix_sort_unstable(arr, 3), sorted_arr)
  end
end
