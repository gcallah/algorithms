/**
 * Dynamic-programming method to determine the optimal parenthesization of a matrix chain with the minimal number of scalar multiplications.
 */

public class MatrixChainMultiplication {

    public static void main(String[] args) {
        int[] dimens = {30, 35, 15, 5, 10, 20, 25};
        int[][][] costsAndIndices = matrixChainOrder(dimens);
        printOptimalParens(costsAndIndices[1], 0, dimens.length - 2);
        System.out.printf("%n");
    }

    /**
     * p is a sequence of matrix's dimensions such that the dimension of Matrix A[i] is p[i] x p[i + 1]. (A[0] refers to matrix A1)
     * For example, p = {30, 35, 15, 5, 10, 20, 25}, then the dimension of A[0] to A[5] is 30x35, 35x15, 15x5, 5x10, 10x20, 20x25 respectively.
     *
     * Returns a 3d array represent the lists of costs and indices.
     */
    public static int[][][] matrixChainOrder(int[] p) {
        int n = p.length - 1;
        int[][] costs = new int[n][n];//For simplicity, assume the maximum cost do not exceed 2^31 - 1.
        int[][] indices = new int[n][n];
        for (int i = 0; i < n; i++) {
            costs[i][i] = 0;
        }

        for (int len = 2; len < n + 1; len++) {//len is the chain length
            for (int i = 0; i < n - len + 1; i++) {
                int j = i + len - 1;
                costs[i][j] = Integer.MAX_VALUE;
                for (int k = i; k < j; k++) {
                    int q = costs[i][k] + costs[k + 1][j] + p[i] * p[k + 1] * p[j + 1];
                    if (q < costs[i][j]) {
                        costs[i][j] = q;
                        indices[i][j] = k;
                    }
                }
            }
        }
        
        int[][][] costsAndIndices = new int[2][n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                costsAndIndices[0][i][j] = costs[i][j];
                costsAndIndices[1][i][j] = indices[i][j];
            }
        }
        return costsAndIndices;
    }

    /**
     * Prints the optimal parenthesization.
     *
     * i, j is 0-base indices while the output matrix's subscript is 1-base.
     */
    public static void printOptimalParens(int[][] indcies, int i, int j) {
        if (i == j) {
            System.out.printf("A%d", i + 1);//convert to 1-base index for display
        } else {
            System.out.print("(");
            printOptimalParens(indcies, i, indcies[i][j]);
            printOptimalParens(indcies, indcies[i][j] + 1, j);
            System.out.print(")");
        }
    }
}
