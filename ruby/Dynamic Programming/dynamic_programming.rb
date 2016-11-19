class DynamicProgramming

end


# Internal: Method to calculate the maximum and optimal solution for cutting a
#           rod of a particular length
#           Recursive Strategy
#
# p - Price list to cut a rod of certain length
# n - Length of rod to be cut
#
# Examples
#   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
#   cut_rod(p, 9)
#   => 31
def cut_rod(p, n)
  return 0 if n == 0
  q = -Float::INFINITY
  (0..n-1).each { |i| q = [q, p[i] + cut_rod(p, n-i-1)].max }
  return q
end

# Internal: Method to calculate the maximum and optimal solution for cutting a
#           rod of a particular length
#           Recursive Memoization Technique
#
# p - Price list to cut a rod of certain length
# n - Length of rod to be cut
#
# Examples
#   p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
#   memoized_cut_rod(p, 9)
#   => 31
def memoized_cut_rod(p, n)
  r = n.times.map { |x| -Float::INFINITY }
  memoized_cut_rod_aux(p, n, r)
end


def memoized_cut_rod_aux(p, n, r)
  return r[n-1] if r[n-1] >= 0
  if n == 0
    q = 0
  else
    q = -Float::INFINITY
    (0..n-1).each { |i| q = [q, p[i] + memoized_cut_rod_aux(p, n-i-1, r)].max }
  end
  r[n-1] = q
  q
end

def sleek_memoized_cut_rod_aux(p, n, r={})
  return 0 if n == 0
  q = -Float::INFINITY
  (0..n-1).each do |i|
    prevRodCut = r[n-i-1] || (r[n-i-1] = sleek_memoized_cut_rod_aux(p, n-i-1, r))
    q = [q, p[i] + prevRodCut].max
  end
  q
end

def bottom_up_cut_rod(p, n)
  r = n.times.map { |x| 0 }
  (1..n).each do |j|
    q = -Float::INFINITY
    (0..j-1).each { |i| q = [q, p[i] + r[j-i-1]].max }
    r[j] = q
  end
  r[n]
end

def extended_bottom_up_cut_rod(p, n)
  s = []
  s[0] = 0
  r = n.times.map{ |x| 0 }
  (1..n).each do |j|
    q = -Float::INFINITY
    (0..j-1).each do |i|
      if (q < p[i] + r[j-i-1])
        q = p[i] + r[j-i-1]
        s[j] = i+1
      end
      r[j] = q
    end
  end
  [r, s]
end

def print_cut_rod_solution(p, n)
  r, s = extended_bottom_up_cut_rod(p, n)
  while n > 0
    p s[n]
    n = n - s[n]
  end
end

def matrix_chain_order(p)
  n = p.length - 1
  m = n.times.map { |x| [] }
  s = n.times.map { |x| [] }
  n.times.each do |i|
    m[i][i] = 0
  end
  (2..n).each do |l|
    (0..n-l).each do |i|
      j = i + l - 1
      m[i][j] = Float::INFINITY
      (i..j-1).each do |k|
        q = m[i][k] + m[k+1][j] + (p[i] * p[k+1] * p[j+1])
        if q < m[i][j]
          m[i][j] = q
          s[i][j] = k
        end
      end
    end
  end
  [m, s]
end

def print_optimal_parens(s, i, j)
  if i == j
    print "#{i+1}"
  else
    print "("
    print_optimal_parens(s, i, s[i][j])
    print_optimal_parens(s, s[i][j]+1, j)
    print ")"
  end
end

# p = [30, 35, 15, 5, 10, 20, 25]
# p matrix_chain_order(p)[0][1][4]
# print_optimal_parens(matrix_chain_order(p)[1], 0, 5)


# p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
# p cut_rod(p, 9)
# p memoized_cut_rod(p, 9)
# p sleek_memoized_cut_rod_aux(p, 9)
# p bottom_up_cut_rod(p, 9)
# p extended_bottom_up_cut_rod(p, 10)
