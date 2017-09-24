/**
 * Created by Zebin Xu.
 *
 */

package heapsort;

import java.util.List;

public class MaxPriorityQueue {

    public static void main(String[] args) {
        MaxPriorityQueue queue = new MaxPriorityQueue();
        queue.insert(3);
        queue.insert(6);
        queue.insert(2);
        queue.insert(5);
        queue.insert(9);

        while (!queue.isEmpty()) {
            System.out.printf("maximum: %d%n", queue.maximum());
            System.out.printf("extract max: %d%n", queue.extractMax());
        }
    }

    private final MaxHeap heap;
    
    public MaxPriorityQueue() {
        this.heap = new MaxHeap();
    }

    public MaxPriorityQueue(List<Integer> array) {
        this.heap = new MaxHeap(array);
    }

    public void insert(int key) {
        heap.maxHeapInsert(key);
    }

    public int maximum() {
        return heap.heapMaximum();
    }

    public int extractMax() {
        return heap.heapExtractMax();
    }
    
    public void increaseKey(int i, int key) {
        heap.heapIncreaseKey(i, key);
    }

    public boolean isEmpty() {
        return heap.isEmpty();
    }


}