require_relative './seed_graph'
require_relative '../breadth_first_search'

def bfs_test
  graph = SeedGraph.undirected_graph
  Graphs::BreadthFirstSearch.BFS(graph, graph.vertices.first, graph.vertices.last)
end

p bfs_test
