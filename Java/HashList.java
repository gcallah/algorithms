/**
 * Q3: Write code to resolve collision with chaining
 *
 * Created by Prashant,Jatri,Abhishek,Durvesh on 9/30/2016.
 * We are using LinkedList to store the individual members of Hashmap.
 * Each LinkedList has the "next" element which stores the chain of values having same keys,Which is necessary for
 * resolving collision
 *
 */
public class HashList {
    private String key;
    private double value;
    private HashList next;

    public HashList(String key,double value){
        this.key=key;
        this.value=value;
    }

    public double getValue(){
        return value;
    }

    public void setValue(double value){
        this.value=value;
    }

    public String getKey(){
        return key;
    }

    public void setKey(String key){
        this.key=key;
    }

    public HashList getNext(){
        return next;
    }
    public void setNext(HashList next){
        this.next=next;
    }

    @Override
    public String toString() {
        return "HashList{" +
                "key='" + key + '\'' +
                ", value=" + value +
                '}';
    }
}
