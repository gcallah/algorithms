/**
 * Rod Cutting implementation in chapter 15 in the CLRS book.
 * It includes:
 * cutRod: Naive implementation using recursion. Time O(2^n).
 * memoizedCutRod: DP solution using top-down approach: memoize recursive algorithm. Time O(n^2).
 * bottomUpCutRod: DP solution using bottom-up approach: solve the subproblems in size order (smallest subproblems first). Time: O(n^2).
 * printCutRodSolution: prints the optimal solution with size of cuts.
 */

package dynamicprogramming;

public class RodCutting {

    public static void main(String[] args) {
        RodCutting rc = new RodCutting();
        int[] prices = { 1, 5, 8, 9, 10, 17, 17, 20, 24, 30 };

        for (int i = 0; i < prices.length + 1; i++) {
            int max0 = rc.cutRod(prices, i);
            int max1 = rc.memoizedCutRod(prices, i);
            int max2 = rc.bottomUpCutRod(prices, i);
            System.out.printf("recursive max: %d%n", max0);
            System.out.printf("memoized max: %d%n", max1);
            System.out.printf("bottomUp (dp) max: %d%n", max2);
            rc.printCutRodSolution(prices, i);
            System.out.println("----------------");
        }

    }
 
    //Naive version: recursive top-down implementation
    //Time: O(2^n)
    public int cutRod(int[] prices, int n) {
        if (n == 0) {
            return 0;
        }
        int max = Integer.MIN_VALUE;
        for (int i = 0; i < n; ++i) {
            max = Math.max(max, prices[i] + cutRod(prices, n - i - 1));
        }
        return max;
    }

    //Dynamic-programming: top-down approach with memoization
    //Time: O(n^2)
    public int memoizedCutRod(int[] prices, int n) {
        int[] revs = new int[n + 1];//revs[i] corresponds to the maximum revenues of length i. We define revs[0] = 0.
        for (int i = 0; i < revs.length; i++) {
            revs[i] = -1;//we use -1 here to indicate a state that the revs is not cached yet instead of negative infinity in the book because revenue is always nonnegative.
        }
        return memoizedCutRodAux(prices, n, revs);
    }

    private int memoizedCutRodAux(int[] prices, int n, int[] revs) {
        if (revs[n] >= 0) {
            return revs[n];
        }
        int max = Integer.MIN_VALUE;
        if (n == 0) {
            max = 0;
        } else {
            for (int i = 0; i < n; i++) {
                max = Math.max(max, prices[i] + memoizedCutRodAux(prices, n - i - 1, revs));
            }
        }
        revs[n] = max;
        return max;
    }
    
    //Dynamic-programming: bottom-up approach
    //Time: O(n^2)
    public int bottomUpCutRod(int[] prices, int n) {
        int[] revs = new int[n + 1];
        revs[0] = 0;//the revenue of a rod of length 0 is 0.
        int max = Integer.MIN_VALUE;
        for (int j = 1; j <= n; j++) {//revs[j] indicates maximum revenue of a rod of length j.
            max = Integer.MIN_VALUE;
            for (int i = 0; i < j; i++) {
                max = Math.max(max, prices[i] + revs[j - i - 1]);
            }
            revs[j] = max;
        }
        return revs[n];
    }


    public int[][] extendedBottomUpCutRod(int[] prices, int n) {
        int[] revs = new int[n + 1];
        int[] size = new int[n + 1];
        
        revs[0] = 0;
        int max = Integer.MIN_VALUE;
        for (int j = 1; j <= n; j++) {
            max = Integer.MIN_VALUE;
            for (int i = 0; i < j; i++) {
                if (max < prices[i] + revs[j - i - 1]) {
                    max = prices[i] + revs[j - i - 1];
                    size[j] = i + 1;
                }
            }
            revs[j] = max;
        }
        
        //For simplicity, return a 2d array where rs[0] is the revs array, rs[1] is the size array.
        //This may not be the optimized solution but I think it's cumbersome to create a tuple class in Java so I choose to use a 2D array.
        int[][] rs = new int[2][n + 1];
        for (int i = 0; i < n + 1; i++) {
            rs[0][i] = revs[i];
            rs[1][i] = size[i];
        }
        return rs;
    }

    public void printCutRodSolution(int[] prices, int n) {
        int[][] revsAndSize = extendedBottomUpCutRod(prices, n);
        int maxRevenue = revsAndSize[0][n];
        int[] size = revsAndSize[1];
        while (n > 0) {
            System.out.println(size[n]);
            n -= size[n];
        }
        System.out.printf("max revenue: %d%n", maxRevenue);
    }
}