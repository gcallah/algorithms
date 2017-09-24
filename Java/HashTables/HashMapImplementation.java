package hashtables;

/**
 * Created by Prashant
 * As you can see in this program we have resolved the collision using chaining for two values
 * "Prashant" and "Patrick"
 */
public class HashMapImplementation {

    public static void main(String[] args){

        HashMap map=new HashMap();
        map.put("Nanda",Double.parseDouble("3474797289"));
        map.put("Prashant",Double.parseDouble("2012682695"));
        map.put("Patrick",Double.parseDouble("3474798289"));
        double phone_no_prashant=map.get("Prashant");
        double phone_no_patrick=map.get("Patrick");
        System.out.println("We are haiving collision with following two values but It will be resolved and we will get the correct output");
        System.out.println("Key= Prashant"+" Value ="+String.valueOf(phone_no_prashant));
        System.out.println("Key= Patrick"+" Value ="+String.valueOf(phone_no_patrick));
    }

}
