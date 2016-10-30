class Integer
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

class Array
  attr_accessor :heap_size
end

# Θ(lgn)
def max_heapify(arr, i)
  arr.heap_size ||= arr.length

  l = i.left
  r = i.right

  largest = (l <= arr.heap_size-1 && arr[l] > arr[i]) ? l : i
  largest = r if (r <= arr.heap_size-1 && arr[r] > arr[largest])
  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    max_heapify(arr, largest)
  end
end

def min_heapify(arr, i)
  arr.heap_size ||= arr.length

  l = i.left
  r = i.right

  smallest = (l <= arr.heap_size-1 && arr[l] < arr[i]) ? l : i
  smallest = r if (l <= arr.heap_size-1 && arr[l] < arr[smallest])
  if smallest != i
    arr[i], arr[smallest] = arr[smallest], arr[i]
    min_heapify(arr, smallest)
  end
end

def build_max_heap(arr)
  arr.heap_size = arr.length
  (0..arr.length.half).reverse_each do |i|
    max_heapify(arr, i)
  end
end

def heap_sort(arr)
  build_max_heap(arr)
  (1..(arr.length-1)).reverse_each do |i|
    arr[0], arr[i] = arr[i], arr[0]
    arr.heap_size -= 1
    max_heapify(arr, 0)
  end
  arr
end

def heap_maximum(arr)
  arr[0]
end

def heap_extract_max(arr)
  arr.heap_size ||= arr.length
  raise 'heap underflow' if arr.heap_size < 1
  max = arr[0]
  arr[0] = arr[a.heap_size]
  arr.heap_size -= 1
  max_heapify(arr, 1)
  return max
end

def heap_increase_key(arr, i, key)
  raise 'new key is smaller than current key' if key < arr[i]
  arr[i] = key
  while i > 0 && arr[i.parent] < arr[i]
    arr[i], arr[i.parent] = arr[i.parent], arr[i]
    i = i.parent
  end
end

def max_heap_insert(arr, key)
  arr.heap_size ||= arr.length
  arr.heap_size += 1
  arr[arr.heap_size-1] = -Float::INFINITY
  heap_increase_key(arr, arr.heap_size-1, key)
end

def heap_test
  p "HEAP SORT with input [5, 3, 8, 7, 9, 6, 2, 4, 1] #{heap_sort_test}"
  max_heap_insert_test
end

def heap_sort_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  heap_sort(arr)
  arr == arr.sort
end

def heap_increase_key_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  heap_increase_key(arr, 3, 10)
  arr.find_index(7).nil? && arr.find_index(10) == 0
end

def max_heap_insert_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  max_heap_insert(arr, 10)
  arr.find_index(10) == 0
end

heap_test
