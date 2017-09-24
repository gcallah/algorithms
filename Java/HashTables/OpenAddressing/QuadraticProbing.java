/**
 * Created by prashant on 3/15/2017.
 */

package hashtables.openaddressing;

public class QuadraticProbing extends OpenAddressing {

    private int c1;
    private int c2;

    public QuadraticProbing(int c1,int c2,int size){
        super(size);
        this.c1=c1;
        this.c2=c2;
    }

    /**
     *
     * @param k : Key to be hashed
     * @param i : index
     * @return the hash value
     */
    @Override
    int hash(Object k, int i) {
        return ((k.hashCode() + c1*i +c1*i*i) % size);
    }
}
