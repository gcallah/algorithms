/**
 * Created by Zebin Xu.
 * Test Heapsort algorithm for MaxHeap.
 */

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;

public class MaxHeapTest {
    
    @Test public void testHeapsort() {
        int[] array = {4, 1, 3, 2, 16, 9, 10, 14, 8, 7};
        List<Integer> heapArray = Arrays.stream(array).boxed().collect(Collectors.toList());

        MaxHeap maxHeap = new MaxHeap(heapArray);
        maxHeap.sort();

        int[] sortedArray = {1, 2, 3, 4, 7, 8, 9, 10, 14, 16};
        assertEquals(maxHeap.toString(), Arrays.toString(sortedArray));
    }
}