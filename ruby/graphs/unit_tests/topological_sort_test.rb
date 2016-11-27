require_relative '../../unit_test'
require_relative './seed_graph'
require_relative '../topological_sort'

def topological_sort_test
  graph = SeedGraph.topological_graph
  Graphs::TopologicalSort.topological_sort(graph, graph.vertices.first, true)
end

k = topological_sort_test
while !k.nil?
  p k.vertex.attribute
  k = k.next_pointer
end
# UnitTest.method('BFS', bfs_test)
