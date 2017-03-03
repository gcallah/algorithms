require_relative '../counting_sort'
require 'minitest/autorun'

class CountingSortTest < Minitest::Test
  def test_counting_sort
    sorted_arr = [0, 0, 2, 2, 3, 3, 3, 5]
    a = [2, 5, 3, 0, 2, 3, 0, 3]
    b = []
    k = 5

    SortingInLinearTime::counting_sort(a, b, 18)
    assert_equal(b, sorted_arr)
  end
end
