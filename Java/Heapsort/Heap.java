/**
 * Created by Zebin Xu.
 *
 */

package heapsort;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;

public class Heap {
    
    public static void main(String[] args) {
        int[] array = {4, 1, 3, 2, 16, 9, 10, 14, 8, 7};
        List<Integer> heapArray = Arrays.stream(array).boxed().collect(Collectors.toList());

        Heap heap = new Heap(heapArray);
        System.out.println(heap);

        /** heap operations **/
        heap.buildHeap(HeapType.MAX);
        System.out.printf("build a max heap: %s%n", heap);

        heap.buildHeap(HeapType.MIN);
        System.out.printf("build a min heap: %s%n", heap);
        
        /** heapsort examples **/
        heap.sort(HeapType.MAX);
        System.out.printf("heap sort in ascending order: %s%n", heap);

        heap.sort(HeapType.MIN);
        System.out.printf("heap sort in descending order: %s%n", heap);
    }

    public static enum HeapType {
        MIN,
        MAX
    }

    protected final List<Integer> array;

    public Heap() {
        this.array = new ArrayList<>();
    }

    public Heap(List<Integer> array) {
        this.array = array;
    }

    public int parent(int index) {
        return (index - 1) >> 1;
    }

    public int left(int index) {
        return (index << 1) + 1;
    }

    public int right(int index) {
        return (index << 1) + 2;
    }

    public void heapify(List<Integer> heapArray, int heapSize, int i, HeapType type) {
        int l = left(i);
        int r = right(i);

        int minOrMax = i;
        if (l < heapSize && compare(heapArray.get(l), heapArray.get(i), type)) {
            minOrMax = l;
        }
        if (r < heapSize && compare(heapArray.get(r), heapArray.get(minOrMax), type)) {
            minOrMax = r;
        }
        if (minOrMax != i) {
            swap(heapArray, i, minOrMax);
            heapify(heapArray, heapSize, minOrMax, type);
        }
    }

    private boolean compare(int one, int another, HeapType type) {
        switch(type) {
            case MIN:
                return one < another;
            case MAX:
                return one > another;
            default:
                throw new IllegalArgumentException(String.format("Unrecognized HeapType %s", type.name()));
        }
    }

    protected void swap(List<Integer> heapArray, int indexA, int indexB) {
        int temp = heapArray.get(indexA);
        heapArray.set(indexA, heapArray.get(indexB));
        heapArray.set(indexB, temp);
    }

    public void buildHeap(HeapType type) {
        buildHeap(this.array, type);
    }

    private void buildHeap(List<Integer> array, HeapType type) {
        final int heapSize = array.size();
        for (int i = heapSize / 2 - 1; i >= 0; --i) {
            heapify(array, heapSize, i, type);
        }
    }

    public void sort(HeapType type) {
        heapSort(this.array, type);
    }

    private void heapSort(List<Integer> array, HeapType type) {
        buildHeap(array, type);
        int size = array.size();
        for (int i = array.size() - 1; i > 0; --i) {
            swap(array, 0, i);
            size -= 1;
            heapify(array, size, 0, type);
        }
    }

    /** auxiliary methods **/

    public int size() {
        return array.size();
    }

    public boolean isEmpty() {
        return array.isEmpty();
    }

    @Override public String toString() {
        return array.toString();
    }
}