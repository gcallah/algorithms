# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE

# Internal: Calculates the nth fibonacci of a number iteratively
#           Iterative summation strategy
# Uses Ruby's infamous INJECT method. Please checkout how it works. It's awsome
#
# ARGS:
# number - Number of the Fibonacci to be found
#
# Return: Number
#
# Examples
#   cool_iterative_fib(40)
#   => 102334155
def cool_fib(number)
  (0..number).inject([1,0]) {|i_arr| [i_arr.last, i_arr.first + i_arr.last]}.first
end

# Internal: Calculates the nth fibonacci of a number exhaustively and redundantly
#           Recursive strategy
#
# ARGS:
# number - Number of Fibonacci to be found
#
# Return: Number
#
# Examples
#   naive_fib(40)
#   => 102334155
def naive_fib(number)
  return -1 if number < 0
  return 0 if number == 0# && (@operations += 1)
  return 1 if number == 1# && (@operations += 1)
  naive_fib(number-1) + naive_fib(number-2)
end

# Internal: Calculates the nth fibonacci of a number using an auxiliary lookup structure
#           Recursive memoized strategy
#
# ARGS:
# number - Number of Fibonacci to be found
# hash   - Auxiliary storage (optional)
#
# Return: Number
#
# Examples
#   memo_fib(40, {})
#   => 102334155
def memo_fib(number, hash = {})
  return -1 if number < 0
  return 0 if number == 0
  return 1 if number == 1

  prev_fib = hash[number-1] || (hash[number-1] = memo_fib(number-1, hash))
  prev_prev_fib = hash[number-2] || (hash[number-2] = memo_fib(number-2, hash))

  prev_fib + prev_prev_fib
end

# Internal: Calculates the nth fibonacci of a number iteratively
#           Iterative summation strategy
#
# ARGS
# number - Number of Fibonacci to be found
#
# Return: Number
#
# Examples
#   iter_fib(40)
#   => 102334155
def iter_fib(number)
  v1 = 0
  v2 = 1
  (number-1).times.each do
    temp = v2
    v2 = v2 + v1
    v1 = temp
  end
  v2
end

def unit_test_fibonacci_methods
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
  cool_fib(10) == 55
end

def naive_fib_test
  naive_fib(20) == 6765
end

def memo_fib_test
  memo_fib(30) == 832040
end

def iter_fib_test
  iter_fib(40) == 102334155
end

unit_test_fibonacci_methods
