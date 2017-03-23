package com.tree;

public class node{
    public int data;
    public node left,right,parent;
    public int size,sum;
    public String color;
    public node(int data){
        this.data=data;
        this.left=null;
        this.right=null;
        this.parent=null;
        this.size=0;
        this.sum=0;
        this.color="B";
    }
}