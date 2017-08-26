/**
 * Run multithreaded algorithms and print.
 * Created by xuzebin on 8/25/17.
 */

package MultithreadedAlgorithms;

import java.util.Arrays;
import MultithreadedAlgorithms.MatrixMultiplication;
import MultithreadedAlgorithms.RaceCondition;

public class MultithreadedAlgorithms {

    public static void main(String[] args) {
        final int[][] A = {
            {1, 2, 3},
            {3, 2, 1},
            {2, 2, 2}
        };
        final int[][] B = {
            {1, 2, 3},
            {3, 2, 1},
            {2, 2, 2}
        };
        final int[] x = {1, 2, 3};

        //Fibonacci using dynamic multithreading example
        Fibonacci fibonacci = new Fibonacci();
        System.out.println("Fibonacci using dynamic multithreading:");
        final int nth = 7;
        int fib = fibonacci.pFib(nth);
        System.out.printf("%dth (n >= 0) fibonacci number is %d\n", nth, fib);

        //Multithreaded matrix multiplication
        MatrixMultiplication matrixMultiplication = new MatrixMultiplication();
        System.out.println("Multithreaded matrix-vector multiplication using self-implemented parallel loops:");
        int[] y1 = matrixMultiplication.matVec(A, x);
        printMatrixVectorMultiplication(A, x, y1);

        System.out.println("Multithreaded matrix-vector multiplication implemented as divide-and-conquer:");
        int[] y2 = matrixMultiplication.matVec2(A, x);
        printMatrixVectorMultiplication(A, x, y2);

        System.out.println("Multithreaded matrix-vector multiplication using double parallel loops (wrong):");
        int[] y3 = matrixMultiplication.matVecWrong(A, x);
        printMatrixVectorMultiplication(A, x, y3);

        System.out.println("Multithreaded matrix-matrix multiplication using parallel loops:");
        int[][] C = matrixMultiplication.pSquareMatrixMultiply(A, B);
        printMatrixMatrixMultiplication(A, B, C);

        //race condition example
        System.out.println("Running race condition example");
        RaceCondition raceCondition = new RaceCondition();
        raceCondition.runRaceExample();
    }

    //print matrix-vector multiplication A*x=y
    private static void printMatrixVectorMultiplication(int[][] A, int[] x, int[] y) {
        System.out.println(convert2DArrayToMatrix(A));
        System.out.println("x");
        System.out.println(Arrays.toString(x));
        System.out.println("=");
        System.out.println(Arrays.toString(y));
    }

    //print matrix-matrix multiplication A*B=C
    private static void printMatrixMatrixMultiplication(int[][] A, int[][] B, int[][] C) {
        System.out.println(convert2DArrayToMatrix(A));
        System.out.println("x");
        System.out.println(convert2DArrayToMatrix(B));
        System.out.println("=");
        System.out.println(convert2DArrayToMatrix(C));
    }

    //format 2D array to a matrix string
    private static String convert2DArrayToMatrix(int[][] A) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < A.length - 1; i++) {
            sb.append(Arrays.toString(A[i]));
            sb.append('\n');
        }
        sb.append(Arrays.toString(A[A.length - 1]));
        return sb.toString();
    }
}