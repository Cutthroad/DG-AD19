float r[] = new float[5];
float dr[] = new float[5];
float y;
void setup(){
  size(400,400);
  background(255);
  for(int i = 0; i<r.length;i++){
    r[i] = random(TWO_PI);
    dr[i] = random(-0.1,0.1);
  }
}

void draw(){
  y+=0.1;
  strokeWeight(0.1);
  stroke(0,80);
  for(int i = 0; i<r.length;i++){
    r[i] += dr[i];
  }
  
  translate(200,y); 
  pushMatrix();
  rotate(r[0]);
  line(0,0,0,50);
  translate(0,50);
  pushMatrix();
  rotate(r[1]);
  line(0,0,0,50);
  translate(0,50);
  pushMatrix();
  rotate(r[2]);
  line(0,0,0,50);
  translate(0,50);
  pushMatrix();
  rotate(r[3]);
  line(0,0,0,50);
  translate(0,50);
  pushMatrix();
  rotate(r[4]);
  line(0,0,0,50);
  translate(0,50);
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
}
