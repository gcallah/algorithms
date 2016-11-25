module Graphs
  class DepthFirstSearch
    class << self
      @time = nil
      @found = nil

      # Internal: Traverses through the vertices of a graph in a DEPTH wise manner
      #           Adjacent node is considered only after traversing the complete
      #           depth of the current node
      #
      # graph - Graph to be searched
      # searchable - Node in the graph to be searched for
      #
      # Examples
      #   DFS(graph, graph.vertices.last)
      #
      def DFS(g, searchable = nil)
        g.vertices.each do |u|
          u.color = 'WHITE'
          u.pi = nil
        end
        @time = 0

        g.vertices.each do |u|
          DFS_visit(g, u, searchable) if u.color == 'WHITE'
        end
        @found
      end

      def DFS_visit(g, u, searchable = nil)
        @time += 1
        u.d = @time
        u.color = 'GRAY'
        u.adj_list.each do |v|
          if v.color == 'WHITE'
            v.pi = u
            @found = "FOUND!!" if v.attribute == searchable.attribute
            DFS_visit(g, v, searchable)
          end
        end
        u.color = 'BLACK'
        @time += 1
        u.f = @time
      end

    end
  end
end
