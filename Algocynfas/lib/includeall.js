/**
 * Created by jaildar on 06/07/17.
 */

var min;
var max;
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


function FindMin()          //Function to Find Minimum of the Tree
{
    min=bt.root();
    min.addClass("highlight");
    setTimeout(MinUpdateNode, 2000);        //2  seconds delay before the next code of function is executed
}
function MinUpdateNode()                //Recursive action for Finding Minimum and to highlight relevant nodes
{

    if(min!=null)
    {   if(min.left()!=null)
        {
          min.removeClass("highlight");
          min=min.left();
          min.addClass("highlight");
        }



        bt.layout();
        setTimeout(MinUpdateNode,2000);


    }

}

function FindMax()                              //Same as Min but for Maximum
{
    max=bt.root();
    max.addClass("highlight");
    setTimeout(MaxUpdateNode,2000);
}

function MaxUpdateNode()
{
    if(max!=null)
    {   if(max.right()!=null)
        {
          max.removeClass("highlight");
          max=max.right();
          max.addClass("highlight");

        }

        bt.layout();
        setTimeout(MaxUpdateNode,2000);


    }
}