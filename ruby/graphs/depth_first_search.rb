module Graphs
  class Node
    attr_accessor :vertex, :next_pointer

    def initialize(vertex, next_pointer)
      @vertex, @next_pointer = vertex, next_pointer
    end
  end

  class DepthFirstSearch
    class << self
      @time = nil
      @found = nil
      @topological_list = nil

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
      def DFS(g, searchable = nil, topological = false)
        g.vertices.each do |u|
          u.color = 'WHITE'
          u.pi = nil
        end
        @time = 0

        g.vertices.each do |u|
          DFS_visit(g, u, searchable, topological) if u.color == 'WHITE'
        end
        @topological_list || @found
      end

      def DFS_visit(g, u, searchable = nil, topological = false)
        @time += 1
        u.d = @time
        u.color = 'GRAY'
        u.adj_list.each do |v|
          if v.color == 'WHITE'
            v.pi = u
            @found = "FOUND!!" if searchable && v.attribute == searchable.attribute
            DFS_visit(g, v, searchable, topological)
          end
        end
        u.color = 'BLACK'
        @time += 1
        u.f = @time
        if topological
          new_node = Node.new(u, nil)
          new_node.next_pointer = @topological_list
          @topological_list = new_node
        end
      end

    end
  end
end
