/**
 * Created by Zebin Xu.
 * Test findMaximumSubarray algorithm in the DivideAndConquer chapter.
 */

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class FindMaximumSubarrayTest {

    @Test public void testFindMaximumSubarray() {
        FindMaximumSubarray fms = new FindMaximumSubarray();
        int[] array = {13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7};

        FindMaximumSubarray.Tuple max = fms.findMaximumSubarray(array);
        assertEquals(max.low, 7);
        assertEquals(max.high, 10);
        assertEquals(max.sum, 43);
    }
}