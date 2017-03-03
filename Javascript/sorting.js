// THESE METHODS RESEMBLE TEXTBOOK PSEUDO CODE OR RUBY CODE
/**
 * Returns an array with elements populated between the specified range(INCLUSIVE)
 *
 * @extends Array
 * @function rangeArray
 * @param {number} startIndex - Start element of the array to be built
 * @param {number} endIndex - End element of the array to be built
 * @return {array}
 *
 * Examples:
 *    (new Array()).rangeArray(0, 5);
 *    ([]).rangeArray(0, 5);
 *    => [0, 1, 2, 3, 4, 5]
 */
Array.prototype.rangeArray = function (startIndex, endIndex) {
  var arr = []
  for(var i=startIndex; i<=endIndex; i++) {
    arr.push(i);
  }
  return arr;
}

/**
 * Returns an array with elements populated between the specified range(INCLUSIVE)
 * in a REVERSE Order
 *
 * @extends Array
 * @function reverseRangeArray
 * @param {number} startIndex - Start element of the array to be built
 * @param {number} endIndex - End element of the array to be built
 * @return {array}
 *
 * Examples:
 *    (new Array()).reverseRangeArray(0, 5);
 *    ([]).reverseRangeArray(0, 5);
 *    => [5, 4, 3, 2, 1, 0]
 */
Array.prototype.reverseRangeArray = function(startIndex, endIndex) {
  var arr = []
  for(var i=endIndex; i>=startIndex; i--) {
    arr.push(i);
  }
  return arr;
}

/**
 * Swaps the elements of the array at the specified indices
 *
 * @function coolSwap
 * @param {array} arr - Array in which the swapping is to be performed
 * @param {number} v1 - Index of the element to be swapped with v2
 * @param {number} v2 - Index of the element to be swapped with v1
 * @return undefined
 *
 * Examples:
 *   coolSwap([5, 3, 8, 7, 9, 6, 2, 4, 1], 2, 5)
 *   => [5, 3, 6, 7, 9, 8, 2, 4, 1]
 */
function coolSwap(arr, v1, v2) {
  [arr[v1], arr[v2]] = [arr[v2], arr[v1]];
}

/**
 * Swaps the elements of the array at the specified indices
 * @function swap
 * @param {array} arr - Array in which the swapping is to be performed
 * @param {number} v1 - Index of the element to be swapped with v2
 * @param {number} v2 - Index of the element to be swapped with v1
 * @return undefined
 *
 * Examples:
 *   coolSwap([5, 3, 8, 7, 9, 6, 2, 4, 1], 2, 5)
 *   => [5, 3, 6, 7, 9, 8, 2, 4, 1]
 */
function swap(arr, v1, v2) {
  var temp = arr[v1];
  arr[v1] = arr[v2];
  arr[v2] = temp;
}

/**
 * Sorts the elements of the array using BUBBLE sort algorithm
 * Divide and Conquer strategy
 *
 * @function bubbleSort
 * @param {array} arr - Array to be bubble sorted
 * @param {number} n - Index of the last element in the array
 * @return {array}
 *
 * Examples:
 *   bubbleSort([5, 3, 8, 7, 9, 6, 2, 4, 1], 8);
 *   bubbleSort([5, 3, 8, 7, 9, 6, 2, 4, 1]);
 *   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
 */
function bubbleSort(arr, n=arr.length-1) {
  (new Array()).rangeArray(0, n).forEach(function(i) {
    (new Array()).reverseRangeArray(i, n).forEach(function(j) {
      if(arr[j] < arr[j-1]) {
        coolSwap(arr, j, j-1);
      }
    });
  });
  return arr;
}

/**
 * Sorts the elements of the array using INSERTION sort algorithm
 *
 * @function insertionSort
 * @param {array} arr - Array to be bubble sorted
 * @return {array}
 *
 * Examples:
 *   insertionSort([5, 3, 8, 7, 9, 6, 2, 4, 1]);
 *   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
 */
function insertionSort(arr) {
  for(var i=1; i<arr.length; i++) {
    var j = i-1;
    var key = arr[i];
    while(j >= 0 && arr[j] > key) {
      arr[j+1] = arr[j];
      j = j-1;
    }
    arr[j+1] = key;
  }
  return arr;
}

/**
 * Creates and merges two arrays into a sorted array
 *
 * @function merge
 * @param {array} arr - Array to be bubble sorted
 * @param {number} p - Index of the first element in the array
 * @param {number} n - Index of the middle element in the array
 * @param {number} r - Index of the last element in the array
 * @return undefined
 *
 * Examples:
 *   merge([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 4, 8);
 *   => [5, 3, 6, 2, 4, 1, 8, 7, 9]
 */
