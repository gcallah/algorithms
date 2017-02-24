/*
Author : priyanka bhadoriya
Date   : 02/23/2017
Implementing  Red black tree in java
created functions 
insertion 
fix up insertion 
calling left rotate and right rotate 
created additional function to print the inorder traversal of tree. 

*/
public class RedBlackTree {

    private final int RED = 0;
    private final int BLACK = 1;

    private class Node {

        int key = -1, color = BLACK;
        Node left = nil, right = nil, parent = nil;

        Node(int key)
        {
            this.key = key;
        } 
    }

    private final Node nil = new Node(-1); 
    private Node root = nil;
    
    void printTreeInorder()
    {
    	Inorder(root);
    }

    public void Inorder(Node node)
    {
        if (node == nil)
        {
            return;
        }
        Inorder(node.left);
        System.out.print(((node.color==RED)?"Red:":"Black:")+node.key+" ");
        Inorder(node.right);
    }

    void Insert(int key)
    {
    	root = RBinsert(root,key);
    }
    private Node RBinsert(Node node, int key)
    {
    	node = new Node(key);
    	Node y = nil;
    	Node x = root;
    	while(x!=nil)
    	{
    		y=x;
    		if(node.key<x.key)
    			x=x.left;
    		else
    			x=x.right;	
    	}
    	node.parent = y;
    	if(y==nil)
    		root = node;
    	else if (node.key < y.key)
    		y.left = node;
    	else 
    		y.right = node;
    	node.left = nil;
    	node.right = nil;
    	node.color = RED;
    	RBInsertfixup(node);
		return node;
    
        
    }

    //Takes as argument the newly inserted node
    private void RBInsertfixup(Node node)
    {
        while (node.parent.color == RED) 
        {
            Node uncle = nil;
            if (node.parent == node.parent.parent.left)
            {
                uncle = node.parent.parent.right;

                if (uncle != nil && uncle.color == RED) 
                {
                    node.parent.color = BLACK;
                    uncle.color = BLACK;
                    node.parent.parent.color = RED;
                    node = node.parent.parent;
                    continue;
                } 
                if (node == node.parent.right)
                {
                    //Double rotation needed
                    node = node.parent;
                    rotateLeft(node);
                } 
                node.parent.color = BLACK;
                node.parent.parent.color = RED;
                //if the "else if" code hasn't executed, this
                //is a case where we only need a single rotation 
                rotateRight(node.parent.parent);
            } 
            else 
            {
                uncle = node.parent.parent.left;
                 if (uncle != nil && uncle.color == RED)
                 {
                    node.parent.color = BLACK;
                    uncle.color = BLACK;
                    node.parent.parent.color = RED;
                    node = node.parent.parent;
                    continue;
                }
                if (node == node.parent.left) 
                {
                    //Double rotation needed
                    node = node.parent;
                    rotateRight(node);
                }
                node.parent.color = BLACK;
                node.parent.parent.color = RED;
                //if the "else if" code hasn't executed, this
                //is a case where we only need a single rotation
                rotateLeft(node.parent.parent);
            }
        }
        root.color = BLACK;
    }

    void rotateLeft(Node node)
    {
        Node y = node.right;
        node.right = y.left;
        if(y.left !=nil)
        {
        	y.left.parent = node;
        }
        y.parent = node.parent;
        if(node.parent == nil)
        	root = y;
        else if (node == node.parent.left)
        	node.parent.left = y;
        else 
        	node.parent.right = y;
        y.left = node;
        node.parent = y;
        
    }

    void rotateRight(Node node) 
    {
    	Node x = node.left;
        node.left = x.right;
        if(x.right !=nil)
        {
        	x.right.parent = node;
        }
        x.parent = node.parent;
        if(node.parent == nil)
        	root = x;
        else if (node == node.parent.left)
        	node.parent.left = x;
        else 
        	node.parent.right = x;
        x.right = node;
        node.parent = x;
    }

    
    public static void main(String[] args)
    {
    	
        RedBlackTree rbt = new RedBlackTree();
        rbt.Insert(30);
        rbt.Insert(10);
        rbt.Insert(15);
        System.out.println("Inorder traversal of tree :");
        rbt.printTreeInorder();
         
    }       
}
