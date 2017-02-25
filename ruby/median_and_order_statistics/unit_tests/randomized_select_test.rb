require_relative '../randomized_select'
require 'minitest/autorun'

class RandomizedSelectTest < Minitest::Test
  def test_randomized_select
    arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
    sorted_arr = arr.sort
    (1..sorted_arr.length).each do |i|
      assert_equal(MedianAndOrderStatistics::randomized_select(arr, 0, 9, i), sorted_arr[i-1])
    end
  end

  # def test_randomized_select_iterative
  #   arr = [4, 1, 3, 2, 16, 9, 10, 14, 18, 7]
  #   sorted_arr = arr.sort
  #   (1..sorted_arr.length).each do |i|
  #     assert_equal(MedianAndOrderStatistics::randomized_select_iterative(arr, 0, 9, i), sorted_arr[i-1])
  #   end
  # end
end
