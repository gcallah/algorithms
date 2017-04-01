class Node
  attr_accessor :key, :satellite_data, :p, :left, :right
  def initialize(key, satellite_data, p, left, right)
    @key, @color, @p, @left, @right = key, satellite_data, p, left, right
  end

  #   Node.new(10, nil, nil, nil)
  #   # => #<Node:0x007ffeab2187a0 @key=10, @p=nil, @left=nil, @right=nil>
  def initialize(key, color, p, left, right)
    @key, @color, @p, @left, @right = key, color, p, left, right
  end
end
