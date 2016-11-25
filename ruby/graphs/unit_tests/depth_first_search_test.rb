require_relative '../../unit_test'
require_relative './seed_graph'
require_relative '../depth_first_search'

def dfs_test
  graph = SeedGraph.undirected_graph
  Graphs::DepthFirstSearch.DFS(graph, graph.vertices.last) == "FOUND!!"
end

UnitTest.method('DFS', dfs_test)
