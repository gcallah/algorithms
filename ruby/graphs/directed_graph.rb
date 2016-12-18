require_relative './graph'

class DirectedGraph < Graph
  # Public: Populates the adjacency list for each vertex in a graph data structure
  #         NOTE: Vertices and Edges are to be initialized beforehand
  # Examples
  #   graph = DirectedGraph.new(vertex_list, array_list)
  #   graph.populate_adjacency_list
  #
  def populate_adjacency_list
    @vertices.each do |vertex|
      if vertex.adj_list.empty?
        # Only selects edges whose starting edge position is same as the
        # vertex being iterated upon
        vertex.adj_list = @edges.select { |edge| (edge.v1 == vertex) }
                                .map { |edge| edge.v2  }
      end
    end
  end

  # Public: Populates adjacency list using an array input assuming the elements
  #         as attribute of the Vertex class
  #
  # The method first builds vertices and edges, then calls populate_adjacency_list
  # method which adds adjacency_list to each and every vertex
  #
  # Examples
  #   array = [ [0, 1], [0, 6], [0, 8], [1, 4], [1, 6], [1, 9], [2, 4], [2, 6],
  #             [3, 4], [3, 5], [3, 8], [4, 5], [4, 9], [7, 8], [7, 9] ]
  #   graph = DirectedGraph.new([], []) # Since default constructor expects
  #                                       vertices and edges. Provide empty arrays
  #
  #   graph.populate_adjacency_list_via_array(array)
  #
  def populate_adjacency_list_via_array(array)
    @vertices = array.flatten.uniq.map { |v| Vertex.new('WHITE', 1, nil, [], v) }
    # Only directed edges are being added to the edges list
    @edges = array.map { |edge| Edge.new(find(edge[0]), find(edge[1])) }
    populate_adjacency_list
  end

end
