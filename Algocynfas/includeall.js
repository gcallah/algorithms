/**
 * Created by jaildar on 06/07/17.
 */

function addNode(tree,x)
{
    var prev=null;          //Create A reference to previous Node
    if(tree.root().value()=='') //Check if root is created or Not
    {
        var node = tree.newNode(x); //If this is the first Node of Tree,Create it as Root
        tree.root(node);
        return tree;
    }

    var test=tree.root();

    var node=tree.newNode(x);
    while(test!=null)               //If Node is not first Node, then Execute Standard Binary Tree Insertion Algorithm.

        {

            if(test.value()<=x)
                {

                    prev=test;
                    test=test.right();
                }
                else
                {
                    prev=test;
                    test=test.left();

                }


        }

    if(prev.value()<=x)
        {
            prev.right(node);


        }
    else
        {
            prev.left(node);
        }


    tree.layout();          //Upadte the Tree Layout with New Nodes Added
 }