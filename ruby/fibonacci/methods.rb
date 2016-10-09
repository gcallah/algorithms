# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE

# Internal: Calculates the nth fibonacci of a number iteratively
#           Iterative summation strategy
# Uses Ruby's infamous INJECT method. Please checkout how it works. It's awsome
#
# Examples
#
#   cool_iterative_fib(40)
#   => 102334155
#
# Returns a number.
def cool_fib(number)
  (0..number).inject([1,0]) {|i_arr| [i_arr.last, i_arr.first + i_arr.last]}.first
end

# Internal: Calculates the nth fibonacci of a number exhaustively and redundantly
#           Recursive strategy
#
# number - Number of Fibonacci to be found
#
# Examples
#
#   naive_fib(40)
#   => 102334155
#
# Returns a number.
def naive_fib(number)
  return -1 if number < 0
  return 0 if number == 0# && (@operations += 1)
  return 1 if number == 1# && (@operations += 1)
  naive_fib(number-1) + naive_fib(number-2)
end

# Internal: Calculates the nth fibonacci of a number using an auxiliary lookup structure
#           Recursive memoized strategy
#
# number - Number of Fibonacci to be found
#
# Examples
#
#   memo_fib(40, {})
#   => 102334155
#
# Returns a number.
def memo_fib(number, hash)
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
# number - Number of Fibonacci to be found
#
# Examples
#
#   iter_fib(40)
#   => 102334155
#
# Returns a number.
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
