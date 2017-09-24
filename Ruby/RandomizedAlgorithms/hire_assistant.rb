require_relative './permuting_arrays'

module RandomizedAlgorithms
  class << self
    # Public: Consolidates a list of all the candidates that got hired
    #
    # ARGS:
    # candidates  - Array with each candidate score
    #
    # Return: Array
    #
    # Examples
    #   hire_assistant([0, 9, 2, 15, 17, 9, 10, 20])
    #   => [1, 3, 4, 7]
    def hire_assistant(candidates)
      best = 0
      hired_candidates = []
      (0..(candidates.size-1)).each do |i|
        if candidates[i] > candidates[best]
          best = i
          hired_candidates << i
        end
      end
      hired_candidates
    end

    # Public: Consolidates a list of all the candidates that got hired
    #         RANDOMIZED
    #
    # ARGS:
    # candidates  - Array with each candidate score
    # permutation_method - Method by which the input array has to be randomized
    #    Available methods "permute_by_sorting" DEFAULT
    #                      "randomize_in_place"
    #                      "permute_without_identity"
    #                      "permute_with_all"
    # Return: Array
    #
    # Examples
    #   randomized_hire_assistant([0, 9, 2, 15, 17, 9, 10, 20])
    #   => [2, 7]
    #   => [1]
    #   => []
    #   NOTE: Every output for each input will be different due to randomization
    def randomized_hire_assistant(candidates, permutation_method="permute_by_sorting")
      candidates = RandomizedAlgorithms.send(permutation_method, candidates)
      best = 0
      hired_candidates = []
      (0..(candidates.size-1)).each do |i|
        if candidates[i] > candidates[best]
          best = i
          hired_candidates << i
        end
      end
      hired_candidates
    end
  end
end
