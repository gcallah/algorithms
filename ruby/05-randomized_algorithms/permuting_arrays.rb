module RandomizedAlgorithms
  class << self
    def permute_by_sorting(arr)
      n = arr.length
      p = {}
      (0..n-1).each do |i|
        p[i] = rand(1..(n**3))
      end
      p.sort_by { |k, v| v }.map { |k, v| arr[k] }
    end

    def randomize_in_place(arr)
      n = arr.length
      (0..n-1).each do |i|
        random_index = rand(i..n-1)
        arr[i], arr[random_index] = arr[random_index], arr[i]
      end
      arr
    end

    def permute_without_identity(arr)
      n = arr.length
      (0..n-2).each do |i|
        random_index = rand((i+1)..(n-1))
        arr[i], arr[random_index] = arr[random_index] = arr[i]
      end
      arr
    end

    def permute_with_all(arr)
      n = arr.length
      (0..n-1).each do |i|
        random_index = rand(1..n-1)
        arr[i], arr[random_index] = arr[random_index], arr[i]
      end
    end
  end
end
