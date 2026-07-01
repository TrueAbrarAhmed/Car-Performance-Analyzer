//draw grid
void drawGrid(){
  stroke(60); //line width = 60
  noFill();
  textSize(10);
  
  rect(150,150,700,350);  //graph box/boundaries
  
  // vertical lines
  for(int i = 0; i <= 10; i++){
    float x = 150 + i * 70; //each step to the right = 70
    line(x,150,x,500); //creates line on the x-value inside graph boudaries
    text(i, x, 515); //create value under xaxis
  }
  // horizontal lines
  for(int i = 0; i <= 7; i++){
    float y = 150 + i * 50; //each step down = 50
    line(150,y,850,y); //draw line on y-value inside graph
      float label = (i / 7.0) * hpInput;
      text(int(label), 120, y);
  }
}

//draw axis labels
void drawAxisLabels(){
  fill(255);
  textSize(16);
  
  //x-axis
  text("RPM (x1000)", 500, 540);
  
  //y-axis
  pushMatrix(); //'bookmarks'/creates new "plane"
  translate(100,350); //translates origin to this point
  rotate(-HALF_PI); //rotates this plane 90 degrees clockwise (270 deg)
  text("Power (HP) / Torque (ft-lb)", 0, 0);
  popMatrix(); //resets coordinates to normal plane
}

//draw legend
void drawLegend(){
  fill(255);
  textSize(18);
  text("Legend:", 900, 175);
  stroke(255);
  strokeWeight(3);
  line(895, 180, 965, 180);
  
  textSize(14);
  //red square = HP
  noStroke();
  fill(255,0,0);
  square(860,200,15); //Red sqare
  fill(255);
  text("Horsepower", 880, 213);
  //HP text
  text(hpInput, 890, 240);
  stroke(255);
  strokeWeight(2);
  line(885, 245, 950, 245);
  
  //blue square = Torque
  noStroke();
  fill(0,0,255);
  square(860,280,15); //Blue square
  fill(255);
  text("Torque", 880, 293);
  //TQ text
  text(tqInput, 890, 325);
  stroke(255);
  strokeWeight(2);
  line(885, 330, 950, 330);
  
  //RPM text
  text("RPM =  " + rpmInput, 870, 430);
  stroke(255);
  strokeWeight(2);
  line(910, 435, 970, 435);
}

//graph Page
void drawGraphPage(){
  fill(255);
  textSize(45);
  text("Dyno Graph " + carname, width/2 - 200, 120); //Title of page
  drawGrid(); //draws grid
  drawHPGraph(); //draws HP graph
  drawTorqueGraph(); //draws TQ graph
  drawLegend(); //draws legend
  drawAxisLabels(); //writes axis labels
}

//Draw horsepower curve
void drawHPGraph(){ 
  stroke(255,0,0); //Red colour
  strokeWeight(3); 
  noFill();
  
  beginShape(); //Starts custom drawing of HP graph 
  
  //generates point from low RPM to high RPM
    for(float rpm = 1000; rpm <= min(rpmInput, 10000); rpm += 100){ 
      float hp = hpGraph.getHP(rpm); //HP value at current RPM

      //(position - min) / (max - min)
      
      float x = 150 + ((rpm - 1000) / (rpmInput - 1000)) * 700; //converts RPM value to graph x-position 
      float y = 500 - (hp / maxValue) * 350;  //converts HP value to graph y-position
      y = constrain(y, 150, 500); //keeps graph inside grid box
      vertex(x,y);
    }
  endShape(); 
  noStroke();
}

//Draw torque curve
void drawTorqueGraph(){
  stroke(0,0,255); //blue colour
  strokeWeight(3);
  noFill();
  
  beginShape(); //being custom shape
  
  for(float rpm = 1000; rpm <= min(rpmInput, 10000); rpm += 100){
    
    float tq = tqGraph.getTorque(rpm); //TQ value at current RPM
    
    //(position - min) / (max - min)
    
    float x = 150 + ((rpm - 1000) / (rpmInput - 1000)) * 700; //converts RPM value to graph x-position
    float y = 500 - (tq / maxValue) * 350;  //converts TQ value to graph y-position
    y = constrain(y, 150, 350); ////keeps graph inside grid box
    vertex(x,y);
  }
  endShape();
  noStroke();
}
