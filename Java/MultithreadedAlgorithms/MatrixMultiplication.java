/**
 * Multithreaded matrix-vector, matrix-matrix multiplication algorithms.
 * Created by xuzebin on 8/22/17.
 */

package MultithreadedAlgorithms;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.ExecutionException;

public class MatrixMultiplication {

    @FunctionalInterface
    interface MatrixVectorExecutor {
        /**
         * Functional interface for the matrix-vector execution in a loop
         * @param A n x n matrix
         * @param x input n-vector
         * @param y result of Ax
         * @param i current row or column
         */
        void execute(final int[][] A, final int[] x, final int[] y, int i);
    }

    @FunctionalInterface
    interface MatrixExecutor {
        /**
         * Functional interface for the matrix-matrix execution in a loop
         * @param A the n x n matrix
         * @param B the n x n matrix
         * @param C the resulting n x n matrix
         * @param i current row or column
         */
        void execute(final int[][] A, final int[][] B, final int[][] C, int i);
    }

    /**
     * Matrix-vector multiplication using parallel loops
     * @param A n x n square matrix A
     * @param x input n-vector x
     * return multiplied vector y
     */
    public int[] matVec(final int[][] A, final int[] x) {
        final int n = A.length;//rows
        final int[] y = new int[n];

        doParallelLoop((A1, x1, y1, i) -> y1[i] = 0, A, x, y);

        doParallelLoop((A2, x2, y2, i) -> {
                for (int j = 0; j < x2.length; ++j) {
                    y2[i] += A2[i][j] * x2[j];
                }
            }, A, x, y);

        return y;
    }

    /**
     * Same as matVec except the second parallel for loop is implemented using divide-and-conquer
     * @param A n x n square matrix
     * @param x input n-vector x
     * return multiplied vector y
     */
    public int[] matVec2(final int[][] A, final int[] x) {
        final int n = A.length;//rows
        final int[] y = new int[n];

        doParallelLoop((A1, x1, y1, i) -> y1[i] = 0, A, x, y);

        matVecMainLoop(A, x, y, n, 0, n - 1);

        return y;
    }

    /**
     * Matrix vector multiplication using double parallel loops which is wrong because of race condition
     * @param A n x n square matrix
     * @param x input n-vector x
     * return multiplied vector y
     */
    public int[] matVecWrong(final int[][] A, final int[] x) {
        int n = A.length;
        final int[] y = new int[n];

        doParallelLoop((A1, x1, y1, i) -> y1[i] = 0, A, x, y);

        doParallelLoop((A2, x2, y2, i) -> {
                doParallelLoop((A3, x3, y3, j) -> {
                        y3[i] += A3[i][j] * x3[j];
                    }, A2, x2, y2);
            }, A, x, y);

        return y;        
    }

    /**
     * Matrix-matrix multiplication using parallel loops
     * @param A n x n square matrix
     * @param B n x n square matrix
     * return multiplied square matrix C
     */
    public int[][] pSquareMatrixMultiply(int[][] A, int[][] B) {
        final int n = A.length;
        final int[][] C = new int[n][n];

        doParallelLoop((A1, B1, C1, i) -> {
                doParallelLoop((A2, B2, C2, j) -> {
                        C[i][j] = 0;
                        for (int k = 0; k < n; k++) {
                            C[i][j] += A2[i][k] * B2[k][j];
                        }
                    }, A1, B1, C1);
            }, A, B, C);

        return C;
    }

    /**
     * Parallel loop implementation for matrix-vector operation
     * @param MatrixVectorExecutor a functional interface used for performing matrix-vector operation in the loop
     * @param A n x n square matrix
     * @param x input n-vector x
     * @param y multiplied n-vector y
     */
    private void doParallelLoop(final MatrixVectorExecutor matrixVectorExecutor, final int[][] A, final int[] x, final int[] y) {
        final int n = A.length;
        //Spawn
        ExecutorService executorService = Executors.newFixedThreadPool(n);
        List<Future<?>> futureList = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            final int cur = i;
            futureList.add(executorService.submit(() -> matrixVectorExecutor.execute(A, x, y, cur)));
        }

        //Sync: block until all threads complete
        for (Future<?> future : futureList) {
            try {
                future.get();
            } catch (InterruptedException | ExecutionException e) {
                Thread.currentThread().interrupt();
            }
        }
        executorService.shutdown();
    }

    /**
     * Parallel loop implementation for matrix-matrix operation
     * @param MatrixExecutor a functional interface used for performing matrix-matrix operation in the loop
     * @param A n x n square matrix
     * @param B n x n square matrix
     * @param C multiplied n x n square matrix
     */
    private void doParallelLoop(final MatrixExecutor matrixExecutor, final int[][] A, final int[][] B, final int[][] C) {
        final int n = A.length;
        ExecutorService executorService = Executors.newFixedThreadPool(n);
        List<Future<?>> futureList = new ArrayList<>(n);
        for (int i = 0;i < n; i++) {
            final int cur = i;
            futureList.add(executorService.submit(() -> matrixExecutor.execute(A, B, C, cur)));
        }

        // block until all threads complete
        for (Future<?> future : futureList) {
            try {
                future.get();
            } catch (InterruptedException | ExecutionException e) {
                Thread.currentThread().interrupt();
            }
        }
        executorService.shutdown();
    }

    private void matVecMainLoop(final int[][] A, final int[] x, final int[] y, final int n, int i, int ii) {
        if (i == ii) {
            for (int j = 0; j < n; j++) {
                y[i] += A[i][j] * x[j];
            }
        } else {
            int mid = (int) Math.floor((i + ii) * 0.5);
            //Spawn
            ExecutorService executorService = Executors.newSingleThreadExecutor();
            Future<?> future = executorService.submit(() -> matVecMainLoop(A, x, y, n, i, mid));

            matVecMainLoop(A, x, y, n, mid + 1, ii);

            //Sync
            try {
                future.get();
            } catch (InterruptedException | ExecutionException e) {
                Thread.currentThread().interrupt();
            }
            executorService.shutdown();
        }
    }
}