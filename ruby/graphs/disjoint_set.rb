# Public: Class that creates instances for the objects that can be contained
#         in a set
#
# key - Any unique identifier for a particular object analogous to satellite data
# set_pointer - Pointer pointing to the DisjointSet instance
# next_pointer - Pointer pointing to the next SetObject
#
# Examples
#   SetObject.new('a', nil, nil)
#
class SetObject
  attr_accessor :key, :set_pointer, :next_pointer

  def initialize(key, set_pointer, next_pointer)
    @key, @set_pointer, @next_pointer = key, set_pointer, next_pointer
  end
end

# Public: Root object which maintains the head and tail pointer to the list
#         of SetObjects linked using linked lists
#
# head - Pointer pointing to the FIRST SetObject in the DisjointSet
# tail - Pointer pointing to the LAST SetObject in the DisjointSet
#
# Examples
#   SetObject.new('a', nil, nil)
#
class DisjointSet
  attr_accessor :head, :tail

  def initialize(head, tail=nil)
    @head, @tail = head, tail
  end

  # Public: Returns an instance of DisjointSet with one SetObject instance
  #         NOTE: CLASS METHOD
  #
  # x - SetObject to be added
  # TODO: Add the resulting DisjointSet instances to give a gist of what is achieved
  # Examples
  #   set_object = SetObject.new('1', nil, nil)
  #   DisjointSet.make_set(set_object)
  #
  def self.make_set(x)
    raise "X SHOULD NOT BE NIL" if x.nil?
    x.set_pointer = new(x, x)
    x.set_pointer
  end

  # Public: Returns an instance of DisjointSet which is resulted from the UNION
  #         of two DisjointSets which have the corresponding SetObjects, x and y
  #         NOTE: CLASS METHOD
  #
  # x - SetObject instance whose respective DisjointSet is to be UNIONED
  # y - SetObject instance whose respective DisjointSet is to be UNIONED
  #
  # TODO: Add the resulting DisjointSet instances to give a gist of what is achieved
  # Examples
  #   x = SetObject.new('x', nil, nil)
  #   y = SetObject.new('y', nil, nil)
  #   DisjointSet.union(x, y)
  #
  def self.union(x, y)
    raise "X OR Y SHOULD NOT BE NIL" if x.nil? || y.nil?
    x.set_pointer.tail.next_pointer = y.set_pointer.head
    x.set_pointer.tail = y.set_pointer.tail
    y_iterator = y.set_pointer.head
    while(y_iterator != nil)
      y_iterator.set_pointer = x.set_pointer
      y_iterator = y_iterator.next_pointer
    end
    # delete y -> Automatically managed by the garbage collector
    x.set_pointer
  end

  # Public: Returns the representative of the SetObject instance which is the
  #         first object in the linked list from the DisjointSet
  #         NOTE: CLASS METHOD
  #
  # x - SetObject instance which is attached to a DisjointSet instance
  #
  # TODO: Add the resulting DisjointSet instances to give a gist of what is achieved
  # Examples
  #   x = SetObject.new('x', nil, nil)
  #   DisjointSet.find_set(x)
  #   => (SetObject instance which is attached to head pointer of set instance)
  #
  def self.find_set(x)
    raise "X SHOULD NOT BE NIL" if x.nil?
    x.set_pointer
  end
end
