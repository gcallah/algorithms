module HashTables
  class << self
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
  end
end
