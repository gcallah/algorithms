/**
 * This file includes counting sort algorithm in chapter 8 (Sorting in Linear Time).
 *
 * Created by Zebin Xu on 2/27/17.
 */

package sortinginlineartime;

import java.util.Arrays;

public class CountingSort {

    public static void main(String[] args) {
        int[] a = {2, 5, 3, 0, 2, 3, 0, 3};
        int[] b = new int[a.length];
        int k = 5;
        countingSort(a, b, k);
        System.out.println("Unsorted array: " + Arrays.toString(a));
        System.out.println("Sorted array: " + Arrays.toString(b));
    }

    /**
     * Counting sort assumes each of the n input elements
     * is an integer in the range 0 to k, for some integer k.
     * <p>
     * Time complexity: O(n)
     *
     * @param a the input array
     * @param b the sorted output array
     * @param k the largest value in the input array.
     */
    public static void countingSort(int[] a, int[] b, int k) {
        int[] c = new int[k + 1];// Default values are 0.
        for (int j = 0; j < a.length; j++) {
            c[a[j]]++;
        }
        // c[i] now contains the number of elements equal to i.
        for (int i = 1; i < k + 1; i++) {
            c[i] += c[i - 1];
        }
        // c[i] now contains the number of elements less than or equal to i.
        for (int j = a.length - 1; j >= 0; j--) {
            b[c[a[j]] - 1] = a[j];
            c[a[j]]--;
        }
    }

    /**
     * Counting sort on a specific digit of numbers.
     *
     * @param a    the array to be sorted, the sorted array will be copied back.
     * @param d    the d-th digit starting from right to left (e.g. the 1st digit of 123 is 3).
     * @param base the base of numbers in the array.
     */
    public static void countingSortOnDigit(int[] a, int d, int base) {
        int exp = (int) Math.pow(10, d - 1);
        int[] c = new int[base];// When base=10, the maximum value of the digit is 9.
        int[] temp = new int[a.length];
        for (int j = 0; j < a.length; j++) {
            c[(a[j] / exp) % base]++;
        }
        for (int i = 1; i < base; i++) {
            c[i] += c[i - 1];
        }
        for (int j = a.length - 1; j >= 0; j--) {
            temp[c[(a[j] / exp) % base] - 1] = a[j];
            c[(a[j] / exp) % base]--;
        }
        // Copy the sorted array back to a.
        System.arraycopy(temp, 0, a, 0, temp.length);
    }
}