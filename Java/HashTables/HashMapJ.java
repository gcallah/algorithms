/**
 * Created by Prashant on 9/30/2016.
 * The Hash function which we are using is this program is as follows:
 * Suppose we are having the key,value pairs like this:
 *  KEY  =   VALUE
 * "NAME"="PHONE_NUMBER"
 *
 * Here Name is the Key and PHONE_NUMBER is the Value.
 * Inorder to map the keys to the HashTable we will be using the following logic for the hashfunction.
 *
 * HashLogic:
 * We will map the First Letter of the "Key" with its alphabetical index and then store in it the
 * table[index].
 * For example,
 * NAME="Pratham"
 * First Letter is ="P"
 * alphabetical position =15.
 * We will store the data as
 *
 * Table[index]={["Prashant"]<->["PHONE_NUMBER"]}
 * ***********************************Collision Removal with Chaining*****************************************
 * Now for the collision suppose we have another value called "Pratham"<->"PHONE_NUMBER"
 * Both of these Keys "Prashant" and "Pratham" will point to the same location.
 *
 * Table[index]= {["Prashant"]<->["PHONE_NUMBER"],["Pratham"]<->["PHONE_NUMBER]}
 *
 * The way we resolve the collision is,when we have the collision we will traverse the
 * linked list and when we find the appropriate key we will use that node of the linked list
 * as the result to either get the data or delete the data
 *
 * We are resolving the chain collision in both get(key) and remove(key) function.
 *
 *
 */
public class HashMapJ {

    private int TABLE_SIZE=26;
    HashList[] hashListTable;

    public HashMapJ(){
        hashListTable=new HashList[TABLE_SIZE];
        for(int i=0;i<TABLE_SIZE;i++){
            hashListTable[i]=null;
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
        if (hashListTable[hash] == null)
            return -1;
        else {
            HashList entry = hashListTable[hash];
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
        if (hashListTable[hash] == null)
            hashListTable[hash] = new HashList(key, value);
        else {
            HashList entry = hashListTable[hash];
            while (entry.getNext() != null && entry.getKey() != key)
                entry = entry.getNext();
            if (entry.getKey() == key)
                entry.setValue(value);
            else
                entry.setNext(new HashList(key, value));
        }

    }

    public void remove(String key) {
        int hash = getAlphaIndex(key);
        if (hashListTable[hash] != null) {
            HashList prevEntry = null;
            HashList entry = hashListTable[hash];
            while (entry.getNext() != null && entry.getKey() != key) {
                prevEntry = entry;
                entry = entry.getNext();
            }
            if (entry.getKey() == key) {
                if (prevEntry == null)
                    hashListTable[hash] = entry.getNext();
                else
                    prevEntry.setNext(entry.getNext());
            }
        }
    }
}
