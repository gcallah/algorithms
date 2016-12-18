require_relative './graph'

class UndirectedGraph < Graph
  # Public: Populates the adjacency list for each vertex in a graph data structure
  #         NOTE: Vertices and Edges are to be initialized beforehand
  # Examples
  #   graph = UndirectedGraph.new(vertex_list, array_list)
  #   graph.populate_adjacency_list
  #
  def populate_adjacency_list
    @vertices.each do |vertex|
      if vertex.adj_list.empty?
        # Selection is done by checking if the vertex being iterated is at either
        # location of the edge and then corresponding vertices are returned
        vertex.adj_list = @edges.select { |edge| (edge.v1 == vertex || edge.v2 == vertex) }
                                .map { |edge| (edge.v1 == vertex) ? edge.v2 : edge.v1  }
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
  #   graph = UndirectedGraph.new([], []) # Since default constructor expects
  #                                       vertices and edges. Provide empty arrays
  #
  #   graph.populate_adjacency_list_via_array(array)
  #
  def populate_adjacency_list_via_array(array)
    @vertices = array.flatten.uniq.map { |v| Vertex.new('WHITE', 1, nil, [], v) }
    # Both forward and backward edges are being added to the edges list
    forward_edges = array.map { |edge| Edge.new(find(edge[0]), find(edge[1])) }
    backward_edges = array.map { |edge| Edge.new(find(edge[1]), find(edge[0])) }
    @edges = forward_edges + backward_edges
    populate_adjacency_list
  end
end
