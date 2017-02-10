# Public: Analogous to a struct in C/C++ for building linked lists.
# This class only contains an initialize method which acts a constructor for
# setting and accessing the object properties
#
# NOTE: Two constructors, one with satellite data and another without. The later
#       one will be used predominantly
#
# Examples
#   Node.new(10, "HELLO", nil, nil, nil)
#   # => #<Node:0x007ffeab2187a0 @key=10, @satellite_data="HELLO", @p=nil, @left=nil, @right=nil>
class Node
  attr_accessor :key, :satellite_data, :p, :left, :right
  def initialize(key, satellite_data, p, left, right)
    @key, @satellite_data, @p, @left, @right = key, satellite_data, p, left, right
  end

  #   Node.new(10, nil, nil, nil)
  #   # => #<Node:0x007ffeab2187a0 @key=10, @p=nil, @left=nil, @right=nil>
  def initialize(key, p, left, right)
    @key, @p, @left, @right = key, p, left, right
  end
end
