class Vertex
  attr_accessor :color, :d, :pi, :adj_list, :attribute, :f

  def initialize(color, d, pi, adj_list=[], attribute)
    @color, @d, @pi, @adj_list, @attribute= color, d, pi, adj_list, attribute
  end
end

class Edge
  attr_accessor :v1, :v2

  def initialize(v1, v2)
    @v1, @v2 = v1, v2
  end
end

class Graph
  attr_accessor :vertices, :edges

  def initialize(vertices)
    @vertices = vertices
  end

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
  def populate_adjacency_list
    @vertices.each do |vertex|
      if vertex.adj_list.empty?
        vertex.adj_list = @edges.select { |edge| (edge.v1 == vertex || edge.v2 == vertex) }
                                .map { |edge| (edge.v1 == vertex) ? edge.v2 : edge.v1  }
      end
    end
  end

  def populate_adjacency_list_via_array(array)
    @vertices = array.flatten.uniq.map { |v| Vertex.new('WHITE', 1, nil, [], v) }
    forward_edges = array.map { |edge| Edge.new(find(edge[0]), find(edge[1])) }
    backward_edges = array.map { |edge| Edge.new(find(edge[1]), find(edge[0])) }
    @edges = forward_edges + backward_edges
  end
end

class DirectedGraph < Graph
  def populate_adjacency_list
    @vertices.each do |vertex|
      if vertex.adj_list.empty?
        vertex.adj_list = @edges.select { |edge| (edge.v1 == vertex) }
                                .map { |edge| edge.v2  }
      end
    end
  end

  def populate_adjacency_list_via_array(array)
    @vertices = array.flatten.uniq.map { |v| Vertex.new('WHITE', 1, nil, [], v) }
    @edges = array.map { |edge| Edge.new(find(edge[0]), find(edge[1])) }      
  end

end
