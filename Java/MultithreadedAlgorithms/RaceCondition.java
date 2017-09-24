/**
 * Created by xuzebin on 8/22/17.
 */

package MultithreadedAlgorithms;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.ExecutionException;

public class RaceCondition {

    private static final int THREAD_NUM = 10;
    private static final int TEST_TIME = 10;
    private int x;

    public RaceCondition() {
        this.x = 0;
    }

    public void runRaceExample() {
        int testTime = TEST_TIME;
        System.out.printf("If not always printing %d, there is a race condition.\n", THREAD_NUM);
        while (testTime-- > 0) {
            resetX();
            raceExample();
        }
    }

    public void raceExample() {
        for (int i = 0; i < THREAD_NUM; i++) {
            new Thread(new Runnable() {
                    @Override public void run() {
                        incrementX();
                    }
                }).start();
        }
        System.out.println(x);
    }

    private void incrementX() {
        this.x += 1;
    }

    private void resetX() {
        this.x = 0;
    }
}