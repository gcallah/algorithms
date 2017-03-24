/*
 * Written By Prashant Patel
 */

package gettingstarted;

import java.util.Scanner;

//The insertionSort implementation in Java.
public class InsertionSort {

	int A[];
	    public InsertionSort(){
	    	A=null;
	    }
	    /*
	     * Input:
	     * 		Integer Array.
	     * Output:
	     * 		Sorted Integer Array (Ascending Order)
	     */
	    public int[] insertionSort(int[] A){
	    	
	    	this.A=A;
	        int i;
	        int key;
	        /*
	         * The Book starts index from 1 that is why they start the loop from
	         * 2, but in Java the array index starts the loop from 0 that is why we 
	         * start the loop from 1 instead of 2. 
	         */
	        
	        for(int j=1; j<A.length;j++){
	            key=A[j];
	            i=j-1;
	            
	            /*
	             * Because of the same reason mentioned in the above comment we use the "-1"
	             * instead of "0" used in the book.
	             *
	             */
	            while (i>-1 && A[i] > key){
	                A[i+1]=A[i];
	                i=i-1;
	            }
	            A[i+1]=key;
	        }
	        return A;
	    }
	    
	    public static void printArray(int[] array){
	    	for (int i=0;i<array.length;i++){
	    		System.out.print(array[i]+" ");
	    	}
	    }

	    public static void main(String[] args){
	    	InsertionSort sort=new InsertionSort();
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
	    	int sortedArray[]=new int[n];
	    	sortedArray=sort.insertionSort(A);
	    	printArray(sortedArray);
	    }



}
