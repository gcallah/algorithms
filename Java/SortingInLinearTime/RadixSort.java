/**
 * This file includes radix sort algorithm in chapter 8 (Sorting in Linear Time).
 * It uses counting sort for each digit of elements in the array.
 *
 * Created by Zebin Xu on 2/28/17.
 */

package sortinginlineartime;

import java.util.Arrays;

public class RadixSort {

    public static void main(String[] args) {
        int[] a = {170, 45, 75, 90, 802, 24, 2, 66};
        System.out.println("Unsorted array: " + Arrays.toString(a));
        radixSortRevised(a);
        System.out.println("Sorted array: " + Arrays.toString(a));
    }

    /**
     * Radix sort sorts elements in an array based on digits, from the least-siginificant digit to the most-significant one.
     * Unlike our textbook that assumes each element in the array a has d digits,
     * we only need to assume the maximum value in the array a has d digits, 
     * where digit 1 is the lowest-order digit and digit d is the highest-order digit.
     * <p>
     * Time complexity: 
     * O(d(n + k)) for n d-digit elements in which each digit takes on up to k possible values (e.g., k=10 for decimal values).
     *
     * @param a the input array
     * @param d number of digits of the maximum value in a
     */
    public static void radixSort(int[] a, int d) {
        for (int i = 1; i <= d; i++) {
            // Use counting sort as the stable sort algorithm to sort array a on digit i
            CountingSort.countingSortOnDigit(a, i, 10);
        }
    }

    /**
     * A revised version of radix sort in which we don't have to pass the number of digits of the maximum value in array a.
     * Instead, we calculate them.
     * 
     * @param a the array to be sorted
     */
    public static void radixSortRevised(int[] a) {
        int max = getMaximum(a);
        int d = (int) (Math.log10(max) + 1);
        radixSort(a, d);
    }

    /**
     * Get the maximum value in the array.
     *
     * @param a the input array
     * @return  the maximum value
     */
    private static int getMaximum(int[] a) {
        int max = Integer.MIN_VALUE;
        for (int val : a) {
            max = max < val ? val : max;
        }
        return max;
    }
}