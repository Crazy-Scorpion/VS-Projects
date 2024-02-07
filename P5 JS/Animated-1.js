let x = 0
let exp = 3
let exp2 = 25
let roun = Math.abs(40 - 2*x)
let y = 100

function setup() {
  createCanvas(500, 500);
  
}

function draw() {
  background("black");
  let w = width
  let h = height
  
  noFill();
  stroke(y - x, x, y + x);
  strokeWeight(2)
  
  angleMode(RADIANS)
  rectMode(CENTER)
  
  square(h/2, w/2, x, roun)
  //square(h/2, w/2, x -100)
  //square(h/2, w/2, x - 150)
  //square(h/2, w/2, x - 200)
  //square(h/2, w/2, x - 250)
  
  square(h/3, w/3, x, roun)
  //square(h/3, w/3, x - 100)
  //square(h/3, w/3, x - 150)
  //square(h/3, w/3, x - 200)
  
  
  square(2*h/3, w/3, x, roun)
  //square(2*h/3, w/3, x - 100)
  //square(2*h/3, w/3, x - 150)
  //square(2*h/3, w/3, x - 200)
  
  square(2*h/3, 2*w/3, x, roun)
  //square(2*h/3, 2*w/3, x - 100)
  //square(2*h/3, 2*w/3, x - 150)
  //square(2*h/3, 2*w/3, x - 200)
  
  
  square(h/3, 2*w/3, x, roun)
  //square(h/3, 2*w/3, x - 100)
  //square(h/3, 2*w/3, x - 150)
  //square(h/3, 2*w/3, x - 200)
  
  square(h/2, w/4, x, roun)
  
  square(h/4, w/2, x, roun)
  
  square(h/2, w/1.35, x, roun)
  
  square(h/1.35, w/2, x, roun)
  
  
  
  x = x + exp;
  y = y + exp2;
  
  if(x < 0 || x > 200){
    exp = exp*(-1);
  }
  
  if(y<100 || y > 500){
    exp2 = exp2*(-1.5);
  } 
}