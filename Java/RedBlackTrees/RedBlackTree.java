/**
 * Created by Ajay A. Thorve
 * RedBlackTree.java takes as input a sequence of numbers and creates a Red-Black Tree using node class instances created in a custom package tree
 */

import com.tree.node;
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
        System.out.println("\nInorder Traversal:element(node-size): ");
        T.inOrderTraversal(T.root);

    }
    static void insert(int key){
            T.insert(key);
            System.out.println("Inserting key: "+key);
        }

}


class Tree{
    public static node root;
    final static node nill=new node(-1);
    public Tree(){
     this.root=nill;
    }



    //Inserting the node in the Red-Black binary tree
    public void insert(int nCurr){

        node newNode=new node(nCurr);
        node current=root;
        node y=nill;

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
public void rbInsertFixup(node nCurr){
    node x=nCurr;
    while(x.color=="R" && x.parent.color=="R"){
        n=x;
        if(n.parent==n.parent.parent.right){             // if the inserted element is on the right side
            if(n.parent.parent.left.color=="R")                        //case 1
            {
                n.parent.parent.left.color="B";
                n.parent.color="B";
                n.parent.parent.color="R";
            }
            else{
                if(n==n.parent.left){                   //case 2
                    rightRotate(n.parent);
                    n=n.right;
                }
                n.parent.parent.color="R";              //case 3
                n.parent.color="B";                     //case 3
                leftRotate(n.parent.parent);           //case 3
            }
        }
        else{                                           //else if the inserted element is on the left side
            if(n.parent.parent.right.color=="R")                        //case 1
            {
                n.parent.parent.right.color="B";
                n.parent.color="B";
                n.parent.parent.color="R";
            }
            else{
                if(n==n.parent.right){                   //case 2
                    leftRotate(n.parent);
                    n=n.left;
                }
                n.parent.parent.color="R";              //case 3
                n.parent.color="B";                     //case 3
                rightRotate(n.parent.parent);           //case 3
            }
        }
        if(n.parent.parent.color=="R" && n.parent.parent.parent!=nill)
           x=n.parent.parent;
    }
    root.color="B";
}

public void leftRotate(node x){
    node y=x.right;
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

public void rightRotate(node x){
    node y=x.left;
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

public int select(node nCurr,int posCurr){
    int r=(nCurr.left==null)?1:nCurr.left.size+1;
    if(posCurr==r){
        return nCurr.data;
    }else if(posCurr<r){
        return select(nCurr.left,pos);
    }else{
        return select(nCurr.right,pos-r);
    }
}


//in-order tree traversal
public void inOrderTraversal(node nCurr){
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