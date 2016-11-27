require_relative '../../unit_test'
require_relative './seed_graph'
require_relative '../topological_sort'

def topological_sort_test
  graph = SeedGraph.topological_graph
  list = Graphs::TopologicalSort.topological_sort(graph, graph.vertices.first, true)
  sorted_vertices = convert_topology_list_to_array(list).map { |x| x.attribute }

  bool_undershorts_pants = sorted_vertices.index('undershorts') < sorted_vertices.index('pants')
  bool_undershorts_shoes = sorted_vertices.index('undershorts') < sorted_vertices.index('shoes')
  bool_socks_shoes = sorted_vertices.index('socks') < sorted_vertices.index('shoes')
  bool_belt_jacket = sorted_vertices.index('belt') < sorted_vertices.index('jacket')
  bool_pants_shoes = sorted_vertices.index('pants') < sorted_vertices.index('shoes')
  bool_shirt_belt = sorted_vertices.index('shirt') < sorted_vertices.index('belt')
  bool_shirt_tie = sorted_vertices.index('shirt') < sorted_vertices.index('tie')
  bool_tie_jacket = sorted_vertices.index('tie') < sorted_vertices.index('jacket')

  bool_undershorts_pants &&
  bool_undershorts_shoes &&
  bool_socks_shoes &&
  bool_belt_jacket &&
  bool_pants_shoes &&
  bool_shirt_belt &&
  bool_shirt_tie &&
  bool_tie_jacket
end

def convert_topology_list_to_array(list)
  array = []
  while !list.nil?
    array << list.vertex
    list = list.next_pointer
  end
  array
end


UnitTest.method('Topological Sort', topological_sort_test)
