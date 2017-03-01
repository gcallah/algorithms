module HashTables
  # INDEX
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


  class << self
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
  end
end
