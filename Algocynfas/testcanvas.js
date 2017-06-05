window.onload = function() {
    var canvas = document.getElementById("testcanvas");
    var context = canvas.getContext("2d");

    // drawing code here
    context.lineWidth = 10;
    context.moveTo(10, 10);
    context.lineTo(200, 40);
    context.stroke();
};

