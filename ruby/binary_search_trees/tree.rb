# Public: Analogous to a struct in C/C++ for building linked lists.
# This class only contains an initialize method which acts a constructor for
# setting and accessing the object properties
#
# There are multiple ways this can be defined, this is my personal favorite
# Other ways are listed at the bottom of the file
# Choose whatever is convenient for YOU.
#
# Examples
#   Tree.new(nil)
#   # => #<Tree:0x007ffeab2187a0 @root=nil>
class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end
end
