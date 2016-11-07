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
 * Returns an array with specified number of empty arrays as elements
 *
 * @extends Array
 * @function arrayOfArrays
 * @param {number} n - Number of empty arrays to be stubbed inside
 * @return {array}
 *
 * Examples:
 *    (new Array()).arrayOfArrays(5);
 *    => [[], [], [], [], []]
 */
Array.prototype.arrayOfArrays = function(n) {
  return (new Array()).rangeArray(0, n-1).map(function() { return []; });
}

/**
* Flattens all the array elements and returns a one dimensional array
 *
 * @extends Array
 * @function flatten
 * @return {array}
 *
 * Examples:
 *    var arr = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
 *    arr.flatten();
 *    => [1, 2, 3, 4 ,5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
 */
Array.prototype.flatten = function() {
  return this.reduce(function (a, b) {
    return a.concat(Array.isArray(b) ? flatten(b) : b);
  }, []);
}

Array.prototype.chunk = function(rowStart, rowEnd, columnStart, columnEnd) {
  return [].rangeArray(rowStart, rowEnd).map(function(x) {
    var xArray = [];
    [].rangeArray(columnStart, columnEnd).forEach(function(i) {
      xArray.push(this[x][i]);
    }.bind(this));
    return xArray;
  }.bind(this));
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
  var n = m1.length,
      c = (new Array()).arrayOfArrays(n);

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
  var n = (mat.length-1), nHalf = mat.length/2,
      m11 = mat.chunk(0, nHalf-1, 0, nHalf-1),
      m12 = mat.chunk(0, nHalf-1, nHalf, n),
      m21 = mat.chunk(nHalf, n, 0, nHalf-1),
      m22 = mat.chunk(nHalf, n, nHalf, n);

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

function strassenMultiplication(a, b) {
  var aParted = matrixPartitioner(a);
      bParted = matrixPartitioner(b);

      s1 = matAddOrSubtract(bParted[1], bParted[3], '-');
      s2 = matAddOrSubtract(aParted[0], aParted[1], '+');
      s3 = matAddOrSubtract(aParted[2], aParted[3], '+');
      s4 = matAddOrSubtract(bParted[2], bParted[0], '-');
      s5 = matAddOrSubtract(aParted[0], aParted[3], '+');
      s6 = matAddOrSubtract(bParted[0], bParted[3], '+');
      s7 = matAddOrSubtract(aParted[1], aParted[3], '-');
      s8 = matAddOrSubtract(bParted[2], bParted[3], '+');
      s9 = matAddOrSubtract(aParted[0], aParted[2], '-');
      s10 = matAddOrSubtract(bParted[0], bParted[1], '+');

      p1 = squareMatrixMultiplyRecursive(aParted[0], s1);
      p2 = squareMatrixMultiplyRecursive(s2, bParted[3]);
      p3 = squareMatrixMultiplyRecursive(s3, bParted[0]);
      p4 = squareMatrixMultiplyRecursive(aParted[3], s4);
      p5 = squareMatrixMultiplyRecursive(s5, s6);
      p6 = squareMatrixMultiplyRecursive(s7, s8);
      p7 = squareMatrixMultiplyRecursive(s9, s10);

      c11 = matAddOrSubtract(matAddOrSubtract(p5, p6, '+'), matAddOrSubtract(p4, p2, '-'), '+');
      c12 = matAddOrSubtract(p1, p2, '+');
      c21 = matAddOrSubtract(p3, p4, '+');
      c22 = matAddOrSubtract(matAddOrSubtract(p5, p3, '-'), matAddOrSubtract(p1, p7, '-'), '+');

  return assembleMatrix([c11, c12, c21, c22]);
}

function unitTestDivAndConquer() {
  test('Find max crossing subarray', findMaxCrossingSubArrayTest());
  test('Find max subarray', findMaxSubArrayTest());
  test('Square matix multiply', squareMatrixMultiplyTest());
  test('Matrix partitioner', matrixPartitionerTest());
  test('Assemble matrix', assembleMatrixTest());
  test('Square matrix multiply Recursive', squareMatrixMultiplyRecursiveTest());
  test('Strassen muliplication', strassenMultiplicationTest());
}

function test(functionName, functionTest) {
  if(functionTest) {
    console.log(functionName + " OK");
  } else {
    console.log(functionName + " FAIL");
  }
}

var mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]],
    mat2 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]],
    mat1Xmat2 = [[90, 100, 110, 120], [202, 228, 254, 280], [314, 356, 398, 440], [426, 484, 542, 600]];

function findMaxCrossingSubArrayTest() {
  return JSON.stringify(findMaxCrossingSubArray([-2, -3, 4, -1, -2, 1, 5, -3], 0, 3, 7)) === JSON.stringify([2, 6, 7]);
}

function findMaxSubArrayTest() {
  return JSON.stringify(findMaxSubArray([-2, -3, 4, -1, -2, 1, 5, -3])) === JSON.stringify([2, 6, 7]);
}

function squareMatrixMultiplyTest() {
  return JSON.stringify(squareMatrixMultiply(mat1, mat2)) === JSON.stringify(mat1Xmat2);
}

function matrixPartitionerTest() {
  return JSON.stringify(matrixPartitioner(mat1)) == JSON.stringify([[[1, 2], [5, 6]], [[3, 4], [7, 8]], [[9, 10], [13, 14]], [[11, 12], [15, 16]]]);
}

function assembleMatrixTest() {
  var partitionedMat = [[[1, 2], [5, 6]], [[3, 4], [7, 8]], [[9, 10], [13, 14]], [[11, 12], [15, 16]]]
  return JSON.stringify(assembleMatrix(partitionedMat)) === JSON.stringify(mat1);
}

function squareMatrixMultiplyRecursiveTest() {
  return JSON.stringify(squareMatrixMultiplyRecursive(mat1, mat2)) === JSON.stringify(mat1Xmat2);
}

function strassenMultiplicationTest() {
  return JSON.stringify(strassenMultiplication(mat1, mat2)) === JSON.stringify(mat1Xmat2);
}

unitTestDivAndConquer();
