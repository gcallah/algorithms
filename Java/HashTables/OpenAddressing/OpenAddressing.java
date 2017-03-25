package hashtables.openaddressing;

import java.util.Arrays;

/**
 * Created by prashant on 3/15/2017.
 * Abstract class for the HashTables that uses the open addressing.
 * All the hash methods such as (i) Linear Hashing, (ii) Quadratic Hashing and (iii) Double Hashing will use this class
 * as the base class.
 * <code> Insert </code>
 * <code> Search </code>
 * above mentioned methods will be implemented here.
 */
public abstract class OpenAddressing {

    //This is the Hash Table.
    private Comparable[] T;

    //Size of the Hash Table
    protected int size;

    //Constructor which initializes the table based on the given input size
    public OpenAddressing(){}
    public OpenAddressing(int size){
        this.size = size;
        T = new Comparable[size];
        for (Comparable t:T) {
            t=null;
        }
    }

    abstract int hash(Object k,int i);

    /**
    *Insert an element into the Hash Table
    *@param  k = The element to insert in the table.
    *@return j = Index where the element is inserted.
    *@Exception: Hastable Overflow.
    */

    public int hashInsert(Comparable k) throws Exception{
        int i=0;
        do{
            int j = hash(k,i);
            if(T[j]==null){
                T[j]=k;
                return j;
            }else{
                i=i+1;
            }
        } while (i<size);

        throw new Exception("HashTables overflow");
    }


    /**
     *Insert an element into the Hash Table
     *@param  k = The element to insert in the table.
     *@return j = Index where the element is inserted.
     *@Exception: Hastable Overflow.
     */
    public int hashSearch(Comparable k){
        int i=0;
        int j=0;
        do{
            j=hash(k,i);
            if(T[j] == k){
                return j;
            }
            i=i+1;
        }
        while (T[j]== null || i < size);
        return -1;
    }

    @Override
    public String toString() {
        return "OpenAddressing{" +
                "T=" + Arrays.toString(T) +
                ", size=" + size +
                '}';
    }
}
