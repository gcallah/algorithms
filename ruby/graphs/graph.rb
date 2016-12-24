class Vertex
  attr_accessor :color, :d, :pi, :adj_list, :attribute, :f

  def initialize(color, d, pi, adj_list=[], attribute)
    @color, @d, @pi, @adj_list, @attribute= color, d, pi, adj_list, attribute
  end
end

# TODO: Create a new class GenericVertex to avoid multiple definitions of Vertex
class MSTVertex
  attr_accessor :key, :set_pointer, :next_pointer

  def initialize(key, set_pointer, next_pointer)
    @key, @set_pointer, @next_pointer = key, set_pointer, next_pointer
  end
end

class Edge
  attr_accessor :v1, :v2

  def initialize(v1, v2)
    @v1, @v2 = v1, v2
  end
end

# TODO: Create a new class GenericEdge to avoid multiple definitions of Edge
class MSTEdge
  attr_accessor :v1, :v2, :w

  def initialize(v1, v2, w)
    @v1, @v2, @w = v1, v2, w
  end
end

class Graph
  attr_accessor :vertices, :edges

  def initialize(edges)
    @edges = edges
    @vertices = build_vertices(edges)
  end

  def initialize(vertices, edges)
    @vertices, @edges = vertices, edges
  end

  def find(attribute)
    @vertices.select { |v| v.attribute == attribute }.first
  end

  def get_adjacency_list(vertex)
    vertex.adj_list
  end

  def add_vertex(vertex)
    @vertices << vertex
  end

  def add_edge(edge)
    edge.v1.adj_list << edge.v2
    edge.v2.adj_list << edge.v1
  end

  def add_edge(v1, v2)
    @edges << Edge.new(v1, v2)
    v1.adj_list << v2
    v2.adj_list << v1
  end

  private
  def build_vertices(edges)
    vertices = []
    edges.each do |x|
      vertices << x.v1
      vertices << x.v2
    end
    vertices.uniq
  end
end

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

  def transpose
    @edges.each do |x|
      x.v1, x.v2 = x.v2, x.v1
    end
  end
end
