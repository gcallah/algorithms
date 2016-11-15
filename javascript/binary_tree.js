
'use strict';

/*
	BinaryTree
	In ECMAScript 6 syntactical sugar
 */


class Node {
	constructor(val) {
		this.val = val;
		this.p = null;
		this.left = null;
		this.right = null;
	}
}

class BinaryTree {
	constructor(val) {
		this.root = new Node(val);
	}

	/**
	 * @param  {val: value need to be inserted}
	 * @return {}
	 */
	insert(val) {
		if (!(this.root instanceof Node)) {
			console.log ("Root type Error");
		}

		if (this.root == null) {
			this.root = new Node(val);
		} else {
			var node = this.root;
			var parent = this.root.p;
			while (node != null) {
				parent = node;
				if (node.val > val) {
					
					node = node.left;

				} else if (node.val < val) {
					node = node.right;

				} else {
					console.log("Insert Value Exist");
					return;
				}
			}

			if (parent.val > val) {
				parent.left = new Node(val);
				parent.left.parent = parent;
			} else {
				parent.right = new Node(val);
				parent.right.parent = parent;
			}
		}
	}


	/**
	 * @print tree value inorder
	 */
	inorder() {
		/**
		 * private function of inorder
		 * inorder_node
		 * @return {[type]}
		 */
		var inorder_node = (node)=> {
			// end condition
			if (node == null) return;

			inorder_node(node.left);
			console.log(node.val);
			inorder_node(node.right);
		}

		inorder_node(this.root);
	}
}
