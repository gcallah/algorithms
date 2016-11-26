require_relative '../graph'

class SeedGraph
  class << self
    def undirected_graph
      v1 = Vertex.new('WHITE', 1, nil, [], 1)
      v2 = Vertex.new('WHITE', 1, nil, [], 2)
      v3 = Vertex.new('WHITE', 1, nil, [], 3)
      v4 = Vertex.new('WHITE', 1, nil, [], 4)
      v5 = Vertex.new('WHITE', 1, nil, [], 5)
      v6 = Vertex.new('WHITE', 1, nil, [], 6)

      edge15 = Edge.new(v1, v5)
      edge12 = Edge.new(v1, v2)

      edge25 = Edge.new(v2, v5)
      edge24 = Edge.new(v2, v4)
      edge23 = Edge.new(v2, v3)

      edge34 = Edge.new(v3, v4)

      edge45 = Edge.new(v4, v5)
      edge43 = Edge.new(v4, v3)

      graph = UndirectedGraph.new([v1, v2, v3, v4, v5], [edge15,
                                                         edge12,
                                                         edge25,
                                                         edge45,
                                                         edge24,
                                                         edge23,
                                                         edge34,])
      graph.populate_adjacency_list
      graph
    end

    def directed_graph
      v1 = Vertex.new('WHITE', 1, nil, [], 1)
      v2 = Vertex.new('WHITE', 1, nil, [], 2)
      v3 = Vertex.new('WHITE', 1, nil, [], 3)
      v4 = Vertex.new('WHITE', 1, nil, [], 4)
      v5 = Vertex.new('WHITE', 1, nil, [], 5)
      v6 = Vertex.new('WHITE', 1, nil, [], 6)

      edge12 = Edge.new(v1, v2)
      edge14 = Edge.new(v1, v4)

      edge25 = Edge.new(v2, v5)

      edge35 = Edge.new(v3, v5)
      edge36 = Edge.new(v3, v6)

      edge42 = Edge.new(v4, v2)

      edge54 = Edge.new(v5, v4)

      edge66 = Edge.new(v6, v6)

      graph = DirectedGraph.new([v1, v2, v3, v4, v5, v6], [edge12, edge14,
                                                           edge25,
                                                           edge35, edge36,
                                                           edge42,
                                                           edge54,
                                                           edge66])
      graph.populate_adjacency_list
      graph
    end
  end
end
