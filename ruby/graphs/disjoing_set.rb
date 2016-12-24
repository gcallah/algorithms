class Node
  attr_accessor :key, :set_pointer, :next_pointer

  def initialize(key, set_pointer, next_pointer)
    @key, @set_pointer, @next = key, set_pointer, next_pointer
  end
end

class DisjointSet
  attr_accessor :head, :tail

  def initialize(head, tail=nil)
    @head, @tail = head, tail
  end

  def make_set(node)
    self.new(node, node)
  end

  def union
    
  end

  def find_set

  end
end
