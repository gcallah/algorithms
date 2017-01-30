require_relative './disjoint_set'
require_relative '../heaps/min_heap'

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
          u.key = Float::INFINITY
          u.pi = nil
        end

        r.key = 0
        arr = graph.vertices
        q = arr
        # Heap::MinHeap::build_min_heap(q)
        while true
          u = q.sort_by! { |x| x.key }.first
          q = q[1..(q.length-1)]
          # u = Heap::MinHeap::heap_extract_min(q)
          break if u.nil?
          u.adj_list.each do |v|
            if q.include?(v) && graph.get_edge_weight(u, v) < v.key
              v.pi = u
              v.key = graph.get_edge_weight(u, v)
            end
          end
        end
      end
    end
  end
end
