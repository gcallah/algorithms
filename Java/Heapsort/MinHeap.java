/**
 * Created by Zebin Xu.
 *
 */

package heapsort;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;

public class MinHeap extends Heap {

    public static void main(String[] args) {
        int[] array = {4, 1, 3, 2, 16, 9, 10, 14, 8, 7};
        List<Integer> heapArray = Arrays.stream(array).boxed().collect(Collectors.toList());

        MinHeap heap = new MinHeap(heapArray);
        System.out.println(heap);

        heap.buildMinHeap();
        System.out.printf("build a min heap: %s%n", heap);
        
        /** heapsort example  **/
        heap.sort();
        System.out.printf("heap sort (descending order): %s%n", heap);
    }

    public MinHeap() {
        super();
    }

    public MinHeap(List<Integer> array) {
        super(array);
    }

    public void minHeapify(List<Integer> heapArray, int i) {
        heapify(heapArray, heapArray.size(), i, HeapType.MIN);
    }

    public void buildMinHeap() {
        super.buildHeap(HeapType.MIN);
    }

    public void sort() {
        super.sort(HeapType.MIN);
    }

    /** for min priority queue **/

    public int heapMinimum() {
        return heapMinimum(this.array);
    }
    
    public int heapExtractMin() {
        return heapExtractMin(this.array);
    }

    public void heapDecreaseKey(int i, int key) {
        heapDecreaseKey(this.array, i, key);
    }

    public void minHeapInsert(int key) {
        minHeapInsert(this.array, key);
        System.out.printf("inserting key %d in the min heap.%n", key);
    }
       
    /**
     * Returns the smallest key.
     * Time: O(1)
     */
    private int heapMinimum(List<Integer> array) {
        return array.get(0);
    }

    /**
     * Removes and returns the smallest key from the min heap.
     * Time: O(logn)
     */ 
    private int heapExtractMin(List<Integer> array) {
        if (array == null || array.size() < 1) {
            throw new IllegalArgumentException("heap null or underflow");
        }
        int min = heapMinimum(array);
        array.set(0, array.get(array.size() - 1));
        array.remove(array.size() - 1);
        minHeapify(array, 0);
        return min;
    }

    /**
     * Decreases the current key at i to a new key which is no larger than the current key.
     * Time: O(logn)
     */
    private void heapDecreaseKey(List<Integer> array, int i, int key) {
        if (key > array.get(i)) {
            throw new IllegalArgumentException("new key is larger than current key");
        }
        array.set(i, key);
        while (i > 0 && array.get(parent(i)) > array.get(i)) {
            swap(array, i, parent(i));
            i = parent(i);
        }
    }

    /**
     * Inserts a key into the min heap.
     * Time: O(logn)
     */
    private void minHeapInsert(List<Integer> array, int key) {
        array.add(Integer.MAX_VALUE);
        heapDecreaseKey(array, array.size() - 1, key);
    }
    
}