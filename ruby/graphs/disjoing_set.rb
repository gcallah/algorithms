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

  def self.make_set(x)
    raise "X SHOULD NOT BE NIL" if x.nil?
    new(x, x)
  end

  def self.union(x, y)
    raise "X OR Y SHOULD NOT BE NIL" if x.nil? || y.nil?
    x.set_pointer.tail = y.set_pointer.head
    y_iterator = y.head
    while(y_iterator != nil)
      y_iterator.set_pointer = x.set_pointer
      y_iterator = y_iterator.next_pointer
    end
    # delete y -> Automatically managed by the garbage collector
    x.set_pointer
  end

  def self.find_set(x)
    raise "X SHOULD NOT BE NIL" if x.nil?
    x.set_pointer
  end
end

x = Node.new(10, nil, nil)
p DisjointSet.make_set(x)
