require_relative './depth_first_search'

module Graphs
  class TopologicalSort
    class << self
      def topological_sort(g, searchable, topological)
        Graphs::DepthFirstSearch.DFS(g, nil, true)
      end
    end
  end
end
