package LinkedList;

/**
 * Created by prashant on 5/21/2017.
 */

public class LinkedList {

    Node head;

    public void printLinkedList(){
        Node n=head;
        while (n!=null){
            System.out.println(n.data);
            n=n.next;
        }
        System.out.println("Length="+this.length());
    }

    public void insertAfter(Node prevNode,int data){

        if(prevNode==null){
            System.out.println("Previous Node can not be null");
        }
        Node nNode=new Node(data);
        nNode.next=prevNode.next    ;
        prevNode.next=nNode;
    }

    public void swapNodes(int x,int y){

        if (x == y) return;
        // Search for x (keep track of prevX and CurrX)
        Node prevX = null, currX = head;
        while (currX != null && currX.data != x)
        {
            prevX = currX;
            currX = currX.next;
        }

        // Search for y (keep track of prevY and currY)
        Node prevY = null, currY = head;
        while (currY != null && currY.data != y)
        {
            prevY = currY;
            currY = currY.next;
        }

        // If either x or y is not present, nothing to do
        if (currX == null || currY == null)
            return;

        // If x is not head of linked list
        if (prevX != null)
            prevX.next = currY;
        else //make y the new head
            head = currY;

        // If y is not head of linked list
        if (prevY != null)
            prevY.next = currX;
        else // make x the new head
            head = currX;

        // Swap next pointers
        Node temp = currX.next;
        currX.next = currY.next;
        currY.next = temp;
    }

    public void deleteNode(int key){
        //Case:1=What if the head Node.data==key;
        //Case:2= Normal Delete;
        //Case:3= Delete at end;
        //Case:4=What of not found;

        Node prevNode=null,current=head;
        //Addressed Case 1 here
        if(current!=null&&current.data==key){
            head=current.next;
            return;
        }

        while (current!=null&&current.data!=key){
            prevNode=current;
            current=current.next;
        }
        if(current==null){
            return;
        }
        prevNode.next=current.next;
    }

    public int length(){
        /**
         * Case 1: Head =null
         * Case 2: Normal Case
         */
        Node current=head;
        int counter=0;
        if(head==null){
            return 0;
        }

        while (current!=null){
            counter++;
            current=current.next;
        }
        return counter;
    }

    public int lengthRecursive(Node node){
        if(node==null){
            return 0;
        }
        return 1+lengthRecursive(node.next);
    }

    public void deleteNodeAt(int position){
        /**
         * Case1: Starting Position.
         * Case2: Ending Position.
         * Case3: Position OutOfBound.
         * Case4: Head is Empty
         */
        if(head==null){
            return;
        }

        if(position==0){
            head=head.next;
            return;
        }

        Node prevNode=null;
        Node current=head;
        int counter=0;
        while (current!=null&&counter!=position){
            prevNode=current;
            current=current.next;
            counter++;
        }

        if(current==null){
            return;
        }
        prevNode.next=current.next;
    }

    public void append(int data){
        Node lastNode=new Node(data);
        if(head==null) {
            head = lastNode;
            return;
        }
        Node prev=head;
        while(prev.next!=null){
            prev=prev.next;
        }
        prev.next=lastNode;

    }

    public void push(int data){
        Node newHead=new Node(data);
        newHead.next=head;
        head=newHead;
    }

    public void reverse(){
        Node current=head,prev=null,next=null;
        while (current!=null){
            next=current.next;
            current.next=prev;
            prev=current;
            current=next;
        }
        head=prev;
    }

    public void recursiveReverse(Node current){
        if(current.next==null){
            head=current;
            return;
        }
        recursiveReverse(current.next);
        Node q=null;
        q=current.next;
        q.next=current;
        current.next=null;
    }

    public static void main(String[] args){

        LinkedList list = new LinkedList();
        list.head= new Node(1);
        Node first=new Node(10);
        Node second=new Node(20);
        list.head.next=first;
        first.next=second;
        list.push(15);
        list.push(13);
        list.push(12);
        list.push(11);
        list.insertAfter(list.head.next.next.next,90);
        list.append(30);
        list.append(40);
        list.deleteNodeAt(10);
        System.out.println("Recursive length="+list.lengthRecursive(list.head));
        list.swapNodes(1,10);
        list.reverse();
        list.recursiveReverse(list.head);
        list.printLinkedList();
    }
}

