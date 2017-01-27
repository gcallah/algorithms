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

      def MST_prim(graph, r)
        graph.vertices.each do |u|
          u.key = -Float::INFINITY
          u.pi = nil
        end

        r.key = 0
        q = build_priority_queue(graph.vertices)
        while !q.empty?
          u = extract_min(q)
          u.adj_list.each do |v|
            if q.include?(v) && v.w < v.key
              v.pi = u
              # v.key = 
            end
          end
        end
      end

      def build_priority_queue(list)
        list.sort_by { |x| x.key }
      end

      def extract_min(list)
        list.first
      end
    end
  end
end
