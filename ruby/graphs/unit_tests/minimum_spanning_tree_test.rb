require_relative '../../unit_test'
require_relative './seed_graph'
require_relative '../minimum_spanning_tree'

def mst_kruskal_test
  graph = SeedGraph.kruskal_undirected_graph
  Graphs::MinimumSpanningTree.MST_kruskal(graph).map { |x| [x.v1.key, x.v2.key] } ==
  [["g", "h"], ["c", "i"], ["f", "g"], ["c", "f"], ["a", "b"], ["c", "d"], ["b", "c"], ["d", "e"]]
end

UnitTest::method('Kruskals MST', mst_kruskal_test)
