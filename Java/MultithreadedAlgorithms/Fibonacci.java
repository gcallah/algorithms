/**
 * Created by Zebin Xu on 8/22/17.
 */

package MultithreadedAlgorithms;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ExecutionException;

public class Fibonacci {

    public int fib(int n) {
        if (n <= 1) {
            return n;
        } else {
            int x = fib(n - 1);
            int y = fib(n - 2);
            return x + y;
        }
    }
    
    // Fibonacci using dynamic multithreading & Java 8 features.
    public int pFib(int n) {
        if (n <= 1) {
            return n;
        } else {
            ExecutorService executorService = Executors.newSingleThreadExecutor();
            //Spawn
            Future<Integer> future = executorService.submit(() -> pFib(n - 1));

            int y = pFib(n - 2);

            //Sync
            int x = 0;
            try {
                x = future.get();
            } catch (InterruptedException | ExecutionException e) {
                Thread.currentThread().interrupt();
            }
            executorService.shutdown();

            return x + y;
        }
    }
}