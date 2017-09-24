module DivideAndConquer
  class << self
    @moves = 0
    # TODO: Modify the code to output a result for incorporating unit tests
    def move_tower(n, source, destination, temporary)
      if n > 0
        move_tower(n-1, source, temporary, destination)
        p "FROM #{source} to #{destination}"
        @moves += 1
        move_tower(n-1, temporary, destination, source)
      end
    end
  end
end

# Examples:
# move_tower(1, 'A', 'B', 'C')                              move_tower(6, 'A', 'B', 'C')
# p "Number of moves - #{@moves}"                           # Number of moves - 63
# # OUTPUT:
# # FROM A to B
# # Number of moves - 1
#
# move_tower(2, 'A', 'B', 'C')                              move_tower(7, 'A', 'B', 'C')
# p "Number of moves - #{@moves}"                           # Number of moves - 127
# # OUTPUT:
# # FROM A to C
# # FROM A to B
# # FROM C to B
# # Number of moves - 3
#
# move_tower(3, 'A', 'B', 'C')
# p "Number of moves - #{@moves}"
# # OUTPUT:
# # FROM A to B
# # FROM A to C
# # FROM B to C
# # FROM A to B
# # FROM C to A
# # FROM C to B
# # FROM A to B
# # Number of moves - 7
#
# move_tower(4, 'A', 'B', 'C')
# p "Number of moves - #{@moves}"
# # OUTPUT:
# # FROM A to C
# # FROM A to B
# # FROM C to B
# # FROM A to C
# # FROM B to A
# # FROM B to C
# # FROM A to C
# # FROM A to B
# # FROM C to B
# # FROM C to A
# # FROM B to A
# # FROM C to B
# # FROM A to C
# # FROM A to B
# # FROM C to B
# # Number of moves - 15
#
# move_tower(5, 'A', 'B', 'C')
# p "Number of moves - #{@moves}"
# # FROM A to B
# # FROM A to C
# # FROM B to C
# # FROM A to B
# # FROM C to A
# # FROM C to B
# # FROM A to B
# # FROM A to C
# # FROM B to C
# # FROM B to A
# # FROM C to A
# # FROM B to C
# # FROM A to B
# # FROM A to C
# # FROM B to C
# # FROM A to B
# # FROM C to A
# # FROM C to B
# # FROM A to B
# # FROM C to A
# # FROM B to C
# # FROM B to A
# # FROM C to A
# # FROM C to B
# # FROM A to B
# # FROM A to C
# # FROM B to C
# # FROM A to B
# # FROM C to A
# # FROM C to B
# # FROM A to B
# # Number of moves - 31
