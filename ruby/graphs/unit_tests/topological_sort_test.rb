require_relative '../../unit_test'
require_relative './seed_graph'
require_relative '../topological_sort'

def topological_sort_test
  graph = SeedGraph.topological_graph
  list = Graphs::TopologicalSort.topological_sort(graph, graph.vertices.first, true)
  p convert_topology_list_to_array(list)
end

def convert_topology_list_to_array(list)
  array = []
  while !list.nil?
    array << list.vertex
    list = list.next_pointer
  end
  array
end

# k = topological_sort_test
# while !k.nil?
#   p k.vertex.attribute
#   k = k.next_pointer
# end

topological_sort_test

# UnitTest.method('Topological Sort', topological_sort_test)
