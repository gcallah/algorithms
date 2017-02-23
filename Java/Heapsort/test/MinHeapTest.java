/**
 * Created by Zebin Xu.
 * Test Heapsort algorithm for MinHeap.
 */

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;

public class MinHeapTest {
    
    @Test public void testHeapsort() {
        int[] array = {4, 1, 3, 2, 16, 9, 10, 14, 8, 7};
        List<Integer> heapArray = Arrays.stream(array).boxed().collect(Collectors.toList());

        MinHeap minHeap = new MinHeap(heapArray);
        minHeap.sort();

        int[] sortedArray = {16, 14, 10, 9, 8, 7, 4, 3, 2, 1};
        assertEquals(minHeap.toString(), Arrays.toString(sortedArray));
    }
}