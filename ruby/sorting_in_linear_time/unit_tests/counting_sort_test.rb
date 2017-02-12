require 'pry'
require_relative '../counting_sort'
require 'minitest/autorun'

class CountingSortTest < Minitest::Test
  def test_counting_sort
    a = [2, 5, 3, 0, 2, 3, 0, 3]
    b = []
    k = 5

    SortingInLinearTime::counting_sort(a, b, k)
    binding.pry
  end
end
