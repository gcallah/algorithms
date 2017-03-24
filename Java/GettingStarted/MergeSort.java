package gettingstarted;

import java.util.Arrays;
import java.util.Scanner;

/*
 * Written By Prashant Patel
 */

//Merge Sort implementation in Java.
public class MergeSort {
    

    /*
     * Input:
     *      @param1: Integer Array
     * Output:
     *      Sorted Integer Array (Ascending Order)
     */
	
	   public int[] sort(int[] array){
	        mergeSort(array, 0, array.length - 1);
	        return array;
	    }

	  
	    /*
	     * Input:
	     *      @param1: Integer Array
	     *      @param2: Starting Index
	     *      @param3: Ending Index
	     *
	     * Output:
	     *      Sorted Integer Array (Ascending Order)
	     */
	   
	    private void mergeSort(int[] array, int p, int r){
	        if(p < r){
	            int q = (p + r) / 2;
	            mergeSort(array, p, q);
	            mergeSort(array, q + 1, r);
	            merge(array, p, q, r);
	        }
	    }

	  

        /*
         * Input:
         *      @param1:Integer Array
         *      @param2:Starting Index
         *      @param3:Middle Index
         *      @param4:Ending Index
         *
         * Output:
         *      Merger Array;
         */
	    private void merge(int[] array, int p, int q, int r){
	    	/*
	    	 * The Book assumes that array index starts from 1 
	    	 * but instead in Java it stars from 0. So we have made
	    	 * some changes in the code.
	    	 */
	        int n1 = q - p + 1;
	        int n2 = r - q;
	        int[] left = new int[n1 + 1];
	        int[] right = new int[n2 + 1];

	        for(int i = 0; i < n1; i++){
	            left[i] = array[p + i];
	        }

	        for(int j = 0; j < n2; j++){
	            right[j] = array[q + j + 1];
	        }

	        left[n1] = Integer.MAX_VALUE;
	        right[n2] = Integer.MAX_VALUE;

	        int i=0;
	        int j=0;
	        for(int k = p; k <= r; k++){
	            if(left[i] <= right[j]){
	                array[k] = left[i++];
	            }else{
	                array[k] = right[j++];
	            }
	        }
	    }

	    
	    public static void main(String[] args){
	    	MergeSort sort=new MergeSort();
	    	System.out.println("Enter the number of elements you want to sort = ");
	    	Scanner s=new Scanner(System.in);
	    	int n=s.nextInt();
	    	int A[]=new int[n];
	    	System.out.println("Please enter all those "+n+" numbers (space seperated )");
	    	for(int i=0;i<n;i++){
	    		A[i]=s.nextInt();
	    	}
	    	s.close();
	    	System.out.println("Now the sorted sequence is:");
	    	sort.sort(A);
	    	System.out.println(Arrays.toString(A));
	    	
	    }
	
}
