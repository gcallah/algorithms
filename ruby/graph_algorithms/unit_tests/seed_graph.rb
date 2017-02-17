require_relative '../undirected_graph'
require_relative '../directed_graph'

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

    def kruskal_undirected_graph
      a = MSTVertex.new('a', nil, nil)
      b = MSTVertex.new('b', nil, nil)
      c = MSTVertex.new('c', nil, nil)
      d = MSTVertex.new('d', nil, nil)
      e = MSTVertex.new('e', nil, nil)
      f = MSTVertex.new('f', nil, nil)
      g = MSTVertex.new('g', nil, nil)
      h = MSTVertex.new('h', nil, nil)
      i = MSTVertex.new('i', nil, nil)

      edge_ab_ba = MSTEdge.new(a, b, 4)
      edge_bc_cb = MSTEdge.new(b, c, 8)
      edge_cd_dc = MSTEdge.new(c, d, 7)
      edge_de_ed = MSTEdge.new(d, e, 9)
      edge_ef_fe = MSTEdge.new(e, f, 10)
      edge_fg_gf = MSTEdge.new(f, g, 2)
      edge_gh_hg = MSTEdge.new(g, h, 1)
      edge_ha_ah = MSTEdge.new(h, a, 8)
      edge_bh_hb = MSTEdge.new(b, h, 11)
      edge_ci_ic = MSTEdge.new(c, i, 2)
      edge_ih_hi = MSTEdge.new(i, h, 7)
      edge_ig_gi = MSTEdge.new(i, g, 6)
      edge_cf_fc = MSTEdge.new(c, f, 4)
      edge_df_fd = MSTEdge.new(d, f, 14)

      graph = UndirectedGraph.new([a, b, c, d, e, f, g, h, i],
                                  [edge_ab_ba, edge_bc_cb, edge_cd_dc, edge_de_ed, edge_ef_fe, edge_fg_gf, edge_gh_hg, edge_ha_ah, edge_bh_hb, edge_ci_ic, edge_ih_hi, edge_ig_gi, edge_cf_fc, edge_df_fd])

      graph
    end


    def prim_undirected_graph
      a = MSTPrimVertex.new('a', nil, nil, [])
      b = MSTPrimVertex.new('b', nil, nil, [])
      c = MSTPrimVertex.new('c', nil, nil, [])
      d = MSTPrimVertex.new('d', nil, nil, [])
      e = MSTPrimVertex.new('e', nil, nil, [])
      f = MSTPrimVertex.new('f', nil, nil, [])
      g = MSTPrimVertex.new('g', nil, nil, [])
      h = MSTPrimVertex.new('h', nil, nil, [])
      i = MSTPrimVertex.new('i', nil, nil, [])

      edge_ab_ba = MSTEdge.new(a, b, 4)
      edge_bc_cb = MSTEdge.new(b, c, 8)
      edge_cd_dc = MSTEdge.new(c, d, 7)
      edge_de_ed = MSTEdge.new(d, e, 9)
      edge_ef_fe = MSTEdge.new(e, f, 10)
      edge_fg_gf = MSTEdge.new(f, g, 2)
      edge_gh_hg = MSTEdge.new(g, h, 1)
      edge_ha_ah = MSTEdge.new(h, a, 8)
      edge_bh_hb = MSTEdge.new(b, h, 11)
      edge_ci_ic = MSTEdge.new(c, i, 2)
      edge_ih_hi = MSTEdge.new(i, h, 7)
      edge_ig_gi = MSTEdge.new(i, g, 6)
      edge_cf_fc = MSTEdge.new(c, f, 4)
      edge_df_fd = MSTEdge.new(d, f, 14)

      graph = UndirectedGraph.new([a, b, c, d, e, f, g, h, i],
                                  [edge_ab_ba, edge_bc_cb, edge_cd_dc, edge_de_ed, edge_ef_fe, edge_fg_gf, edge_gh_hg, edge_ha_ah, edge_bh_hb, edge_ci_ic, edge_ih_hi, edge_ig_gi, edge_cf_fc, edge_df_fd])

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
      [edge_undershorts_pants, edge_undershorts_shoes, edge_socks_shoes, edge_watch_watch,
      edge_belt_jacket, edge_pants_shoes, edge_shirt_belt, edge_shirt_tie, edge_tie_jacket])

      graph.populate_adjacency_list
      graph
    end

  end
end
