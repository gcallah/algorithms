/**
 * Returns an array with elements populated between the specified range(INCLUSIVE)
 * @extends Array
 * @function rangeArray
 * @param {number} startIndex - Start element of the array to be built
 * @param {number} endIndex - End element of the array to be built
 */
Array.prototype.rangeArray = function (startIndex, endIndex) {
  var arr = []
  for(var i=startIndex; i<endIndex; i++) {
    arr.push(i)
  }
  return arr;
}

/**
 * Returns the Nth fibonacci number.
 * @extends Number
 * @function naiveFib
 */
Number.prototype.naiveFib = function () {
  if (Number(this) < 0)
    return -1;
  switch (Number(this)) {
    case 0:
      return 0;
    case 1:
      return 1;
    default:
      return (this-1).naiveFib() + (this-2).naiveFib()
  }
}

/**
 * Returns the Nth fibonacci number.
 * @extends Number
 * @function memoFib
 */
Number.prototype.memoFib = function (hash={}) {
  if (Number(this) < 0) return -1;
  else if (Number(this) === 0) return 0;
  else if (Number(this) === 1) return 1;
  else {
    prevFib = hash[this-1] || (hash[this-1] = (this-1).memoFib(hash));
    prevPrevFib = hash[this-2] || (hash[this-2] = (this-2).memoFib(hash));
    return prevFib + prevPrevFib;
  }
}

/**
 * Returns the Nth fibonacci number.
 * @extends Number
 * @function iterFib
 */
Number.prototype.iterFib = function () {
  var v1 = 0, v2 = 1, temp = 0;
  (new Array()).rangeArray(0, this-1).forEach(function(index) {
    temp = v2;
    v2 = v2 + v1;
    v1 = temp
  });
  return v2
}
