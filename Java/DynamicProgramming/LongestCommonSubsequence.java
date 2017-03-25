/**
 * Given two sequences X and Y, a sequence Z is a common subsequence of X and Y if Z is a subsequence of both X and Y.
 * The longest common subsequence problem is to find a maximum-length common subsequence of X and Y.
 *
 * This implementation follows the method using dynamic programming in the CLRS book.
 */

package dynamicprogramming;

public class LongestCommonSubsequence {
    
    public static void main(String[] args) {
        String x = "ABCBDAB";
        String y = "BDCABA";
        
        char[][] b = LCSLength(x.toCharArray(), y.toCharArray());

        System.out.printf("Longest common subsequence of %s and %s is:%n", x, y);
        printLCS(b, x.toCharArray(), x.length(), y.length());
        System.out.printf("%n");

        //prints b table
        System.out.println("b table:");
        for (int i = 1; i <= x.length(); i++) {
            for (int j = 1; j <= y.length(); j++) {
                System.out.printf("%c ", b[i][j]);
            }
            System.out.printf("%n");
        }
    }

    /**
     * Takes as inputs two sequences of x and y.
     * c[i][j] is the length of an LCS of the sequences x[i] and y[j].
     * b[i][j] points to the table entry corresponding to the optimal subproblem solution chosen when computing c[i][j].
     * Here I only return table b as we don't need table c to print the LCS in this case.
     * Time: O(m * n).
     */
    public static char[][] LCSLength(char[] x, char[] y) {
        int m = x.length;
        int n = y.length;
        char[][] b = new char[m + 1][n + 1];
        int[][] c = new int[m + 1][n + 1];
        
        for (int i = 1; i < m + 1; i++) {
            c[i][0] = 0;
        }
        for (int j = 0; j < n + 1; j++) {
            c[0][j] = 0;
        }
        for (int i = 1; i < m + 1; i++) {
            for (int j = 1; j < n + 1; j++) {
                if (x[i - 1] == y[j - 1]) {
                    c[i][j] = c[i - 1][j - 1] + 1;
                    b[i][j] = '\\';
                } else if (c[i - 1][j] >= c[i][j - 1]) {
                    c[i][j] = c[i - 1][j];
                    b[i][j] = '|';
                } else {
                    c[i][j] = c[i][j - 1];
                    b[i][j] = '-';
                }
            }
        }
        return b;
    }

    /**
     * Prints an LCS of x and y.
     * Time: O(m + n), where m, n is the length of the sequence x and y respectively.
     */
    public static void printLCS(char[][] b, char[] x, int i, int j) {
        if (i == 0 || j == 0) {
            return;
        }
        if (b[i][j] == '\\') {
            printLCS(b, x, i - 1, j - 1);
            System.out.print(x[i - 1]);
        } else if (b[i][j] == '|') {
            printLCS(b, x, i - 1, j);
        } else {
            printLCS(b, x, i, j - 1);
        }
    }
}