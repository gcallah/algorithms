package hashtables;

import HashTable.Node;
/**
 * Created by Prashant on 9/30/2016.
 * The Hash function which we are using in this program is as follows:
 * Suppose we are having the key,value pairs such as shown below:
 *  KEY  =   VALUE
 * "NAME"="PHONE_NUMBER"
 * The hash function is very simple and easy to understand that is why we used it in this program.
 * Here NAME is the Key and PHONE_NUMBER is the Value.
 * Inorder to map the keys to the HashTable we will be using the following logic for the hashfunction.
 * HashLogic:
 * We will map the First Letter of the "Key" with its alphabetical index and then store in it the
 * table[index].
 * For example,
 * NAME="Prashant"
 * First Letter is ="P"
 * alphabetical index =15.
 * We will store the data as
 *
 * Table[index]={["Prashant"]<->["PHONE_NUMBER"]}
 * ***********************************Collision Removal with Chaining*****************************************
 * Now for the collision suppose we have another value called "Patrick"<->"PHONE_NUMBER"
 * Both of these Keys "Prashant" and "Patrick" will point to the same location.
 *
 * Table[index]= {["Prashant"]<->["PHONE_NUMBER"],["Patrick"]<->["PHONE_NUMBER]}
 *
 * We are resolving the chain collision in both get(key) and remove(key) function.
 */
public class HashMap {

    private int TABLE_SIZE=26;
    Node[] table;

    public HashMap(){
        table=new Node[TABLE_SIZE];
        for(int i=0;i<TABLE_SIZE;i++){
            table[i]=null;
        }
    }

    public int getAlphaIndex(String name){
        char firstLetter=name.charAt(0);
        char first_lowercase=Character.toLowerCase(firstLetter);
        int temp_index=(int)first_lowercase;
        int temp=96;
        if(temp<=122 & temp>=97) {
            return (temp_index - temp);
        }
        return 0;
    }

    public double get(String key) {
        int hash = getAlphaIndex(key);
        if (table[hash] == null)
            return -1;
        else {
            Node entry = table[hash];
            while (entry != null && entry.getKey() != key)
                entry = entry.getNext();
            if (entry == null)
                return -1;
            else
                return entry.getValue();
        }
    }

    public void put(String key,double value){
        int hash = getAlphaIndex(key);
        if (table[hash] == null)
            table[hash] = new Node(key, value);
        else {
            Node entry = table[hash];
            while (entry.getNext() != null && entry.getKey() != key)
                entry = entry.getNext();
            if (entry.getKey() == key)
                entry.setValue(value);
            else
                entry.setNext(new Node(key, value));
        }

    }

    public void remove(String key) {
        int hash = getAlphaIndex(key);
        if (table[hash] != null) {
            Node prevEntry = null;
            Node entry = table[hash];
            while (entry.getNext() != null && entry.getKey() != key) {
                prevEntry = entry;
                entry = entry.getNext();
            }
            if (entry.getKey() == key) {
                if (prevEntry == null)
                    table[hash] = entry.getNext();
                else
                    prevEntry.setNext(entry.getNext());
            }
        }
    }
}
