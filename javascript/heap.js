function parent(number) {
  return Math.floor(number/2);
}

function left(number) {
  return 2 * number;
}

function right(number) {
  return (2 * number) + 1;
}

function half(number) {
  return parent(number);
}

Array.prototype.heapSize = 0;

Array.prototype.reverseRangeArray = function(startIndex, endIndex) {
  var arr = []
  for(var i=endIndex; i>=startIndex; i--) {
    arr.push(i);
  }
  return arr;
}

function maxHeapify(arr, i) {
  arr.heapSize = arr.heapSize || arr.length;

  var l = left(i), r = right(i);

  var largest = (l <= arr.heapSize-1 && arr[l] > arr[i]) ? l : i;
  if (r <= arr.heapSize-1 && arr[r] > arr[largest]) {
    largest = r;
  }

  if(largest !== i) {
    [arr[i], arr[largest]] = [arr[largest], arr[i]];
    maxHeapify(arr, largest);
  }
}

function buildMaxHeap(arr) {
  arr.heapSize = arr.length;
  (new Array()).reverseRangeArray(0, half(arr.length)).forEach(function(i) {
    maxHeapify(arr, i);
  });
}

function heapSort(arr) {
  buildMaxHeap(arr);
  (new Array()).reverseRangeArray(1, arr.length-1).forEach(function(i) {
    [arr[0], arr[i]] = [arr[i], arr[0]];
    arr.heapSize -= 1;
    maxHeapify(arr, 0);
  });
  return arr;
}
