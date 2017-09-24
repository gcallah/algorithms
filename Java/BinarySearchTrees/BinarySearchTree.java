/**
 * Created by Zebin Xu.
 * Java implementation of binary search tree based on CLRS book.
 * This file contains:
 * inorderTreeWalk()
 * search(): iterativeSearch(), recursiveSearch()
 * minimum(): iterativeMinimum(), recursiveMinimum()
 * maximum(): iterativeMaximum(), recursiveMaximum()
 * successor()
 * predecessor()
 * insert(): iterativeInsert(), recursiveInsert()
 * delete(): sucDelete(), preDelete(). (swapping deleted node with successor/predecessor)
 * 
 * For simplicity, methods such as iterativeSearch() and recursiveReseach() are wrapped in search()
 * and use the version in book by default. 
 * Moreover, methods like search(x, k), insert(T, z) are wrapped in search(k), insert(z) 
 * as interfaces that leave out the default root node or tree argument, 
 * because we generally don't search or insert starting from non-root node.
 * However, the exact implementations in book with same arguments are reserved.
 *
 * The example shows basic operations on binary search tree and a TreePrinter is used to show the tree graph.
 * 
 */

package binarysearchtrees;

import java.util.Scanner;

public class BinarySearchTree<T> {

    public static void main(String[] args) {
        BinarySearchTree<String> bst = new BinarySearchTree<>();

        /****** insertion ******/
        bst.insert(5, "foo");
        bst.insert(2, "bar");
        bst.insert(1, "java");
        bst.insert(3, "c");
        bst.insert(7, "c++");
        bst.insert(6, "python");
        bst.insert(8, "ruby");
        bst.insert(9, "javascript");
        bst.insert(4, "tree");


        /****** tree graph ******/
        TreePrinter printer = new TreePrinter(bst.tree);
        printer.print();

        /****** inorder tree walk ******/
        bst.inorderTreeWalk();

        /******* maximum and minimum *******/
        System.out.printf("maxmimum: %d%n", bst.maximum() == null ? -1 : bst.maximum().key);
        System.out.printf("minimum: %d%n", bst.minimum() == null ? -1 : bst.minimum().key);
	

        /****** deletion *******/
        Scanner in = new Scanner(System.in);
        System.out.printf("please input a key to delete: ");
        String k = in.nextLine();
        bst.delete(Integer.parseInt(k));
	
        printer.print();


        /****** searching ******/
        System.out.printf("please input a key to search: ");
        int key = Integer.parseInt(in.nextLine());
        Node<String> node = bst.search(key);
        if (node != null) {
            System.out.printf("search result: [%d]: '%s'%n", node.key, node.data);
        } else {
            System.out.printf("search result: key %d not found%n", key);
        }


        /****** successor ******/
        System.out.printf("please input a key to find its successor:");
        int key2 = Integer.parseInt(in.nextLine());
        Node<String> node2 = bst.search(key2);
        Node<String> suc = bst.successor(node2);
        if (suc != null) {
            System.out.printf("node %d 's successor found: %d%n", node2.key, suc.key);
        } else {
            System.out.printf("node %d 's successor not found%n", key2);
        }

        /****** predecessor ******/
        System.out.printf("please input a key to find its predecessor:");
        key2 = Integer.parseInt(in.nextLine());
        node2 = bst.search(key2);
        Node<String> pre = bst.predecessor(node2);
        if (pre != null) {
            System.out.printf("node %d 's predecessor found: %d%n", node2.key, pre.key);
        } else {
            System.out.printf("node %d 's predecessor not found%n", key2);
        }
	
    }

    private final Tree<T> tree;

    public BinarySearchTree() {
        tree = new Tree<T>();
    }

    public void inorderTreeWalk() {
        System.out.print("inorder tree walk: ");
        inorderTreeWalk(tree.root);
        System.out.println();
    }

    public void inorderTreeWalk(Node<T> x) {
        if (x != null) {
            inorderTreeWalk(x.left);
            System.out.printf("%d ", x.key);
            inorderTreeWalk(x.right);
        }
    }

    public Node<T> search(int key) {
        return recursiveSearch(tree.root, key);
    }
					      
    private Node<T> recursiveSearch(Node<T> root, int key) {
        if (root == null || root.key == key) {
            return root;
        }
        if (key < root.key) {
            return recursiveSearch(root.left, key);
        } else {
            return recursiveSearch(root.right, key);
        }
    }

    private Node<T> iterativeSearch(Node<T> root, int key) {
        while (root != null && root.key != key) {
            if (key < root.key) {
                root = root.left;
            } else {
                root = root.right;
            }
        }
        return root;
    }

    public Node<T> minimum() {
        return minimum(tree.root);
    }

    public Node<T> minimum(Node<T> x) {
        return iterativeMinimum(x);
    }

