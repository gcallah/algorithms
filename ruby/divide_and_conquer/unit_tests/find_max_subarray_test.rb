require_relative '../find_max_subarray'
require 'minitest/autorun'

class FindMaxSubarrayTest < Minitest::Test
  def test_find_max_crossing_subarray
    assert_equal(DivideAndConquer::find_max_crossing_subarray([-2, -3, 4, -1, -2, 1, 5, -3], 0, 3, 7), [2, 6, 10])
  end

  def test_find_max_subarray
    assert_equal(DivideAndConquer::find_max_subarray([-2, -3, 4, -1, -2, 1, 5, -3]), [2, 6, 7])
  end
end
