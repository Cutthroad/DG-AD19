void setup(){
  size(400,400);
  
}

void draw(){
  for(int i = 0; i<400; i+=20){
    for(int j = 0; j<400; j+=20){
      pushMatrix();
      translate(i,j);
      rotate(noise(i*0.02,j*0.02)*TWO_PI);
      line(0,0,15,0);
      popMatrix();
    }
  }
}
