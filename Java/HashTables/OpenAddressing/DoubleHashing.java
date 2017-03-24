/**
 * Created by prashant on 3/15/2017.
 */

package hashtables.openaddressing;

public class DoubleHashing extends OpenAddressing {

    public DoubleHashing(int size){
        super(size);
    }
    /**
     *
     * @param key: key fot hashfunction (h1)
     * @return integer hash index
     */
    public int h1(Object key){
        return key.hashCode();
    }

    /**
     *
     * @param key : key for the hashfunction (h2)
     * @return integer hash index
     */
    public int h2(Object key){
       return 1+key.hashCode();
    }


    /**
     *
     * @param k : Key to be hashed
     * @param i : index
     * @return the hash value
     */
    @Override
    int hash(Object k, int i) {
        return ((h1(k)+i*h2(k))%size);
    }
}
