/**
 * Created by Ajay A. Thorve
 * RedBlackTree.java takes as input a sequence of numbers and creates a Red-Black Tree using Node class instances created in a custom package tree
 */

import com.tree.Node;
import java.util.*;
public class RedBlackTree{
    static int sum;
    static Tree T;
    public static void main(String args[]){
        T=new Tree();
        sum=0;
        insert(1);      // inserting A
        insert(12);     // inserting L
		insert(7);      // inserting G
        insert(15);     // inserting O
        insert(18);     // inserting R
        insert(9);      // inserting I
        insert(20);     // inserting T
        insert(8);      // inserting H
		insert(13);     // inserting M
        insert(19);     // inserting S
        System.out.println("\nInorder Traversal:element(Node-size): ");
        T.inOrderTraversal(T.root);

    }
    static void insert(int key){
            T.insert(key);
            System.out.println("Inserting key: "+key);
        }

}


class Tree{
    public static Node root;
    final static Node nill=new Node(-1);
    public Tree(){
     this.root=nill;
    }



    //Inserting the Node in the Red-Black binary tree
    public void insert(int nCurr){

        Node newNode=new Node(nCurr);
        Node current=root;
        Node y=nill;

        while(current!=nill){               //checking if its not equal to T.nill

            y=current;
            if(nCurr<current.data){
                current=current.left;
            }
            else{
                current=current.right;
            }
        }
        newNode.parent=y;
        if(y==nill){
            root=newNode;
            root.left=nill;
            root.right=nill;
        }
        else{
             if(newNode.data<y.data){
                    y.left=newNode;
                }
                else{
                    y.right=newNode;
                }
            newNode.left=nill;
            newNode.right=nill;
            newNode.color="R";
            if(newNode.parent!=nill)
                rbInsertFixup(newNode);
        }
        
    }

//Fixing up RB-INSERT so that the tree maintains RB-tree rules
public void rbInsertFixup(Node nCurr){
    Node x=nCurr;
    while(x.color=="R" && x.parent.color=="R"){
        nCurr=x;
        if(nCurr.parent==nCurr.parent.parent.right){             // if the inserted element is on the right side
            if(nCurr.parent.parent.left.color=="R")                        //case 1
            {
                nCurr.parent.parent.left.color="B";
                nCurr.parent.color="B";
                nCurr.parent.parent.color="R";
            }
            else{
                if(nCurr==nCurr.parent.left){                   //case 2
                    rightRotate(nCurr.parent);
                    nCurr=nCurr.right;
                }
                nCurr.parent.parent.color="R";              //case 3
                nCurr.parent.color="B";                     //case 3
                leftRotate(nCurr.parent.parent);           //case 3
            }
        }
        else{                                           //else if the inserted element is on the left side
            if(nCurr.parent.parent.right.color=="R")                        //case 1
            {
                nCurr.parent.parent.right.color="B";
                nCurr.parent.color="B";
                nCurr.parent.parent.color="R";
            }
            else{
                if(nCurr==nCurr.parent.right){                   //case 2
                    leftRotate(nCurr.parent);
                    nCurr=nCurr.left;
                }
                nCurr.parent.parent.color="R";              //case 3
                nCurr.parent.color="B";                     //case 3
                rightRotate(nCurr.parent.parent);           //case 3
            }
        }
        if(nCurr.parent.parent.color=="R" && nCurr.parent.parent.parent!=nill)
           x=nCurr.parent.parent;
    }
    root.color="B";
}

public void leftRotate(Node x){
    Node y=x.right;
    x.right=y.left;                 // turn y's left subtree to x's right subtree
    if(y.left!=nill){
        y.left.parent=x;
    }
    y.parent=x.parent;              //link x's parents to y
    if(x.parent==nill){
        root=y;
    }
    else{
        if(x==x.parent.right){
            x.parent.right=y;
        }
        else{
            x.parent.left=y;
        }
    }
    y.left=x;                       //put x on y's left
    x.parent=y;
}

public void rightRotate(Node x){
    Node y=x.left;
    x.left=y.right;                 // turn y's right subtree to x's left subtree
    if(y.right!=nill){
        y.right.parent=x;
    }
    y.parent=x.parent;              //link x's parents to y
    if(x.parent==nill){
        root=y;
    }
    else{
        if(x==x.parent.right){
            x.parent.right=y;
        }
        else{
            x.parent.left=y;
        }
    }
    y.right=x;                       //put x on y's right
    x.parent=y;
}

//selecting the ith smallest data/key in the tree, useful to find the median

public int select(Node nCurr,int posCurr){
    int r=(nCurr.left==null)?1:nCurr.left.size+1;
    if(posCurr==r){
        return nCurr.data;
    }else if(posCurr<r){
        return select(nCurr.left,posCurr);
    }else{
        return select(nCurr.right,posCurr-r);
    }
}


//in-order tree traversal
public void inOrderTraversal(Node nCurr){
    if(nCurr!=null){
        inOrderTraversal(nCurr.left);
        if(nCurr!=nill)
        {
            if(nCurr==root)
                System.out.println((char)(64+nCurr.data)+"("+nCurr.color+"),(root)");
            else if(nCurr==nCurr.parent.right)
                System.out.println((char)(64+nCurr.data)+"("+nCurr.color+"),(right child of "+(char)(64+nCurr.parent.data)+")");
            else
                System.out.println((char)(64+nCurr.data)+"("+nCurr.color+"),(left child of "+(char)(64+nCurr.parent.data)+")");
        }
        inOrderTraversal(nCurr.right);
    }
}

}