    private Node<T> iterativeMinimum(Node<T> root) {
        if (root == null) {
            return null;
        }
        while (root.left != null) {
            root = root.left;
        }
        return root;
    }

    private Node<T> recursiveMinimum(Node<T> root) {
        if (root == null || root.left == null) {
            return root;
        }
        return recursiveMinimum(root.left);
    }

    public Node<T> maximum() {
        return maximum(tree.root);
    }

    public Node<T> maximum(Node<T> x) {
        return iterativeMaximum(x);
    }
				
    private Node<T> iterativeMaximum(Node<T> root) {
        if (root == null) {
            return null;
        }
        while (root.right != null) {
            root = root.right;
        }
        return root;
    }

    private Node<T> recursiveMaximum(Node<T> root) {
        if (root == null || root.right == null) {
            return root;
        }
        return recursiveMaximum(root.right);
    }

    public Node<T> successor(Node<T> root) {
        if (root == null) {
            return null;
        }
        if (root.right != null) {
            return minimum(root.right);
        }
        Node<T> p = root.p;
        while (p != null && root == p.right) {
            root = p;
            p = root.p;
        }
        return p;
    }

    public Node<T> predecessor(Node<T> root) {
        if (root == null) {
            return null;
        }
        if (root.left != null) {
            return maximum(root.left);
        }
        Node<T> p = root.p;
        while (p != null && root == p.left) {
            root = p;
            p = root.p;
        }
        return p;
    }

    public void insert(int key, T data) {
        insert(new Node<T>(key, data));
    }

    public void insert(Node<T> node) {
        iterativeInsert(tree, node);
    }

    private void iterativeInsert(Tree<T> tree, Node<T> z) {
        if (z == null) {
            return;
        }
        Node<T> y = null;
        Node<T> x = tree.root;
        while (x != null) {
            y = x;
            x = z.key < x.key ? x.left : x.right;
        }
        z.p = y;
        if (y == null) {
            System.out.printf("Node %d inserted in the root of tree.%n", z.key);
            tree.root = z;
        } else if (z.key < y.key) {
            System.out.printf("Node %d inserted in the left subtree.%n", z.key);
            y.left = z;
        } else {
            System.out.printf("Node %d inserted in the right subtree.%n", z.key);
            y.right = z;
        }
    }

    private void recursiveInsert(Tree<T> tree, Node<T> node) {
        if (node == null) {
            return;
        }
        if (tree.root == null) {
            tree.root = node;
            System.out.printf("Node %d inserted in the root of tree.%n", node.key);
        } else {
            recursiveInsert(tree.root, node);
        }
    }

    private void recursiveInsert(Node<T> current, Node<T> node) {
        if (current == null) {
            return;
        } else {
            if (node.key < current.key) {
                if (current.left == null) {
                    current.left = node;
                    System.out.printf("Node %d inserted in the left subtree.%n", node.key);
                    node.p = current;
                } else {
                    recursiveInsert(current.left, node);
                }
            } else {
                if (current.right == null) {
                    current.right = node;
                    System.out.printf("Node %d inserted in the right subtree.%n", node.key);
                    node.p = current;
                } else {
                    recursiveInsert(current.right, node);
                }
            }
        }
    }

    public void delete(int key) {
        //In practice, we have to search the node before deleting it.
        Node<T> node = search(key);
        sucDelete(tree, node);
    }

    /**
     * Replace the node to be deleted with its successor
     */
    private void sucDelete(Tree<T> tree, Node<T> node) {
        if (node == null) {
            return;
        }
        if (node.left == null) {
            transplant(tree, node, node.right);
        } else if (node.right == null) {
            transplant(tree, node, node.left);
        } else {
            //find the successor
            Node<T> suc = minimum(node.right);
            if (suc.p != node) {
                transplant(tree, suc, suc.right);
                suc.right = node.right;
                suc.right.p = suc;
            }
            transplant(tree, node, suc);
            suc.left = node.left;
            suc.left.p = suc;
        }
    }

    /**
     * Replace the node to be deleted with its predecessor
     */
    private void preDelete(Tree<T> tree, Node<T> node) {
        if (node == null) {
            return;
        }
        if (node.left == null) {
            transplant(tree, node, node.right);
        } else if (node.right == null) {
            transplant(tree, node, node.left);
        } else {
            //find the predecessor
            Node<T> pre = maximum(node.left);
            if (pre.p != node) {
                transplant(tree, pre, pre.left);
                pre.left = node.left;
                pre.left.p = pre;
            }
            transplant(tree, node, pre);
            pre.right = node.right;
            pre.right.p = pre;
        }
    }

    private void transplant(Tree<T> tree, Node<T> u, Node<T> v) {
        if (u.p == null) {
            tree.root = v;
        } else if (u == u.p.left) {
            u.p.left = v;
        } else {
            u.p.right = v;
        }

        if (v != null) {
            v.p = u.p;
        }
    }
}