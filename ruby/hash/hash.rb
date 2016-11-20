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

# Public: Get an element from provided index location
#
# t - Direct address table (Array)
# k - Key (array index)
# COMPLEXITY: O(1) BIG-O
#
# Examples
#   t = [1, 2, 3, 4, 5, 6, 7]
#   direct_addressing_search(t, 3)
#   => 4
def direct_addressing_search(t, k)
  t[k]
end

# Public: Inserts an element at the provided index location
#
# t - Direct address table (Array)
# x - Pointer to the structure/object to be INSERTED
# COMPLEXITY: O(1) BIG-O
#
# Examples
#   t = [nil, nil, nil]
#   x = Node.new(2, "HELLO", nil, nil)
#   direct_addressing_insert(t, x)
#   => #<Node:0x007ffeac99e0c8 @key=2, @satellite_data="HELLO", @prev=nil, @next=nil>
#   NOTE: t is changed to [nil, nil, #<Node:0x007ffeac99e0c8 @key=2, @satellite_data="HELLO", @prev=nil, @next=nil>]
def direct_addressing_insert(t, x)
  t[x.key] = x
end

# Public: Remove the element from the direct address table
#
# t - Direct address table (Array)
# x - Pointer to the structure/object to be DELETED
# COMPLEXITY: O(1) BIG-O
#
# Examples
#   t = [nil, nil, x]
#   direct_addressing_delete(t, x)
#   => nil
#   NOTE: t is changed to [nil, nil, nil]
def direct_addressing_delete(t, x)
  t[x.key] = nil
end

# Public: Return the remainder of a value when divided by another value
#
# k - Dividend
# m - Divisor
#
# Examples
#
#   h(10, 13)
#   => 10
def h(k, m=5)
  k % m
end

# Public: Inserts the structure at the index value obtained from the hash function
#         Achieves chaining using linked list strategy
#         Inserts element at the start of the list
#
# t - Direct address table (Array)
# x - Pointer to the structure/object to be INSERTED
# COMPLEXITY: O(1) BIG-O
#
# Examples
#
#   t = [nil, nil, nil]
#   x = Node.new(2, "HELLO", nil, nil)
#   chained_hash_insert(t, x)
#   => nil
def chained_hash_insert(t, x)
  index = h(x.key)
  head = t[index]
  if head
    t[index] = x
    x.next = head
    head.prev = x
  else
    t[index] = x
    x.next = nil
    x.prev = nil
  end
end

# Public: Searches the Direct addressing structure for the presence of an entry
#         whose key property == k
#
# t - Direct address table (Array)
# k - Key
# COMPLEXITY: Θ(1+α) BIG-THETA; α = n/m; n=total number of elements; m=table size
#
# Examples
#
#   t = [nil, nil, nil]
#   x = Node.new(2, "HELLO", nil, nil)
#   t[1] = x
#   chained_hash_search(t, 2)
#   => true
def chained_hash_search(t, k)
  head = t[h(k)]
  while !head.nil?
    return true if head.key == k
    head = head.next
  end
  false
end

# Public: Deletes the provided node from the chained list
#
# t - Direct address table (Array)
# x - Pointer to the structure/object to be DELETED
# COMPLEXITY: O(1) BIG-O
# NOTE: O(1) is achieved because a DOUBLE LINKED LIST is used
#
# Examples
#
#   t = [nil, nil, #<Node:0x007ffeac99e0c8 @key=2, @satellite_data="HELLO", @prev=nil, @next=nil>]
#   x = t[2]
#   chained_hash_delete(t, x)
#   => nil
#   NOTE: t is changed to [nil, nil, nil]
def chained_hash_delete(t, x)
  index = h(x.key)
  if t[index] != x
    x.prev.next = x.next
    x.next.prev = x.prev unless x.next.nil?
  else
    t[index] = x.next
    x.next.prev = nil if x.next
  end
  x = nil
end

