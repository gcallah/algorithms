/**
 * Created by Zebin Xu.
 * A tree node structure for binary trees.
 */

package binarysearchtrees;

public class Node<T> {

    int key;
    T data;
    
    Node<T> left;
    Node<T> right;
    Node<T> p;

    public Node(int key) {
        this(key, null);
    }

    public Node(int key, T data) {
        this.key = key;
        this.data = data;
    }
}