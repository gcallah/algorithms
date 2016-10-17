/**
 * Created by Prashant on 9/30/2016.
 * As you can see in this program we have resolved the collision using chaining for two values
 * "Prashant" and "Pratham"
 */
public class HashMapImplementation {

    public static void main(String[] args){

        HashMapJ j=new HashMapJ();
        j.put("Durvesh",Double.parseDouble("3474797289"));
        j.put("Prashant",Double.parseDouble("2012682695"));
        j.put("Abhishek",Double.parseDouble("9620730629"));
        j.put("Jatri",Double.parseDouble("9428246656"));
        j.put("Pratham",Double.parseDouble("3474798289"));
        double phone_no_prashant=j.get("Prashant");
        double phone_no_pratham=j.get("Pratham");
        System.out.println("We are haiving collision with following two values but It will be resolved and we will get the correct output");

        System.out.println("Key= Prashant"+" Value ="+String.valueOf(phone_no_prashant));
        System.out.println("Key= Pratham"+" Value ="+String.valueOf(phone_no_pratham));
    }

}
