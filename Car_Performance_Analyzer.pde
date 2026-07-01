// =======================================
// Car Performance Analyzer
// Coder: Abrar Ahmed
// =======================================

import g4p_controls.*; //import G4P library

//load images
PImage cars;
PImage dyno;

int currentPage = 0; //keep track of current screen displayed

String[] pages = {"Home", "Graph"}; //list of pages

//values received from GUI sliders/text fields
String carname;
float hpInput, tqInput, rpmInput, maxValue; //maxvalue used so HP and TQ share same graph scale

//objects that calculate horsepower and torque curves
Horsepowermodel hpGraph;
Torquemodel tqGraph;

//setup
void setup() {
  //creates main window
  size(1000,650);
  background(0);
  
  //create gui window
  createGUI();

  cars = loadImage("cars.jpg");
  cars.resize(275, 175);
  dyno = loadImage("dyno.jpg");
  dyno.resize(275, 175);
  
  
  
  //creates horsepower and torque calculation objects
  hpGraph = new Horsepowermodel(hpInput);
  tqGraph = new Torquemodel(tqInput);
}

//draw
void draw() {
  getControllerValues();   //reads current slider values
  maxValue = max(hpInput, tqInput);  //automatically updates to whichever is larger
  background(0);

  // Updates horsepower and torque models
  hpGraph.updateHP(hpInput);
  tqGraph.updateTorque(tqInput);

  // Draws navigation and current screen
  drawButtons();
  displayCurrentPage();
}
