module MedianAndOrderStatistics
  class << self
    def minimum(a)
      min = a[0]
      (1..a.length-1).each do |i|
        if a[i] < min
          min = a[i]
        end
      end
      min
    end

    def maximum(a)
      max = a[0]
      (1..a.length-1).each do |i|
        if a[i] > max
          max = a[i]
        end
      end
      max
    end

  end
end
