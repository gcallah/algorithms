require_relative '../bucket_sort'
require 'minitest/autorun'

class BucketSortTests < Minitest::Test
  def test_bucket_sort
    arr = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
    sorted_arr = [0.12, 0.17, 0.21, 0.23, 0.26, 0.39, 0.68, 0.72, 0.78, 0.94]
    assert_equal(SortingInLinearTime::bucket_sort(arr), sorted_arr)
  end
end
