module Graphs
  class DepthFirstSearch
    class << self

      @time = nil

      def DFS(g, searchable = nil)
        g.vertices.each do |u|
          u.color = 'WHITE'
          u.pi = nil
        end
        @time = 0

        g.vertices.each do |u|
          DFS_visit(g, u, searchable) if u.color == 'WHITE'
        end
        nil
      end

      def DFS_visit(g, u, searchable = nil)
        @time += 1
        u.d = @time
        u.color = 'GRAY'
        u.adj_list.each do |v|
          if v.color == 'WHITE'
            v.pi = u
            p "YAY FOUND!" if v.attribute == searchable.attribute
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
