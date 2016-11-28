require_relative './graph.rb'

module Graphs
  class BreadthFirstSearch
    class << self

      # Internal: Traverses through the vertices of a graph in a level wise,
      #           one level at a time manner
      #           Next level is considered only after all the elements in the
      #           current level are traversed through
      #
      # graph - Graph to be searched
      # s - Starting node in the graph from which the search has to be initiated
      # searchable - Node in the graph to be searched for
      #
      # Examples
      #   BFS(graph, graph.vertices.first, graph.vertices.last)
      #
      def BFS(graph, s, searchable = nil)
        graph.vertices.select { |x| x != s }.each do |u|
          u.color = 'WHITE'
          u.d = Float::INFINITY
          u.pi = nil
        end

        s.color = 'GRAY'
        s.d = 0
        s.pi = nil

        q = Queue.new
        q.enq(s)
        while q.size != 0
          u = q.deq
          u.adj_list.each do |v|
            if v.color == 'WHITE'
              return "FOUND!!" if v.attribute == searchable.attribute
              v.color = 'GRAY'
              v.d = u.d + 1
              v.pi = u
              q.enq(v)
            end
          end
          u.color = 'BLACK'
        end
      end

      def print_BFS_path(g, s, v)
        if v == s
          print s.attribute
        elsif v.pi == nil
          print "NO PATH FROM #{s.attribute} TO #{v.attribute} EXISTS"
        else
          print_BFS_path(g, s, v.pi)
          print v.attribute
        end
      end

    end
  end
end
