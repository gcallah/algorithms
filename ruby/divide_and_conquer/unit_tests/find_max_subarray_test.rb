require_relative '../find_max_subarray'
require_relative '../../unit_test'

def find_max_crossing_subarray_test
  DivideAndConquer::find_max_crossing_subarray([-2, -3, 4, -1, -2, 1, 5, -3], 0, 3, 7) == [2, 6, 7]
end

def find_max_subarray_test
  DivideAndConquer::find_max_subarray([-2, -3, 4, -1, -2, 1, 5, -3]) == [2, 6, 7]
end

UnitTest.method('Find max crossing subarray', find_max_crossing_subarray_test)
UnitTest.method('Find max subarray', find_max_subarray_test)
