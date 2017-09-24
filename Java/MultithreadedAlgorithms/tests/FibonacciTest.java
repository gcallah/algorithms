/**
 * Created by Zebin Xu on 8/22/17.
 */

package MultithreadedAlgorithms.tests;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import MultithreadedAlgorithms.Fibonacci;

public class FibonacciTest {

    // nth element means nth fibonacci number (n >= 0)
    private static final int[] fibonacciNumbers = new int[] { 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 };

    @Test public void testFib() {
        Fibonacci fibonacci = new Fibonacci();
        for (int i = 0; i < fibonacciNumbers.length; i++) {
            assertEquals(fibonacci.fib(i), fibonacciNumbers[i]);
        }
    }

    @Test public void testPFib() {
        Fibonacci fibonacci = new Fibonacci();
        for (int i = 0; i < fibonacciNumbers.length; i++) {
            assertEquals(fibonacci.pFib(i), fibonacciNumbers[i]);
        }
    }
}