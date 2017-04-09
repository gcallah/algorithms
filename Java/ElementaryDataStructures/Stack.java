import java.util.Arrays;

/**
 * Created by Prashantkumar Patel on 3/30/2017.
 */
public class Stack {


    int[] s;
    int top=-1;

    public Stack(int size){
        s=new int[size];
        top=-1;
    }

    public boolean stackEmpty(){
        return (top==-1);
    }

    public void push(int x) throws Exception{
        if(top==s.length-1){
            throw new Exception("Stack Overflow");
        }
        top=top+1;
        s[top]=x;
    }

    public int pop() throws Exception{
        if(stackEmpty()){
            throw new Exception("Stack Underflow");
        }else {
            top=top-1;
            return s[top+1];
        }
    }

    @Override
    public String toString() {
        return "Stack{" +
                "s=" + Arrays.toString(s) +
                ", top=" + top +
                '}';
    }
}
