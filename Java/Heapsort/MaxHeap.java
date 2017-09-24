/**
 * Created by Zebin Xu.
 *
 */

package heapsort;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;

public class MaxHeap extends Heap {

    public static void main(String[] args) {
        int[] array = {4, 1, 3, 2, 16, 9, 10, 14, 8, 7};
        List<Integer> heapArray = Arrays.stream(array).boxed().collect(Collectors.toList());

        MaxHeap heap = new MaxHeap(heapArray);
        System.out.println(heap);

        heap.buildMaxHeap();
        System.out.printf("build a max heap: %s%n", heap);
        
        /** heapsort example **/
        heap.sort();
        System.out.printf("heap sort (ascending order): %s%n", heap);
    }

    public MaxHeap() {
        super();
    }

    public MaxHeap(List<Integer> array) {
        super(array);
    }

    public void maxHeapify(List<Integer> heapArray, int i) {
        heapify(heapArray, heapArray.size(), i, HeapType.MAX);
    }

    public void buildMaxHeap() {
        super.buildHeap(HeapType.MAX);
    }

    public void sort() {
        super.sort(HeapType.MAX);
    }

    /** for max priority queue **/

    public int heapMaximum() {
        return heapMaximum(this.array);
    }
    
    public int heapExtractMax() {
        return heapExtractMax(this.array);
    }

    public void heapIncreaseKey(int i, int key) {
        heapIncreaseKey(this.array, i, key);
    }

    public void maxHeapInsert(int key) {
        maxHeapInsert(this.array, key);
        System.out.printf("inserting key %d in the max heap.%n", key);
    }
       
    /**
     * Returns the largest key.
     * Time: O(1)
     */
    private int heapMaximum(List<Integer> array) {
        return array.get(0);
    }

    /**
     * Removes and returns the largest key from the max heap.
     * Time: O(logn)
     */ 
    private int heapExtractMax(List<Integer> array) {
        if (array == null || array.size() < 1) {
            throw new IllegalArgumentException("heap null or underflow");
        }
        int max = heapMaximum(array);
        array.set(0, array.get(array.size() - 1));
        array.remove(array.size() - 1);
        maxHeapify(array, 0);
        return max;
    }

    /**
     * Increases the current key at i to a new key which is no smaller than the current key.
     * Time: O(logn)
     */
    private void heapIncreaseKey(List<Integer> array, int i, int key) {
        if (key < array.get(i)) {
            throw new IllegalArgumentException("new key is smaller than current key");
        }
        array.set(i, key);
        while (i > 0 && array.get(parent(i)) < array.get(i)) {
            swap(array, i, parent(i));
            i = parent(i);
        }
    }

    /**
     * Inserts a key into the max heap.
     * Time: O(logn)
     */
    private void maxHeapInsert(List<Integer> array, int key) {
        array.add(Integer.MIN_VALUE);
        heapIncreaseKey(array, array.size() - 1, key);
    }
    
}