module Hashing
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
end
