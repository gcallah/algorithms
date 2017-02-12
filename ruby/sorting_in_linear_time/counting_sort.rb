module SortingInLinearTime
  class << self
    def counting_sort(a, b, k)
      c = Array.new(k+1)
      (0..k).each do |i|
        c[i] = 0
      end

      (0..a.length-1).each do |j|
        c[a[j]] = c[a[j]] + 1
      end
      # C[i] now contains the number of elements equal to i
      (0..k-1).each do |i|
        c[i] = c[i] + c[i-1]
      end
      # C[i] now contains the number of elements less than of equal to i
      (0..a.length-1).reverse_each do |j|
        b[c[a[j]]] = a[j]
        c[a[j]] = c[a[j]] - 1
      end
    end
  end
end
