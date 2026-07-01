// Torqe Class  -->  Handles Torque vs RPM calculations
class Torquemodel {
  //field
  //maximum torque from GUI
  float maxTorque;

  //constructor
  Torquemodel(float torqueInput){ //starting TQ
    maxTorque = torqueInput;
  }

  // Calculates torque at RPM
float getTorque(float rpm){
  float normalizedRPM = (rpm - 1000) / (rpmInput - 1000); //convert to range from 0-1
  float shape = 1 - abs(normalizedRPM - 0.5) * 2; //create abs value graph
  return maxTorque * max(0, shape); //return TQ value
}

  // Updates torque from GUI
  void updateTorque(float newTorque){
    maxTorque = newTorque;
  }
}
