/**
 * Implementation of the optimal binary search tree problem using dynamic programming following the CLRS book.
 */

package dynamicprogramming;

public class OptimalBinarySearchTrees {

    public static void main(String[] args) {
        double[] p = {0.00, 0.15, 0.10, 0.05, 0.10, 0.20};
        double[] q = {0.05, 0.10, 0.05, 0.05, 0.05, 0.10};
        int n = p.length - 1;
        double[][] e = optimalBST(p, q, n);
        System.out.printf("The expected search cost of an optimal BST: %f%n", e[1][n]);
    }

    /**
     * p is the probability sequence of p1, ..., pn corresponding to keys k1 to kn. 
     * q is the probability sequence of q0, ..., qn corresponding to dummny keys d0 to dn.
     * n is the number of keys in the BST.
     * e[i][j] is the expected cost of searching an optimal BST containing the keys ki, ..., kj.
     * w[i][j] is the sum of probabilities of a subtree with keys ki, ... kj.
     * root[i][j] is the index r for which kr is the root of an optimal BST containing ki, ..., kj.
     * Here we only return e for simplicity.
     */
    public static double[][] optimalBST(double[] p, double[] q, int n) {
        double[][] e = new double[n + 2][n + 1];
        double[][] w = new double[n + 2][n + 1];
        int[][] root = new int[n][n];

        for (int i = 1; i < n + 2; i++) {
            e[i][i - 1] = q[i - 1];
            w[i][i - 1] = q[i - 1];
        }
        for (int len = 1; len < n + 1; len++) {
            for (int i = 1; i < n - len + 2; i++) {
                int j = i + len - 1;
                e[i][j] = Integer.MAX_VALUE;
                w[i][j] = w[i][j - 1] + p[j] + q[j];
                for (int r = i; r < j + 1; r++) {
                    double t = e[i][r - 1] + e[r + 1][j] + w[i][j];
                    if (t < e[i][j]) {
                        e[i][j] = t;
                        root[i - 1][j - 1] = r;
                    }
                }
            }
        }
        return e;
    }
}