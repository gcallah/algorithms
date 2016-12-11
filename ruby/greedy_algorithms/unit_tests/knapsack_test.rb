require_relative '../knapsack'
require_relative '../../unit_test'

# w = [10, 20, 30]
# c = [60, 100, 120]

# @w = [1, 3, 4, 5]
# @c = [1, 4, 5, 7]

@w = [70, 73, 77, 80, 82, 87, 90, 94, 9, 10, 11, 11, 11, 11, 120]
@c = [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240]
@max_weight = 750

def zero_one_recursive_test
  GreedyAlgorithms::Knapsack.zero_one_recursive(@w, @c, @max_weight) == 2593
end

def zero_one_memoized_test
  GreedyAlgorithms::Knapsack.zero_one_memoized(@w, @c, @max_weight).first == 2593
end

def zero_one_bottom_up_test
  w = [1, 3, 4, 5]
  c = [1, 4, 5, 7]
  full_array = GreedyAlgorithms::Knapsack
               .zero_one_bottom_up(w, c, 7) ==
              [
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 1, 1, 1, 1, 1, 1, 1],
                [0, 1, 1, 4, 5, 5, 5, 5],
                [0, 1, 1, 4, 5, 6, 6, 9],
                [0, 1, 1, 4, 5, 7, 8, 9]
              ]

  optimal_weight = GreedyAlgorithms::Knapsack
                   .zero_one_bottom_up(@w, @c, @max_weight).last.last == 2593

  full_array && optimal_weight
end

UnitTest.method('0-1 Knapsack Recursive', zero_one_recursive_test)
UnitTest.method('0-1 Knapsack Memoized', zero_one_memoized_test)
UnitTest.method('0-1 Knapsack Dynamic Programming', zero_one_bottom_up_test)
