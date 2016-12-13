require_relative '../activity_selection'
require_relative '../../unit_test'

@s = [0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
@f = [0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16]

def recursive_activity_selector_test
  GreedyAlgorithms::ActivitySelection.
  recursive_activity_selector(@s, @f, 0, 11) == [1, 4, 8, 11]
end

def greedy_activity_selector_test
  GreedyAlgorithms::ActivitySelection.
  greedy_activity_selector(@s, @f) == [1, 4, 8, 11]
end

UnitTest.method('Recursive Activity Selection', recursive_activity_selector_test)
UnitTest.method('Greedy Activity Selection', greedy_activity_selector_test)
