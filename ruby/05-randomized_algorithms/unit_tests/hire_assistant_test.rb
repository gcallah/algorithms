require_relative '../hire_assistant'
require 'minitest/autorun'

class HireAssistantTest < Minitest::Test
  def test_hire_assistant
    candidates = [0, 9, 2, 15, 17, 9, 10, 20]
  	hired_candidates = RandomizedAlgorithms::hire_assistant(candidates)
  	assert_equal(hired_candidates, [1, 3, 4, 7])
  end
end
