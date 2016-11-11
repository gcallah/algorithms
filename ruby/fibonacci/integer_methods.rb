# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE

# NOTE: This kind of dynamic method addition to in-built classes is called
#       MONKEY PATCHING(that's right) and its beautiful when done carefully
#       This implementation does not factor in that safety.
# REFERENCE THIS FOR TIPS
# http://www.justinweiss.com/articles/3-ways-to-monkey-patch-without-making-a-mess/
# HAPPY MONKEY PATCHING!

# Public: Extended Integer class methods for easy execution of fibonacci
#         Methods are invoked on an integer
#
# Examples
#   40.cool_iterative_fib
#   # => 102334155
class Integer

  # Internal: Calculates the nth fibonacci of a number iteratively
  #           Iterative summation strategy
  # Uses Ruby's infamous INJECT method. Please checkout how it works. It's awsome
  #
  # Return: Number
  #
  # Examples
  #   40.cool_fib
  #   => 102334155
  def cool_fib
    (0..self).inject([1,0]) {|i_arr| [i_arr.last, i_arr.first + i_arr.last]}.first
  end

  # Internal: Calculates the nth fibonacci of a number exhaustively and redundantly
  #           Recursive strategy
  #
  # Return: Number
  #
  # Examples
  #   40.naive_fib
  #   => 102334155
  def naive_fib
    return -1 if self < 0
    return 0 if self == 0
    return 1 if self == 1
    (self-1).naive_fib + (self-2).naive_fib
  end

  # Internal: Calculates the nth fibonacci of a number using an auxiliary lookup structure
  #           Recursive memoized strategy
  #
  # ARGS:
  # hash   - Auxiliary storage (optional)
  #
  # Return: Number
  #
  # Examples
  #   40.memo_fib
  #   => 102334155
  def memo_fib(hash={})
    return -1 if self < 0
    return 0 if self == 0
    return 1 if self == 1

    prev_fib = hash[self-1] || (hash[self-1] = (self-1).memo_fib(hash))
    prev_prev_fib = hash[self-2] || (hash[self-2] = (self-2).memo_fib(hash))

    prev_fib + prev_prev_fib
  end

  # Internal: Calculates the nth fibonacci of a number iteratively
  #           Iterative summation strategy
  #
  # Return: Number
  #
  # Examples
  #   40.iter_fib
  #   => 102334155
  def iter_fib
    v1 = 0
    v2 = 1
    (self-1).times.each do
      temp = v2
      v2 = v2 + v1
      v1 = temp
    end
    v2
  end
end #CLASS ENDS, SO DOES MONKEY PATCHING

def unit_test_fibonacci_integer_methods
  test('Cool fib', cool_fib_test)
  test('Naive fib', naive_fib_test)
  test('Memo fib', memo_fib_test)
  test('Iter fib', iter_fib_test)
end

def test(method_name, method_test)
  if method_test
    p "#{method_name} OK"
  else
    p "#{method_name} FAIL"
  end
end

def cool_fib_test
  10.cool_fib == 55
end

def naive_fib_test
  20.naive_fib == 6765
end

def memo_fib_test
  30.memo_fib == 832040
end

def iter_fib_test
  40.iter_fib == 102334155
end

unit_test_fibonacci_integer_methods
