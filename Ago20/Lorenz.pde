float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0/3.0;

ArrayList<PVector> vs;


void setup() {
  size(400, 400, P3D);
  vs = new ArrayList<PVector>();  
}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  vs.add(new PVector(x, y, z));

  translate(width/2, height/2);
  
  if (mousePressed){
    rotateX(mouseX/50f);
    rotateY(mouseY/50f);
  }
  scale(4);
  stroke(255,100);
  strokeWeight(0.5);
  noFill();

  beginShape();
  for (PVector v : vs) {   
    vertex(v.x, v.y,v.z);
  }
  endShape();
}
