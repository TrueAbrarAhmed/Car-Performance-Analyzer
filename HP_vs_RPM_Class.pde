// Horsepower Class  -->  Handles horsepower vs RPM calculations
class Horsepowermodel {
  
  //fields
  float maxHP; //maximum HP value

  //constructor
  Horsepowermodel(float hpInput){
    maxHP = hpInput; // Receives horsepower input from GUI
  }

//calculates HP at specific RPM
float getHP(float rpm){
  
  float normalizedRPM = (rpm - 1000) / (rpmInput - 1000); //Convert rpm into range between 0-1
  
  float shape = sin(normalizedRPM * PI); //creates sin curve graph
  return maxHP * shape;
}
  
  // Updates horsepower if user changes the GUI input
  void updateHP(float newHP){
    maxHP = newHP;
  }
}
