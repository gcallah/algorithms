/**
 * This file includes bucket sort algorithm in chapter 8 (Sorting in Linear Time).
 *
 * Created by Zebin Xu on 2/28/17.
 */

package sortinginlineartime;

import java.util.Arrays;
import java.util.List;
import java.util.LinkedList;
import java.util.ArrayList;

public class BucketSort {

    public static void main(String[] args) {
        double[] a = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};
        System.out.println("Unsorted array: " + Arrays.toString(a));
        bucketSort(a);
        System.out.println("Sorted array: " + Arrays.toString(a));
    }
    
    /**
     * Bucket sort assumes the input is drawn from a uniform distribution
     * and has an average-case runnning time of O(n).
     * <p>
     * Bucket sort divides the interval [0, 1) into n equal-sized subintervals, or buckets,
     * and then distributes the n input numbers into the buckets.
     * <p>
     * Our code for bucket sort assumes that the input is an n-element array a and 
     * that each element a[i] satisfies 0 <= a[i] < 1.
     * <p>
     * Time complexity: O(n)
     * 
     * @param a the input array
     */
    public static void bucketSort(double[] a) {
        int n = a.length;
        List<List<Double>> b = new ArrayList<>(n);// Array of buckets
        for (int i = 0; i < n; i++) {
            b.add(new LinkedList<>());// Make empty lists
        }
        for (int i = 0; i < n; i++) {
            b.get((int) Math.floor(n * a[i])).add(a[i]);
        }
        int index = 0;
        for (List<Double> list : b) {
            // Sort list b[i] with insertion sort.
            insertionSort(list);
            
            // Concatenate the lists of b
            for (double val : list) {
                a[index++] = val;
            }
        }

    }

    // TODO: Reuse the code in getting started (need to add package).
    private static void insertionSort(List<Double> list) {
        for (int j = 1; j < list.size(); ++j) {
            double key = list.get(j);
            int i = j - 1;
            while (i >= 0 && Double.compare(key, list.get(i)) < 0) {
                list.set(i + 1, list.get(i));
                i = i - 1;
            }
            list.set(i + 1, key);
        }
    }

        
}