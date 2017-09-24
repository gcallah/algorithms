package hashtables;

/**
 * Created by Prashant.
 * We are using LinkedList to store the individual members of Hashmap.
 * Each LinkedList has the "next" element which stores the chain of values having same keys,Which is necessary for
 * resolving collision
 */
public class Node {
    private String key;
    private double value;
    private Node next;

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

    public Node getNext(){
        return next;
    }
    public void setNext(Node next){
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
