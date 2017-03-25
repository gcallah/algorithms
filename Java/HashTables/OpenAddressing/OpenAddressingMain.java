package hashtables.openaddressing;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 * Created by prash on 3/15/2017.
 */
public class OpenAddressingMain {
    public static void main(String[] args){
        LinearProbing linearProbing= new LinearProbing(10);
        System.out.println("Adding Values in hashTable using the Linear Probing");
        for (int i=0;i<10;i++){
            try {
                int k = linearProbing.hashInsert(ThreadLocalRandom.current().nextInt(0, 7));
            }catch (Exception e){
                e.toString();
            }
        }
        System.out.println(linearProbing.toString());

        QuadraticProbing quadraticProbing = new QuadraticProbing(5,10,10);
        System.out.println("Adding Values in hashTable using the Linear Probing");
        for (int i=0;i<10;i++){
            try {
                int k = quadraticProbing.hashInsert(ThreadLocalRandom.current().nextInt(0, 7));
            }catch (Exception e){
                e.toString();
            }
        }
        System.out.println(quadraticProbing.toString());

        DoubleHashing doubleHashing = new DoubleHashing(10);
        System.out.println("Adding Values in hashTable using the Linear Probing");
        for (int i=0;i<10;i++){
            try {
                int k = doubleHashing.hashInsert(ThreadLocalRandom.current().nextInt(0, 7));
            }catch (Exception e){
                e.toString();
            }
        }
        System.out.println(doubleHashing.toString());



    }
}
