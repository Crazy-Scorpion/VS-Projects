function setup() {
    createCanvas(500, 500);
    background(0);
  }
  
  function draw() {
    fill("black");
    stroke(255);
    strokeWeight(2);
    
    if(mouseIsPressed == true){
      circle(mouseX, mouseY, 75);  
    }
    
  }