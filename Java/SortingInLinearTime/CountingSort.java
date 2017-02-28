/**
 * This file includes counting sort algorithm in chapter 8 (Sorting in Linear Time).
 *
 * Created by Zebin Xu on 2/27/17.
 */

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
}