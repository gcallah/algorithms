/**
 * Created by Zebin Xu on 8/22/17.
 */

package MultithreadedAlgorithms.tests;

import static org.junit.Assert.assertArrayEquals;
import org.junit.Test;
import MultithreadedAlgorithms.MatrixMultiplication;

public class MatrixMultiplicationTest {

    private static final int[][] A = {
        {1, 2, 3},
        {3, 2, 1},
        {2, 2, 2}
    };
    private static final int[][] B = {
        {1, 2, 3},
        {3, 2, 1},
        {2, 2, 2}
    };
    private static final int[][] C = {
        {13, 12, 11},
        {11, 12, 13},
        {12, 12, 12}
    };

    private static final int[] x = {1, 2, 3};
    private static final int[] y = {14, 10, 12};

    @Test public void testMatVec() {
        MatrixMultiplication matrixMultiplication = new MatrixMultiplication();
        assertArrayEquals(matrixMultiplication.matVec(A, x), y);
    }

    @Test public void testMatVec2() {
        MatrixMultiplication matrixMultiplication = new MatrixMultiplication();
        assertArrayEquals(matrixMultiplication.matVec2(A, x), y);
    }

    @Test public void testPSquareMatrixMultiply() {
        MatrixMultiplication matrixMultiplication = new MatrixMultiplication();
        assert2DArrayEquals(matrixMultiplication.pSquareMatrixMultiply(A, B), C);
    }
    
    // test 2D arrays equals
    private void assert2DArrayEquals(final int[][] A, final int[][] B) {
        for (int i = 0; i < A.length; i++) {
            assertArrayEquals(A[i], B[i]);
        }
    }
}