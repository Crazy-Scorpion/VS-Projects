//rotation speed vars
let ang = 0
let angVar = 2
let ang2 = 0
let angVar2 = 2

//arc variation vars
let var1 = 15
let var2 = 100
let varVar2 = angVar/4
let alt = 100 + var2

//dot coll vars
let push = 10

function setup() {
  createCanvas(500, 500);
  angleMode(DEGREES);
}

function draw() {
  background(220);
  noFill();
  strokeWeight(3);
    
  ang = ang + angVar;
  var2 = var2 + varVar2
  alt = alt + varVar2
  
  if(var2 < 75 || var2 > 150){
    varVar2 = varVar2*(-1);
  }
  
  stroke('black')
  circle(250, 250, alt)
  ang2 = ang2 - angVar2
  
  stroke('green')
  
  //layer 1 arcs
  arc(250, 250, alt, var1, 0 + ang2, 80 + ang2);
  arc(250, 250, alt, var1, 180 + ang2, 260 + ang2);  

  //layer 2 arcs
  arc(250, 250, var1, alt, 0 + ang2, 80 + ang2);
  arc(250, 250, var1, alt, 180 + ang2, 260 + ang2);
  
  //arc(250, 250, 45 + alt, 45 + alt, 0 + ang2, 45 + ang2)
  //arc(250, 250, 45 + alt, 45 + alt, 90 + ang2, 135 + ang2)
  //arc(250, 250, 45 + alt, 45 + alt, 180 + ang2, 225 + ang2)
  //arc(250, 250, 45 + alt, 45 + alt, 270 + ang2, 315 + ang2)
    
  stroke('black')
  
  // int circs
  
  arc(250, 250, 100, alt, 20 + ang, 50 + ang);
  arc(250, 250, 100, alt, 200 + ang, 230 + ang); 
  
  arc(250, 250, alt, 100, 20 + ang, 50 + ang);
  arc(250, 250, alt, 100, 200 + ang, 230 + ang);
  
  //ext circs
  
  arc(250, 250, alt, 250, 20 - ang, 50 - ang);
  arc(250, 250, alt, 250, 200 - ang, 230 - ang);
  
  arc(250, 250, 250, alt, 20 - ang, 50 - ang);
  arc(250, 250, 250, alt, 200 - ang, 230 - ang);
}