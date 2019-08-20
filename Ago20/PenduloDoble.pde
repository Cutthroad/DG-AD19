float r1 = 100;
float r2 = 100;
float m1 = 30;
float m2 = 30;
float a1 = PI/2;
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
float g = 1;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  imageMode(CORNER);
  float n1 = -g * (2 * m1 + m2) * sin(a1);
  float n2 = -m2 * g * sin(a1-2*a2);
  float n3 = -2*sin(a1-a2)*m2;
  float n4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float n5 = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (n1 + n2 + n3*n4) / n5;

  n1 = 2 * sin(a1-a2);
  n2 = (a1_v*a1_v*r1*(m1+m2));
  n3 = g * (m1 + m2) * cos(a1);
  n4 = a2_v*a2_v*r2*m2*cos(a1-a2);
  n5 = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (n1*(n2+n3+n4)) / n5;

  translate(width/2, 2*height/5);
  stroke(0);
  strokeWeight(2);

  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);

  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);


  line(0, 0, x1, y1);
  fill(0);
  ellipse(x1, y1, m1, m1);

  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, m2, m2);

  a1_v += a1_a;
  a2_v += a2_a;
  a1 += a1_v;
  a2 += a2_v;
}
