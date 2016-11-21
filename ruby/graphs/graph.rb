class Vertex
  attr_accessor :color, :d, :pi, :attribute

  def initialize(color, d, pi, attribute)
    @color, @d, @pi, @attribute = color, d, pi, attribute
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

  def get_adjacency_list(vertex)
    
  end

  def add_vertex(vertex)

  end

  def add_edge(edge)

  end

  def add_edge(v1, v2)

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