# Public: Returns the remainder of a value when divided by another value
# NOTE: m should not be a power of 2. REFERENCE: CLRS Page-263 11.3.1
#       A prime not too close to an exact power of 2 is often a good choice for m.
#
# k - Key
# m - Table size
#
# Examples
#
#   division_h(10, 13)
#   => 10
def division_h(k, m)
  k % m
end

# Public: Returns the remainder of a value when multiplied by key and a constant
#         h(k) = |_ m(kA mod 1) _| REFERENCE: Page-264 11.3.2
# NOTE: Optimal choice for A is the Knuth value which is (√5-1)/2
#       Remember, when the example provided in the book on Page-264 bottom is being
#       validated, the values do not match upto 99% of the time because all new systems
#       are equipped with a 64-bit processor and the example assumes a 32-bit one
#
# k - Key
# m - Table size
#
# Examples
#
#   multilpication_h(123456, 2**14)
#   => 9417 (NOT 67)
def multilpication_h(k, m)
  knuth_a = ( Math.sqrt(5) - 1 ) / 2
  ( m * ( ( k * knuth_a ) % 1 ) ).floor
end

# Public: Offsets the value of hash by a linear value
#
# k - Key
# i - Linear offset
# m - Table size
#
# Examples
#
#   linear_probing(14, 2, 11)
#   => 5
def linear_probing(k, i, m)
  ( h(k, m) + i ) % m
end

# Public: Offsets the value of hash by a quadratic computation using two constants
#
# k - Key
# i - Quadratic offset
# m - Table size
#
# Examples
#
#   quadratic_probing(14, 2, 11)
#   => 2 (13%11)
@c1 = 1
@c2 = 2
def quadratic_probing(k, i, m)
  ( h(k, m) + @c1*i + @c2*(i**2) ) % m
end

# Public: Suggested hash functions for Double Hashing
#
# k - Dividend
# m - Divisor
#
# Examples
#
#   h1(14, 11)
#   => 3
#   h2(14, 10)
#   => 5
def h1(k, m)
  k % m
end

def h2(k, m)
  1 + ( k % m )
end

# Public: Returns value calculated from linear combination of two hash functions
#
# k - Key
# i - linear offset
# m1 - Table size, Primary hash Divisor
# m2 - Secondary hash Divisor
#
# Examples
#
#   double_hasing(14, 2, 11)
#   => 0
def double_hasing(k, i, m1, m2=(m1-1))
  ( h1(k, m1) + ( i * h2(k, m2) ) ) % m1
end

# Public: Inserts a value at a location in table by probing using DOUBLE HASHING
#         until a free node is found
#
# t - Open address table
# k - Key to be INSERTED
# m - Table size
#
# Examples
#   t = [nil, 79, nil, nil, 69, 98, nil, 72, nil, nil, nil, 50, nil]
#   open_addressing_insert(t, 14, 13, 11)
#   => nil
#   NOTE: t is changed to [nil, 79, nil, nil, 69, 98, nil, 72, nil, 14, nil, 50, nil]
#         14 inserted at 9 th index after probing 1 and 5 indices
def open_addressing_insert(t, k, m1=t.size, m2)
  i=0
  while i != m
    j = double_hasing(k, i, m1, m2)
    if t[j].nil?
      t[j] = k
      return j
    end
    i += 1
  end
end

# Public: Returns table index of a key if it exists in the table
#
# t - Open address table
# k - Key to be SEARCHED
# m - Table size
#
# Examples
#   t = [nil, 79, nil, nil, 69, 98, nil, 72, nil, nil, nil, 50, nil]
#   open_addressing_search(t, 14)
#   => 9
#   open_addressing_search(t, 100)
#   => nil
def open_addressing_search(t, k, m=t.size)
  i=0
  while true
    j = double_hasing(k, i, m, 11)
    if t[j] == k
      return j
    end
    i += 1
    break if (t[j].nil? || i == m)
  end
  nil
end


# TODO
# def open_addressing_delete
# end

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
