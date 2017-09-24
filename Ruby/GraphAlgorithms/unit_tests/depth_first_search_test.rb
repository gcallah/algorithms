require_relative './seed_graph'
require_relative '../depth_first_search'
require 'minitest/autorun'

class DepthFirstSearchTest < Minitest::Test
  def test_dfs
    graph = SeedGraph.undirected_graph
    assert_equal(Graphs::DepthFirstSearch.DFS(graph, graph.vertices.last), "FOUND!!")
  end
end
