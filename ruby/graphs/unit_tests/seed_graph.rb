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

      graph = UndirectedGraph.new([v1, v2, v3, v4, v5], [edge15, edge12,
                                                         edge25, edge24, edge23,
                                                         edge34,
                                                         edge45])

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

    def topological_graph
      undershorts = Vertex.new('WHITE', 1, nil, [], 'undershorts')
      socks = Vertex.new('WHITE', 1, nil, [], 'socks')
      pants = Vertex.new('WHITE', 1, nil, [], 'pants')
      shoes = Vertex.new('WHITE', 1, nil, [], 'shoes')
      watch = Vertex.new('WHITE', 1, nil, [], 'watch')
      belt = Vertex.new('WHITE', 1, nil, [], 'belt')
      shirt = Vertex.new('WHITE', 1, nil, [], 'shirt')
      tie = Vertex.new('WHITE', 1, nil, [], 'tie')
      jacket = Vertex.new('WHITE', 1, nil, [], 'jacket')

      edge_undershorts_pants = Edge.new(undershorts, pants)
      edge_undershorts_shoes = Edge.new(undershorts, shoes)

      edge_socks_shoes = Edge.new(socks, shoes)

      edge_watch_watch = Edge.new(watch, watch)

      edge_belt_jacket = Edge.new(belt, jacket)

      edge_pants_shoes = Edge.new(pants, shoes)

      edge_shirt_belt = Edge.new(shirt, belt)

      edge_shirt_tie = Edge.new(shirt, tie)

      edge_tie_jacket = Edge.new(tie, jacket)


      graph = DirectedGraph.new([undershorts, socks, pants, shoes, watch, belt, shirt, tie, jacket],
      [edge_undershorts_pants,
edge_undershorts_shoes,edge_socks_shoes,
edge_watch_watch,
edge_belt_jacket,
edge_pants_shoes,
edge_shirt_belt,
edge_shirt_tie,
edge_tie_jacket])
      graph.populate_adjacency_list
      graph
    end

  end
end

# [ [0, 1], [0, 6], [0, 8], [1, 4], [1, 6], [1, 9], [2, 4], [2, 6], [3, 4], [3, 5], [3, 8], [4, 5], [4, 9], [7, 8], [7, 9] ]
# k = SeedGraph.undirected_graph
# p k.edges.map { |x| [x.v1.attribute, x.v2.attribute] }.sort
