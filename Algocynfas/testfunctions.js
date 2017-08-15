/**
 * Created by jaildar on 15/08/17.
 */

 var height=parseInt(document.getElementById("canvas").getAttribute("height"));
 var width=parseInt(document.getElementById("canvas").getAttribute("width"));
function addRoot(value)
{
    var x=new fabric.Circle({ radius: 20,originX: 'center', originY: 'center',fill:'red'});
    var value1=String(value);
    var text= new fabric.Text(value1, {fontSize: 10, originX: 'center', originY: 'center'});
    var group = new fabric.Group([ x, text ], {left:width/2, top: 10, angle:0});
    canvas.add(group);
    return group;

}

function addNode(node1,node2,angle)
{
    var intialx=parseInt(node1.get('left'));
    var initialy=parseInt(node1.get('top'));

    if(angle>180)
    {


        var pointx =Math.abs(Math.cos(angle*Math.PI/180)*200+intialx);
        var pointy=Math.abs(Math.sin(angle*Math.PI/180)*200-initialy);

    }
    else
    {

        var pointx =Math.abs(Math.cos(angle*Math.PI/180)*200-intialx);
        var pointy=Math.abs(Math.sin(angle*Math.PI/180)*200+initialy);
    }

    var x=new fabric.Circle({ radius: 20,originX: 'center', originY: 'center',fill:'red'});
    var value1=String(node2);
    var text= new fabric.Text(value1, {fontSize: 10, originX: 'center', originY: 'center'});
    var group = new fabric.Group([ x, text ], {left:pointx, top: pointy, angle:0});
    canvas.add(group);
    return group;




}
