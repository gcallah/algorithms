public class Main {

    public static void main(String[] args) {


        Stack stack=new Stack(10);
        try {
            stack.push(10);
            stack.push(15);
            stack.push(30);
            stack.push(29);
            stack.push(98);
            stack.push(12);
            stack.push(34);

            System.out.println(stack.toString());

            System.out.println("Poped Item = "+stack.pop());
            System.out.println("Poped Item = "+stack.pop());
            System.out.println("Poped Item = "+stack.pop());
            System.out.println("Poped Item = "+stack.pop());

            System.out.println(stack.toString());
        }catch (Exception e){
            System.out.println(e);
        }


        Queue queue=new Queue(10);
        queue.enqueue(2);
        queue.enqueue(5);
        queue.enqueue(7);
        queue.enqueue(9);
        System.out.println("Dqueue: "+queue.dequeue());
        System.out.println("Dqueue: "+queue.dequeue());
        System.out.println("Dqueue: "+queue.dequeue());
        System.out.println(queue.toString());

    }
}
