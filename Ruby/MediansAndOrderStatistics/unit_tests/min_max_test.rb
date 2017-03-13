require_relative '../min_max'
require 'minitest/autorun'

class MinMaxTest < Minitest::Test
  def test_maximum
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    assert_equal(MedianAndOrderStatistics::maximum(arr), arr.max)
  end

  def test_minimum
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    assert_equal(MedianAndOrderStatistics::minimum(arr), arr.min)
  end
end
