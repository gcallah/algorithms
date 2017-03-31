import java.util.Arrays;

/**
 * Created by Prashantkumar Patel on 3/30/2017.
 */
public class Queue {

    int q[];
    int head;
    int tail;

    public Queue(int size){
        q=new int[size];
        head=0;
        tail=0;
    }

    public void enqueue(int x){
        q[tail]=x;

        if(tail==q.length-1){
            tail=0;
        }else {
            tail=tail+1;
        }
    }

    public int dequeue(){
        int x=q[head];

        if(head==q.length-1){
            head=0;
        }else {
            head=head+1;
        }

        return x;
    }


    @Override
    public String toString() {
        return "Queue{" +
                "q=" + Arrays.toString(q) +
                ", head=" + head +
                ", tail=" + tail +
                '}';
    }
}
