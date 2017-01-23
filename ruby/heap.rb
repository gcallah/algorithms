# THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR PROFESSOR CALLAHAN'S PYTHON CODE

# TODO: MIN HEAP METHODS TO BE ADDED

# NOTE: This kind of dynamic method addition to in-built classes is called
#       MONKEY PATCHING(that's right) and its beautiful when done carefully
#       This implementation does not factor in that safety.
#
#       Many suggest against monkey patching because it could turn into a
#       nightmare in production due to the lack of concrete standard documentation
#
# REFERENCE THIS FOR TIPS
# http://www.justinweiss.com/articles/3-ways-to-monkey-patch-without-making-a-mess/
# HAPPY MONKEY PATCHING!

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
class Integer
  def parent
    ( self / 2 ).floor
  end

  def left
    ( 2 * self ) + 1
  end

  def right
    ( 2 * self ) + 2
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
class Array
  attr_accessor :heap_size
end

# Public: Ensures the max-heap property is being maintained from the index provided
#         Recursive, Max-Heap property A[parent] >= A[left] as well as A[right]
#
# ARGS:
# arr - Input array
# i   - Index at which the Max-Heap property is to be applied
#
# RETURN: nil
#
# COMPLEXITY: Θ(lgn)
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    max_heapify(arr, 5)
#
# Modifies the provided array.
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

# Public: Ensures the min-heap property is being maintained from the index provided
#         Recursive, Min-Heap property A[parent] <= A[left] as well as A[right]
#
# ARGS:
# arr - Input array
# i   - Index at which the Min-Heap property is to be applied
#
# RETURN: nil
#
# COMPLEXITY: Θ(lgn)
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    min_heapify(arr, 5)
#
# Modifies the provided array.
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

# Public: Re-order the input array to adhere to the Max-Heap property at all indices
#
# ARGS:
# arr - Input array
#
# RETURN: nil
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    build_max_heap(arr)
#
# Modifies the provided array.
def build_max_heap(arr)
  arr.heap_size = arr.length
  (0..arr.length.half).reverse_each do |i|
    max_heapify(arr, i)
  end
end

# Public: Sorts the array by adhering to the Max-Heap property and simulataneously
#         decreasing the heap size
#
# ARGS:
# arr - Input array
#
# RETURN: Array
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    heap_sort(arr)
#    => [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# Modifies the provided array.
def heap_sort(arr)
  build_max_heap(arr)
  (1..(arr.length-1)).reverse_each do |i|
    arr[0], arr[i] = arr[i], arr[0]
    arr.heap_size -= 1
    max_heapify(arr, 0)
  end
  arr
end

# Public: Returns the maximium element in the heap, which is the element at
#         index 0 after building the heap structure
#
# ARGS:
# arr - Input array
#
# Return: Integer
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    build_max_heap(arr)
#    heap_maximum(arr)
#    => 9
def heap_maximum(arr)
  arr[0]
end

# Public: Returns the maximium element in the heap, which is the element at
#         index 0 after building the heap structure
#
# ARGS:
# arr - Input array
#
# Return: Integer
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    build_max_heap(arr)
#    heap_extract_max(arr)
#    => 9
def heap_extract_max(arr)
  arr.heap_size ||= arr.length
  raise 'heap underflow' if arr.heap_size < 1
  max = arr[0]
  arr[0] = arr[a.heap_size]
  arr.heap_size -= 1
  max_heapify(arr, 1)
  max
end

# Public: Increases the element at the specified position to the value provided
#         and makes sure the max-heap property holds
#
# ARGS:
# arr - Input array
# i   - Index at which the element has to be increased
# key - New value of the index location
#
# Return: nil
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    heap_increase_key(arr, 3, 10)
#    arr = [10, 5, 8, 3, 9, 6, 2, 4, 1]
#
# Modifies the input array
def heap_increase_key(arr, i, key)
  raise 'new key is smaller than current key' if key < arr[i]
  arr[i] = key
  while i > 0 && arr[i.parent] < arr[i]
    arr[i], arr[i.parent] = arr[i.parent], arr[i]
    i = i.parent
  end
end

# Public: Inserts an element into the array by maintaining the heap property
#
# ARGS:
# arr - Input array
# key - value to be inserted into the array
#
# Return: nil
#
# Examples
#    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
#    max_heap_insert(arr, 10)
#    arr = [10, 5, 3, 7, 8, 6, 2, 4, 1, 9]
#
# Modifies the input array
def max_heap_insert(arr, key)
  arr.heap_size ||= arr.length
  arr.heap_size += 1
  arr[arr.heap_size-1] = -Float::INFINITY
  heap_increase_key(arr, arr.heap_size-1, key)
end

def unit_test_heap
  test('Heap Sort', heap_sort_test)
  test('Build Max Heap', build_max_heap_test)
  test('Heap Increase Key', heap_increase_key_test)
  test('Max Heap Insert', max_heap_insert_test)
  test('Heap Maximum', heap_maximum_test)
end

def test(method_name, method_test)
  if method_test
    p "#{method_name} OK"
  else
    p "#{method_name} FAIL"
  end
end

def heap_sort_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  heap_sort(arr)
  arr == arr.sort
end

def build_max_heap_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  build_max_heap(arr)
  arr == [9, 8, 6, 7, 3, 5, 2, 4, 1]
end

def heap_increase_key_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  build_max_heap(arr)
  heap_increase_key(arr, 3, 10)
  arr.find_index(7).nil? && arr.find_index(10) == 0
end

def max_heap_insert_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  build_max_heap(arr)
  max_heap_insert(arr, 10)
  arr.find_index(10) == 0
end

def heap_maximum_test
  arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  build_max_heap(arr)
  heap_maximum(arr) == 9
end

unit_test_heap
