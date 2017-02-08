require 'pry'
require_relative './seed_graph'
require_relative '../minimum_spanning_tree'
require 'minitest/autorun'

class MinimumSpanningTreeTest < Minitest::Test
  def test_mst_kruskal
    graph = SeedGraph.kruskal_undirected_graph
    assert_equal(Graphs::MinimumSpanningTree.MST_kruskal(graph).map { |x| [x.v1.key, x.v2.key] },
    [["g", "h"], ["c", "i"], ["f", "g"], ["c", "f"], ["a", "b"], ["c", "d"], ["b", "c"], ["d", "e"]])
  end

  # TODO: Complete this test case once Prim is implemented using priority queue
  def test_mst_prim
    graph = SeedGraph.prim_undirected_graph
    Graphs::MinimumSpanningTree.MST_prim(graph, graph.vertices.first)
    assert_equal(graph.vertices.map { |x| x.d }, ["i", "b", "c", "d", "e", "f", "g", "h", "i"])
    assert_equal(graph.vertices.map { |x| x.pi.d }, ["c", "a", "b", "c", "d", "c", "f", "g", "c"])
  end
end
