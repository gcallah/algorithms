package com.tree;

public class Node{
    public int data;
    public Node left,right,parent;
    public int size,sum;
    public String color;
    public Node(int data){
        this.data=data;
        this.left=null;
        this.right=null;
        this.parent=null;
        this.size=0;
        this.sum=0;
        this.color="B";
    }
}
