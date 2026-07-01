//draw "buttons" bar
void drawButtons() {
  fill(40); //fill with light grey
  
  for(int i = 0; i < pages.length; i++) {
    if(i == currentPage){ //If current page is same as i
      fill(255, 165, 0); //Fill box with orange(selected)
    }
    else{
      fill(100); //Fill it with grey (unselected)
    }
    rect(i*(width/2), 15, width/2, 65); //Create "button" on navigation bar
    fill(255); //Text = white
    textSize(35);
    text(pages[i], (i*(width/2))+40, 60); //Fill "button" with text of each page **
  }
}

//Page Switching
void displayCurrentPage() {
  if(currentPage == 0){
    drawHomePage();
  }
  else if(currentPage == 1){
    drawGraphPage();
  }
}

//home page
void drawHomePage() {
  fill(255); //text = white
  textSize(50); //text size
  text("Welcome to", width/2.8, height/2 - 100); //Create text in middle of screen
  text("Automotive Performance Analyzer", width/6.5, height/2);
  
  image(cars, 125, 375);  //cars image
  image(dyno, 625, 375); //dyno graph image
  //arrow from cars to dyno
  stroke(255);
  strokeWeight(5);
  line(410, 450, 615, 450);
  line(585, 420, 615, 450);
  line(585, 480, 615, 450);
}

//mouse controls
void mousePressed(){
  //only check buttons
  if(mouseY < 80){
    if(mouseX < width/2){ //left side button
      currentPage = 0;
    }
    else{
      currentPage = 1;  //right side button
    }
  }
}

void getControllerValues() { //used to initialization and updating
  carname = Carname.getText();
  hpInput = HP.getValueF();
  tqInput = TQ.getValueF();
  rpmInput = RPM.getValueF();
}
