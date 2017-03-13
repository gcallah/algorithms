require_relative './seed_graph'
require_relative '../minimum_spanning_tree'
require 'minitest/autorun'

class MinimumSpanningTreeTest < Minitest::Test
  def test_mst_kruskal
    graph = SeedGraph.kruskal_undirected_graph
    possible_solution_1 = [["g", "h"], ["c", "i"], ["f", "g"], ["c", "f"], ["a", "b"], ["c", "d"], ["b", "c"], ["d", "e"]]
    possible_solution_2 = [["g", "h"], ["f", "g"], ["c", "i"], ["a", "b"], ["c", "f"], ["c", "d"], ["h", "a"], ["d", "e"]]
    solution = Graphs::MinimumSpanningTree.MST_kruskal(graph).map { |x| [x.v1.key, x.v2.key] }
    assertion = (solution == possible_solution_1 || solution == possible_solution_2)
    assert_equal(assertion, true)
  end

  def test_mst_prim
    graph = SeedGraph.prim_undirected_graph
    Graphs::MinimumSpanningTree.MST_prim(graph, graph.vertices.first)
    assert_equal(graph.vertices.map { |x| x.d }, ["i", "b", "c", "d", "e", "f", "g", "h", "i"])
    assert_equal(graph.vertices.map { |x| x.pi.d }, ["c", "a", "b", "c", "d", "c", "f", "g", "c"])
  end
end
