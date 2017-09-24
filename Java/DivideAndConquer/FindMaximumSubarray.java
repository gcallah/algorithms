/**
 * Created by Zebin Xu.
 * Maximum subarray implementation using divide-and-conquer following textbook.
 */

package divideandconquer;

import java.util.Arrays;

public class FindMaximumSubarray {
 
    public static void main(String[] args) {
    	FindMaximumSubarray fms = new FindMaximumSubarray();
    	int[] a = {2, -1, 3, -2};
    	Tuple max = fms.findMaximumSubarray(a);
    	System.out.println(Arrays.toString(a));
    	System.out.printf("max sum: %d, from %d to %d%n", max.sum, max.low, max.high);
    }

    public static class Tuple {
    	int low;
    	int high;
    	int sum;
    
    	Tuple(int low, int high, int sum) {
    	    this.low = low;
    	    this.high = high;
    	    this.sum = sum;
    	}
    }

    public Tuple findMaximumSubarray(int[] array) {
    	if (array == null) {
    	    throw new IllegalArgumentException("Array null");
    	}
        return findMaximumSubarray(array, 0, array.length - 1);
    }

    public Tuple findMaximumSubarray(int[] a, int low, int high) {
    	if (a == null || a.length == 0) {
    	    throw new IllegalArgumentException("Array null or empty");
    	}
    	if (low == high) {
    	    return new Tuple(low, high, a[low]);
    	} else {
    	    int mid = (low + high) >>> 1;
    	    Tuple left = findMaximumSubarray(a, low, mid);
    	    Tuple right = findMaximumSubarray(a, mid + 1, high);
    	    Tuple cross = findMaxCrossingSubarray(a, low, mid, high);
    	    
    	    if (left.sum >= right.sum && left.sum >= cross.sum) {
        		return left;
    	    } else if (right.sum >= left.sum && right.sum >= cross.sum) {
        		return right;
    	    } else {
        		return cross;
    	    }
    	}
    }

    private Tuple findMaxCrossingSubarray(int[] a, int low, int mid, int high) {
    	if (a == null || a.length == 0) {
    	    throw new IllegalArgumentException("Array null or empty");
    	}
    	int leftSum = Integer.MIN_VALUE;
    	int sum = 0;
    	int maxLeft = mid;
    	for (int i = mid; i >= low; --i) {
    	    sum += a[i];
    	    if (sum > leftSum) {
    		    leftSum = sum;
    		    maxLeft = i;
            }
	    }

    	int rightSum = Integer.MIN_VALUE;
    	sum = 0;
    	int maxRight = mid + 1;
    	for (int j = mid + 1; j <= high; ++j) {
    	    sum += a[j];
    	    if (sum > rightSum) {
                rightSum = sum;
                maxRight = j;
    	    }
    	}
	
	    return new Tuple(maxLeft, maxRight, leftSum + rightSum);
    }
}
