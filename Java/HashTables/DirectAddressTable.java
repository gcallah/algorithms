package hashtables;

import java.util.Scanner;

/**
 * Created by Prashant on 2/16/2017.
 */
public class DirectAddressTable {
    private Item[] table;
    private int capacity;

    //Default Constructor
    public DirectAddressTable() {
    }

    //The table holds the array of class Item
    class Item{
        int key;
        int value;

        //Default Constructor
        public Item(){
            key=0;
            value=0;
        }

        //Parametrized Constructor
        public Item(int key,int value){
            this.key=key;
            this.value=value;
        }

        public Item(int key){
            this.key=key;
        }

        @Override
        public String toString() {
            return "Item{" +
                    "key=" + key +
                    '}';
        }
    }
    //Get method
    public Item[] getTable() {
        return table;
    }
    //Set method
    public void setTable(Item[] table) {
        this.table = table;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    /**
    * Note: You might notice that the method signtaure of below methods are different than the one showed in the
    * book. That is because we are using table (T[]) as a class variable. The essential part logic and implementation
    * details are same.
    */
    public DirectAddressTable(int capacity){
        this.capacity=capacity;
        table=new Item[capacity+1];
    }

      /*
    input:
        @param1 : Item to be searched
    output:
        Item returned
     */
    public Item DirectAddressSearch(Item x){
        return table[x.key];
    }

    /*
    input:
        @param1 : Item to be Insert in the table
     */
    public void DirectAddressInsert(Item x){
        table[x.key]=x;
    }

    /*
    input:
        @param2 : Item to be delete in the table
     */
    public void DirectAddressDelete(Item x){
        table[x.key]=null;
    }
    /*
    prints the DirectAddress Table
     */
    public void printTable(){
        System.out.println("\nDirect Addressing Table : ");
        int l = table.length;
        for (int i = 0; i < l; i++)
            if (table[i] != null)
                System.out.println(i +" "+ table[i]);
        System.out.println();
    }

    //main method with example input.
    public static void main(String[] args){
        DirectAddressTable directAddressTable =new DirectAddressTable(10);
        Scanner scan = new Scanner(System.in);
        System.out.println("Direct Addressing Table Test\n\n");
        char ch;
        do
        {
            System.out.println("\nDirect Addressing Table Operations\n");
            System.out.println("1. insert ");
            System.out.println("2. remove");
            System.out.println("3. get");
            int choice = scan.nextInt();
            switch (choice)
            {
                case 1 :
                    System.out.println("Enter int key");
                    directAddressTable.DirectAddressInsert(directAddressTable.new Item(scan.nextInt()));
                    directAddressTable.printTable();
                    break;
                case 2 :
                    System.out.println("Enter int key");
                    directAddressTable.DirectAddressDelete( directAddressTable.new Item(scan.nextInt()) );
                    directAddressTable.printTable();
                    break;
                case 3 :
                    System.out.println("Enter int key");
                    System.out.println("Value = "+ directAddressTable.DirectAddressSearch(directAddressTable.new Item( scan.nextInt() )));
                    directAddressTable.printTable();
                    break;
                default :
                    System.out.println("Invalid input \n ");
                    break;
            }
            System.out.println("\nDo you want to continue (Type y or n) \n");
            ch = scan.next().charAt(0);
        } while (ch == 'Y'|| ch == 'y');
    }

}
