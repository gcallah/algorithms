# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE

# INDEX
#      direct_addressing_search
#      direct_addressing_insert
#      direct_addressing_delete
#
#      chained_hash_insert
#      chained_hash_search
#      chained_hash_delete
#
#      h
#      h1
#      h2
#      division_h
#      multilpication_h
#
#      linear_probing
#      quadratic_probing
#      double_hasing
#
#      open_addressing_insert
#      open_addressing_search

# Public: Analogous to a struct in C/C++ for building linked lists.
# This class only contains an initialize method which acts a constructor for
# setting and accessing the object properties
#
# There are multiple ways this can be defined, this is my personal favorite
# Other ways are listed at the bottom of the file
# Choose whatever is convenient for YOU
#
# Examples
#
#   Node.new(10, "HELLO", nil, nil)
#   # => #<Node:0x007ffeab2187a0 @key=10, @satellite_data="HELLO", @prev=nil, @next=nil>
class Node
  attr_accessor :key, :satellite_data, :prev, :next
  # C/C++ too have this initialization technique but is less used in textbooks AFAIK
  def initialize(key, satellite_data, prev_pointer, next_pointer)
    @key, @satellite_data, @prev, @next = key, satellite_data, prev_pointer, next_pointer
  end
end

# TODO
# def universal_hashing
# end

# TODO
# def perfect_hashing
# end

# TODO: Document these test in a better way
def test_direct_addressing_chaining_insert_and_delete
  k = 5.times.map { |x| nil }
  key = gets.chomp.to_i
  satellite_data = gets.chomp
  while key != -9999
    node = Node.new(key, satellite_data, nil, nil)
    chained_hash_insert(k, node)
    key = gets.chomp.to_i
    satellite_data = gets.chomp
  end

  k.each_with_index do |x, i|
    p "PRINTING #{i} bucket STARTED"
    while !x.nil?
      p "KEY IS #{x.key} SATELLITE DATA IS #{x.satellite_data}"
      x = x.next
    end
    p "PRINTING #{i} bucket ENDED"
  end

  p = gets.chomp.to_i
  head_node = k[p]
  deletable_node = head_node

  chained_hash_delete(k, deletable_node)

  k.each_with_index do |x, i|
    p "PRINTING #{i} bucket STARTED"
    while !x.nil?
      p "KEY IS #{x.key} SATELLITE DATA IS #{x.satellite_data}"
      x = x.next
    end
    p "PRINTING #{i} bucket ENDED"
  end
end
#
# def test_open_addressing_insert
#   t = 13.times.map { |x| nil }
#   p "BEFORE OPEN ADDRESS INSERT #{t}"
#   hashable = [79, 69, 72, 98, 14, 50]
#   hashable.each do |x|
#     open_addressing_insert(t, x)
#   end
#   p "AFTER OPEN ADDRESS INSERT #{t}"
#   number = gets.chomp.to_i
#   while number != -9999
#     p open_addressing_search(t, number)
#     number = gets.chomp.to_i
#   end
# end

# OTHER WAYS TO DECLARE THE NODE CLASS
# NOTE: Declaring this way would require the client to assign the properties one by one
# Examples:
#     node = Node.new
#     node.key = 10
#     node.satellite_data = "HELLO"
#     node.prev = nil
#     node.next = nil
#
# class Node
#   attr_accessor :key, :satellite_data, :prev, :next
# end

# NOTE: Similar to JAVA declaration of Class with getters and setters
# class Node
#   ----GETTER----
#   def key
#     @key
#   end
#   ----GETTER----
#
#   ----SETTER----
#   def key=(key)
#     @key = key
#   end
#   ----SETTER----
#
#   satellite_data getter and setter in a similar way
#
#   prev getter and setter in a similar way
#
#   def next
#     @next
#   end
#
#   def next=(next_pointer)
#     @next = next_pointer
#   end
# end
