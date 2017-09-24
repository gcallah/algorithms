require_relative './seed_graph'
require_relative '../breadth_first_search'
require 'minitest/autorun'

class BreadthFirstSearchTest < Minitest::Test
  def test_bfs
    graph = SeedGraph.undirected_graph
    assert_equal(Graphs::BreadthFirstSearch.BFS(graph, graph.vertices.first, graph.vertices.last), "FOUND!!")
  end
end