function merge(arr, p, n, r) {
  var l1 = [];
  var l2 = [];

  (new Array()).rangeArray(p, n).forEach(function(i) {
    l1.push(arr[i]);
  });
  l1.push(Infinity);

  (new Array()).rangeArray(n+1, r).forEach(function(j) {
    l2.push(arr[j]);
  });
  l2.push(Infinity);

  var l1Index = 0;
  var l2Index = 0;

  for(var i=p; i<=r; i++) {
    if(l1[l1Index] < l2[l2Index]) {
      arr[i] = l1[l1Index];
      l1Index = l1Index + 1;
    } else {
      arr[i] = l2[l2Index];
      l2Index = l2Index + 1;
    }
  }
}

/**
 * Sorts the elements of the array using MERGE sort algorithm
 *
 * @function mergeSort
 * @param {array} arr - Array to be bubble sorted
 * @param {number} p - Index of the first element in the array
 * @param {number} r - Index of the last element in the array
 * @return {array}
 *
 * Examples:
 *   mergeSort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8);
 *   mergeSort([5, 3, 8, 7, 9, 6, 2, 4, 1]);
 *   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
 */
function mergeSort(arr, p=0, r=arr.length-1) {
  var n = Math.floor((p+r)/2);
  if(p < r) {
    mergeSort(arr, p, n);
    mergeSort(arr, n+1, r);
    merge(arr, p, n, r);
  }
  return arr;
}

/**
 * Divides the array into two segments by selecting last element as the key
 *
 * @function partition
 * @param {array} arr - Array to be bubble sorted
 * @param {number} p - Index of the first element in the array
 * @param {number} r - Index of the last element in the array
 * @return {number}
 *
 * Examples:
 *   partition([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8);
 *   => 4
 */
function partition(arr, p, r) {
  var key = arr[r], i = p-1;
  (new Array()).rangeArray(p, r-1).forEach(function(j) {
    if(arr[j] <= key) {
      i += 1;
      coolSwap(arr, i, j);
    }
  });
  coolSwap(arr, i+1, r);
  return i+1;
}

/**
 * Sorts the elements of the array using QUICK sort algorithm
 * Divide and conquer strategy
 *
 * @function quickSort
 * @param {array} arr - Array to be bubble sorted
 * @param {number} p - Index of the first element in the array
 * @param {number} r - Index of the last element in the array
 * @return {array}
 *
 * Examples:
 *   quickSort([5, 3, 8, 7, 9, 6, 2, 4, 1], 0, 8);
 *   quickSort([5, 3, 8, 7, 9, 6, 2, 4, 1]);
 *   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
 */
function quickSort(arr, p=0, r=arr.length-1) {
  if(p < r) {
    var q = partition(arr, p, r);
    quickSort(arr, p, q-1);
    quickSort(arr, q+1, r);
  }
  return arr;
}

function unitTestSorting() {
  test('Swap', swapTest());
  test('Cool Swap', coolSwapTest());
  test('Bubble Sort', bubbleSortTest());
  test('Insertion Sort', insertionSortTest());
  test('Merge', mergeTest());
  test('Merge Sort', mergeSortTest());
  test('Partition', partitionTest());
  test('Quick Sort', quickSortTest());
}

function test(functionName, functionTest) {
  if(functionTest) {
    console.log(functionName + " OK");
  } else {
    console.log(functionName + " FAIL");
  }
}

function swapTest() {
  var arr = [5, 3, 8, 7, 9, 6, 2, 4, 1];
	swap(arr, 1, 2);
	return (arr[1] === 8 && arr[2] === 3);
}

function coolSwapTest() {
  var arr = [5, 3, 8, 7, 9, 6, 2, 4, 1];
	coolSwap(arr, 1, 2);
	return (arr[1] === 8 && arr[2] === 3);
}

function bubbleSortTest() {
  var arr = [5, 3, 8, 7, 9, 6, 2, 4, 1];
  return JSON.stringify(bubbleSort(arr)) === JSON.stringify([1, 2, 3, 4, 5, 6, 7, 8, 9]);
}

function insertionSortTest() {
  var arr = [5, 3, 8, 7, 9, 6, 2, 4, 1];
  return JSON.stringify(insertionSort(arr)) === JSON.stringify([1, 2, 3, 4, 5, 6, 7, 8, 9]);
}

function mergeTest() {
  var arr = [5, 3, 8, 7, 9, 6, 2, 4, 1];
  merge(arr, 0, 4, 8);
  return JSON.stringify(arr) === JSON.stringify([5, 3, 6, 2, 4, 1, 8, 7, 9]);
}

function mergeSortTest() {
  var arr = [5, 3, 8, 7, 9, 6, 2, 4, 1];
  return JSON.stringify(mergeSort(arr)) === JSON.stringify([1, 2, 3, 4, 5, 6, 7, 8, 9]);
}

function partitionTest() {
  return partition([1, 3, 8, 7, 9, 6, 2, 4, 5], 0, 8) === 4;
}

function quickSortTest() {
  var arr = [5, 3, 8, 7, 9, 6, 2, 4, 1];
  return JSON.stringify(quickSort(arr)) === JSON.stringify([1, 2, 3, 4, 5, 6, 7, 8, 9]);
}

unitTestSorting();
