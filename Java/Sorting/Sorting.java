package Sorting;

/**
 * Created by Prashant on 1/26/2017.
 * Will add documentation later
 */
public class Sorting {

    int[] A;

    public Sorting(){
        A=null;
    }

    public int[] insetionSort(int[] A){
        this.A= A;
        int i;
        int key;
        for(int j=1; j<A.length;j++){
            key=A[j];
            i=j-1;
            while (i>-1 && A[i] > key){
                A[i+1]=A[i];
                i=i-1;
            }
            A[i+1]=key;
        }
        return A;
    }

    public int[] mergeSort(int[] A, int p,int r) {
        this.A = A;
        int q;
        if (p < r) {
            q = (int) Math.floor((p + r) / 2);
            mergeSort(A, p, q);
            mergeSort(A, q + 1, r);
            A=merge(A, p, q, r);
        }
        return A;
    }

    public int[] merge(int[] A,int p,int q,int r){
        int n1=q-p+1;
        int n2=r-q;
        int[] L=new int[n1+1];
        int[] R=new int[n2+1];

        for (int i=0;i<n1;i++){
            L[i]=A[p+i-1];
        }
        for(int j=0;j<n2;j++){
            R[j]=A[q+j];
        }
        L[n1]=Integer.MAX_VALUE;
        L[n2]=Integer.MAX_VALUE;
        int i=1;
        int j=1;

        for(int k=p;k<r;k++){
            if(L[i]<=R[j]){
                A[k]=L[i];
                i=i+1;
            }
            else if(A[k]==R[j]){
                j=j+1;
            }
        }
        return A;
    }





    public static void main(String[] args){
        int[] A={5,4,3,2,1};
        Sorting s=new Sorting();
        //A=s.insetionSort(A);
        A=s.mergeSort(A,1,A.length);
        for (int i=0;i<A.length;i++){
            System.out.println(A[i]+" ");
        }
    }



}
