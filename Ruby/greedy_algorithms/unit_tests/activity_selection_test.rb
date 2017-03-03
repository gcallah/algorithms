require_relative '../activity_selection'
require 'minitest/autorun'

class ActivitySelectionTest < Minitest::Test
  def test_recursive_activity_selector
    s = [0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
    f = [0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16]
    assert_equal(GreedyAlgorithms::ActivitySelection.
                 recursive_activity_selector(s, f, 0, 11), [1, 4, 8, 11])
  end

  def test_greedy_activity_selector
    s = [0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
    f = [0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16]
    assert_equal(GreedyAlgorithms::ActivitySelection.
                 greedy_activity_selector(s, f), [1, 4, 8, 11])
  end
end
