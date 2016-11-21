require_relative './seed_graph'
require_relative '../depth_first_search'

def dfs_test
  graph = SeedGraph.undirected_graph
  Graphs::DepthFirstSearch.DFS(graph, graph.vertices.last)
end

p dfs_test
