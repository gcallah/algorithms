Array.prototype.rangeArray = function (startIndex, endIndex) {
  var arr = []
  for(var i=startIndex; i<=endIndex; i++) {
    arr.push(i);
  }
  return arr;
}

Array.prototype.reverseRangeArray = function(startIndex, endIndex) {
  var arr = []
  for(var i=endIndex; i>=startIndex; i--) {
    arr.push(i);
  }
  return arr;
}

function coolSwap(arr, v1, v2) {
  [arr[v1], arr[v2]] = [arr[v2], arr[v1]];
}

function swap(arr, v1, v2) {
  var temp = arr[v1];
  arr[v1] = arr[v2];
  arr[v2] = temp;
}

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

function mergeSort(arr, p=0, r=arr.length-1) {
  var n = Math.floor((p+r)/2);
  if(p < r) {
    mergeSort(arr, p, n);
    mergeSort(arr, n+1, r);
    merge(arr, p, n, r);
  }
  return arr;
}

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

function quickSort(arr, p=0, r=arr.length-1) {
  if(p < r) {
    var q = partition(arr, p, r);
    quickSort(arr, p, q-1);
    quickSort(arr, q+1, r);
  }
  return arr;
}
