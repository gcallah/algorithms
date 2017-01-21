module MonkeyPatch
  # Public: In-Built Integer class override
  #         Extended Integer class methods to get the feel of how much a pseudo code
  #         can be related to interpreted code
  #         Methods are invoked on an integer
  #
  # Examples
  #
  #   10.parent
  #   => 5
  #   10.left
  #   => 20
  #   10.right
  #   => 21
  refine Integer do
    def parent
      ( self / 2 ).floor
    end

    def left
      ( 2 * self )
    end

    def right
      ( 2 * self ) + 1
    end

    def half
      ( self / 2 ).floor
    end
  end

  # Public: In-Built Array class override
  #         Extended array class to add a method heap_size to be as close to the
  #         textbook as possible
  #
  # Examples
  #
  #   [1, 2, 3, 4].heap_size
  #   => nil
  #   [1, 2, 3, 4].heap_size = 10
  #   [1, 2, 3, 4].heap_size
  #   => 10
  refine Array do
    attr_accessor :heap_size
  end
end
