require 'pry'
require_relative './disjoint_set'
require_relative '../heaps/min_heap'
require_relative '../heaps/priority_queue'

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

      def vertex_include(arr, v)
        arr.each do |x|
          if x.equal?(v)
            return true
          end
        end
        return false
      end

      # TODO: DO NOT FORGET TO IMPLEMENT THIS USING PRIORITY QUEUE AS
      #       EXPLAINED IN THE CLRS BOOK
      def MST_prim(graph, r)
        graph.vertices.each do |u|
          u.key = Float::INFINITY
          u.pi = nil
        end

        r.key = 0
        q = graph.vertices
        while q.length != 0
          u = Heap::PriorityQueue::heap_extract_min(q)
          q = q[1..(q.length-1)]
          u.adj_list.each do |v|
            if v.belongs_to?(q) && graph.get_edge_weight(u, v) < v.key
              v.pi = u
              v.key = graph.get_edge_weight(u, v)
            end
          end
        end
      end
    end
  end
end
