require_relative './disjoint_set'

module Graphs
  class MinimumSpanningTree
    class << self
      def MST_generic

      end

      def MST_kruskal(graph)
        a = []
        graph.vertices.each do |vertex|
          DisjointSet.make_set(vertex)
        end

        sorted_edges = graph.edges.sort_by { |x| x.w }

        sorted_edges.each do |edge|
          if DisjointSet.find_set(edge.v1) != DisjointSet.find_set(edge.v2)
            a << edge
            DisjointSet.union(edge.v1, edge.v2)
          end
        end

        a
      end

      def MST_prim

      end
    end
  end
end
