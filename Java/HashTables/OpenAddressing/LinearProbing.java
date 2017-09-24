/**
 * Created by prashant on 3/15/2017.
 */

package hashtables.openaddressing;

public class LinearProbing extends OpenAddressing {

    /**
    *Created the Linear Probing class which extends the OpenAddressing Class
    *According to the textbook the hash function for the Linear Probing is
    * h(k,i) = (h'(k)+ i) mod m;
    * for the h'(k) we will use Java's default hash function that is hashCode().
    * Although we can use any has function we want.
    */

    public LinearProbing(int size){
        super(size);
    }

    /**
     *
     * @param k : Key which is to be hashed.
     * @param i : Index
     * @return : Hash value
     */
    @Override
    int hash(Object k, int i) {
        return (k.hashCode()+ i) % size;
    }
}
