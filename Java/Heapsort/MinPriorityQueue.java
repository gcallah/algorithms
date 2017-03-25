/**
 * Created by Zebin Xu.
 *
 */

package heapsort;

import java.util.List;

public class MinPriorityQueue {

    public static void main(String[] args) {
        MinPriorityQueue queue = new MinPriorityQueue();
        queue.insert(9);
        queue.insert(3);
        queue.insert(6);
        queue.insert(2);
        queue.insert(5);
        
        while (!queue.isEmpty()) {
            System.out.printf("minimum: %d%n", queue.minimum());
            System.out.printf("extract min: %d%n", queue.extractMin());
        }
    }

    private final MinHeap heap;
    
    public MinPriorityQueue() {
        this.heap = new MinHeap();
    }

    public MinPriorityQueue(List<Integer> array) {
        this.heap = new MinHeap(array);
    }

    public void insert(int key) {
        heap.minHeapInsert(key);
    }

    public int minimum() {
        return heap.heapMinimum();
    }

    public int extractMin() {
        return heap.heapExtractMin();
    }
    
    public void decreaseKey(int i, int key) {
        heap.heapDecreaseKey(i, key);
    }

    public boolean isEmpty() {
        return heap.isEmpty();
    }
}