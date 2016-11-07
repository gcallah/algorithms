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

Array.prototype.reverseRangeArray = function(startIndex, endIndex) {
  var arr = []
  for(var i=endIndex; i>=startIndex; i--) {
    arr.push(i);
  }
  return arr;
}

Array.prototype.arrayOfArrays = function(n) {
  return (new Array()).rangeArray(0, n-1).map(function() { return []; });
}

Array.prototype.flatten = function() {
  return this.reduce(function (a, b) {
    return a.concat(Array.isArray(b) ? flatten(b) : b);
  }, []);
}

function findMaxCrossingSubArray(arr, low, mid, high) {
  var sum = 0, maxLeft = 0, leftSum = -Infinity, rightSum = -Infinity;
  (new Array()).reverseRangeArray(0, mid).forEach(function(i) {
    sum += arr[i];
    if (sum > leftSum) {
      leftSum = sum;
      maxLeft = i;
    }
  });
  sum = 0;
  (new Array()).rangeArray(mid+1, high).forEach(function(i) {
    sum += arr[i];
    if(sum > rightSum) {
      rightSum = sum;
      maxRight = i;
    }
  });
  return [maxLeft, maxRight, leftSum+rightSum];
}

function findMaxSubArray(arr, low=0, high=arr.length-1) {
  if(low === high) return [low, high, arr[low]];

  var mid = Math.floor((low+high)/2),
      leftSubArray = findMaxSubArray(arr, low, mid);
      rightSubArray = findMaxSubArray(arr, mid+1, high);
      crossSubArray = findMaxCrossingSubArray(arr, low, mid, high);

  if (leftSubArray[2] > rightSubArray[2] && leftSubArray[2] > crossSubArray[2]) return leftSubArray;
  if (rightSubArray[2] > leftSubArray[2] && rightSubArray[2] > crossSubArray[2]) return rightSubArray;
  return crossSubArray;
}

function squareMatrixMultiply(m1, m2) {
  var n = m1.length, c = (new Array()).arrayOfArrays(n);

  (new Array()).rangeArray(0, n-1).forEach(function(i) {
    (new Array()).rangeArray(0, n-1).forEach(function(j) {
      c[i].push(0);
      (new Array()).rangeArray(0, n-1).forEach(function(k) {
        c[i][j] += m1[i][k] * m2[k][j];
      });
    });
  });
  return c;
}

function matrixPartitioner(mat) {
  var n = (mat.length-1), nHalf = mat.length/2;

  m11 = (new Array()).rangeArray(0, nHalf-1).map(function(x) {
    var xArray = [];
    (new Array()).rangeArray(0, nHalf-1).forEach(function(i) {
      xArray.push(mat[x][i]);
    });
    return xArray;
  });

  m12 = (new Array()).rangeArray(0, nHalf-1).map(function(x) {
    var xArray = [];
    (new Array()).rangeArray(nHalf, n).forEach(function(i) {
      xArray.push(mat[x][i]);
    });
    return xArray;
  });

  m21 = (new Array()).rangeArray(nHalf, n).map(function(x) {
    var xArray = [];
    (new Array()).rangeArray(0, nHalf-1).forEach(function(i) {
      xArray.push(mat[x][i]);
    });
    return xArray;
  });

  m22 = (new Array()).rangeArray(nHalf, n).map(function(x) {
    var xArray = [];
    (new Array()).rangeArray(nHalf, n).forEach(function(i) {
      xArray.push(mat[x][i]);
    });
    return xArray;
  });

  return [m11, m12, m21, m22];
}

function flatten(arr) {
  return arr.reduce(function (a, b) {
    return a.concat(Array.isArray(b) ? flatten(b) : b);
  }, []);
}

function assembleMatrix(matList) {
  var matList = matList.flatten(),
      rows = matList.length**(0.5),
      columns = rows,
      finalMatrix = (new Array()).arrayOfArrays(rows);
  [].rangeArray(0, rows-1).forEach(function(row) {
    [].rangeArray(0, columns-1).forEach(function(column) {
      var offset = ( ( Math.floor(row / 2) ) * 8 ) +
                   ( ( Math.floor(row % 2) ) * 2 ) +
                   ( ( Math.floor(column / 2) ) * 2 ) +
                   column;
      finalMatrix[row].push(matList[offset]);
    });
  });

  return finalMatrix;
}

function matAddOrSubtract(mat1, mat2, operation='+') {
  var n = mat1.length,
      result = (new Array()).arrayOfArrays(n);

  [].rangeArray(0, n-1).forEach(function(i) {
    [].rangeArray(0, n-1).forEach(function(j) {
      result[i].push(operation === '+' ? (mat1[i][j] + mat2[i][j]) : (mat1[i][j] - mat2[i][j]));
    });
  });
  return result;
}

function squareMatrixMultiplyRecursive(a, b) {
  var n = a.length, aParted = [], bParted = [],
      c11 = [], c12 = [], c21 = [], c22 = [],
      c = [].arrayOfArrays(n);

  if(n === 1) {
    c[0].push(a[0][0]*b[0][0]);
  } else {
    aParted = matrixPartitioner(a);
    bParted = matrixPartitioner(b);
    c11 = matAddOrSubtract(squareMatrixMultiplyRecursive(aParted[0], bParted[0]),
                           squareMatrixMultiplyRecursive(aParted[1], bParted[2]));

    c12 = matAddOrSubtract(squareMatrixMultiplyRecursive(aParted[0], bParted[1]),
                           squareMatrixMultiplyRecursive(aParted[1], bParted[3]));

    c21 = matAddOrSubtract(squareMatrixMultiplyRecursive(aParted[2], bParted[0]),
                           squareMatrixMultiplyRecursive(aParted[3], bParted[2]));

    c22 = matAddOrSubtract(squareMatrixMultiplyRecursive(aParted[2], bParted[1]),
                           squareMatrixMultiplyRecursive(aParted[3], bParted[3]));

    c = assembleMatrix([c11, c12, c21, c22]);
  }
  return c;
}
