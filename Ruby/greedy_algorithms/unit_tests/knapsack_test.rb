require_relative '../knapsack'
require 'minitest/autorun'

@w = [70, 73, 77, 80, 82, 87, 90, 94, 9, 10, 11, 11, 11, 11, 120]
@c = [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240]
@max_weight = 750

class KnapsackTest < Minitest::Test
  def test_zero_one_recursive
    w = [70, 73, 77, 80, 82, 87, 90, 94, 9, 10, 11, 11, 11, 11, 120]
    c = [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240]
    max_weight = 750

    assert_equal(GreedyAlgorithms::Knapsack.zero_one_recursive(w, c, max_weight), 2593)
  end

  def test_zero_one_memoized
    w = [70, 73, 77, 80, 82, 87, 90, 94, 9, 10, 11, 11, 11, 11, 120]
    c = [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240]
    max_weight = 750

    assert_equal(GreedyAlgorithms::Knapsack.zero_one_memoized(w, c, max_weight).first, 2593)
  end

  def test_zero_one_bottom_up_full_array
    w = [1, 3, 4, 5]
    c = [1, 4, 5, 7]
    assert_equal(GreedyAlgorithms::Knapsack.zero_one_bottom_up(w, c, 7),
                [
                  [0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 1, 1, 1, 1, 1, 1, 1],
                  [0, 1, 1, 4, 5, 5, 5, 5],
                  [0, 1, 1, 4, 5, 6, 6, 9],
                  [0, 1, 1, 4, 5, 7, 8, 9]
                ])
  end

  def test_zero_one_bottom_up_optimal_weight
    w = [70, 73, 77, 80, 82, 87, 90, 94, 9, 10, 11, 11, 11, 11, 120]
    c = [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240]
    max_weight = 750
    assert_equal(GreedyAlgorithms::Knapsack
                 .zero_one_bottom_up(w, c, max_weight).last.last, 2593)
  end
end
