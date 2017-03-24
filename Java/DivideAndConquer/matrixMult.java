/**
 * Created by Prashantkumar Patel on 11/11/2016.
 */

package divideandconquer;

public class matrixMult {

    public static void main(String[] args) {

        //Input Matrix A and B
        int a[][] = {{1, 2,3,4},{1, 2,3,4},{1, 2,3,4},{1,2,3,4}};
        int b[][] = {{1, 2,3,4},{1, 2,3,4},{1, 2,3,4},{1,2,3,4}};
        //OutPut Matrix C
        int c[][] = new int[4][4];
        //Calling strassen's Algorithm
        c = strassen(a, b);
        //Printing the results
        System.out.println("A Matrix is:");
        printMatrix(a);
        System.out.println("B Matrix is:");
        printMatrix(b);
        System.out.println("Result C Matrix is:");
        printMatrix(c);

    }

    public static int[][] strassen(int a[][], int b[][]) {
        /*
            I have tried to replicate the algorithm from the book.
 
            Input:
                Matrix A and B

            Output:
                Resultant Matrix c
       */
        int n = a.length;
        int[][] c = new int[n][n];
        int newsize = n / 2;

        if (n == 1) {
            c[0][0] = a[0][0] * b[0][0];
        } else {

        int[][] a11 = new int[newsize][newsize];
        int[][] a12 = new int[newsize][newsize];
        int[][] a21 = new int[newsize][newsize];
        int[][] a22 = new int[newsize][newsize];

        int[][] b11 = new int[newsize][newsize];
        int[][] b12 = new int[newsize][newsize];
        int[][] b21 = new int[newsize][newsize];
        int[][] b22 = new int[newsize][newsize];
        int[][] s1 = new int[newsize][newsize];
        int[][] s2 = new int[newsize][newsize];
        int[][] s3 = new int[newsize][newsize];
        int[][] s4 = new int[newsize][newsize];
        int[][] s5 = new int[newsize][newsize];
        int[][] s6 = new int[newsize][newsize];
        int[][] s7 = new int[newsize][newsize];
        int[][] s8 = new int[newsize][newsize];
        int[][] s9 = new int[newsize][newsize];
        int[][] s10 = new int[newsize][newsize];
        int[][] p1 = new int[newsize][newsize];
        int[][] p2 = new int[newsize][newsize];
        int[][] p3 = new int[newsize][newsize];
        int[][] p4 = new int[newsize][newsize];
        int[][] p5 = new int[newsize][newsize];
        int[][] p6 = new int[newsize][newsize];
        int[][] p7 = new int[newsize][newsize];
        for (int i = 0; i < newsize; i++) {
            for (int j = 0; j < newsize; j++) {
                a11[i][j] = a[i][j];
                a12[i][j] = a[i][j + newsize];
                a21[i][j] = a[i + newsize][j];
                a22[i][j] = a[i + newsize][j + newsize];
                b11[i][j] = b[i][j];
                b12[i][j] = b[i][j + newsize];
                b21[i][j] = b[i + newsize][j];
                b22[i][j] = b[i + newsize][j + newsize];
            }
        }
        s1 = subtract(b12, b22);
        s2 = add(a11, a12);
        s3 = add(a21, a22);
        s4 = subtract(b21, b11);
        s5 = add(a11, a22);
        s6 = add(b11, b22);
        s7 = subtract(a12, a22);
        s8 = add(b21, b22);
        s9 = subtract(a11, a21);
        s10 = add(b11, b12);
        p1 = strassen(a11, s1);
        p2 = strassen(s2, b22);
        p3 = strassen(s3, b11);
        p4 = strassen(a22, s4);
        p5 = strassen(s5, s6);
        p6 = strassen(s7, s8);
        p7 = strassen(s9, s10);
        int[][] c11 = new int[newsize][newsize];
        int[][] c12 = new int[newsize][newsize];
        int[][] c21 = new int[newsize][newsize];
        int[][] c22 = new int[newsize][newsize];

        c12 = add(p1, p2);
        c21 = add(p3, p4);
        int[][] result1 = new int[newsize][newsize];
        result1 = add(p5, p4);
        int[][] result2 = new int[newsize][newsize];
        result2 = add(result1, p6);
        c11 = subtract(result2, p2);
        result1 = add(p5, p1);
        result2 = subtract(result1, p3);
        c22 = subtract(result2, p7);


            for (int i = 0; i < newsize; i++) {
                for (int j = 0; j < newsize; j++) {
                    c[i][j] = c11[i][j];
                    c[i][j + newsize] = c12[i][j];
                    c[i + newsize][j] = c21[i][j];
                    c[i + newsize][j + newsize] = c22[i][j];
                }
            }

        }
            return c;
    }

    private static int[][] add(int[][] A, int[][] B) {
        int n = A.length;
        int[][] C = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                C[i][j] = A[i][j] + B[i][j];
            }
        }
        return C;
    }

    private static int[][] subtract(int[][] A, int[][] B) {
        int n = A.length;
        int[][] C = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                C[i][j] = A[i][j] - B[i][j];
            }
        }
        return C;
    }

    public static void printMatrix(int[][] mat){
        for(int i=0;i<mat.length;i++){
            System.out.println();
            for(int j=0;j<mat.length;j++){
                System.out.print(mat[i][j]+" ");
            }
        }
        System.out.println();
    }
}
