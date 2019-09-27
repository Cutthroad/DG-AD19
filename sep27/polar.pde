ArrayList <PVector> puntos;
float radio = 100;
float radio2 = 100;
float res = 100;
int capas = 50;
int resz = 5;

void setup(){
  size(400,400,P3D);
  sphereDetail(3);
  puntos = new ArrayList <PVector>();
  for(int j = 0 ; j<capas; j++){
    for(float i = 0 ; i<PI*2; i += (PI*2)/res){
      //float x = cos(i)*(radio+(sin(i*6)*20))*j*0.01;
      //float y = sin(i)*(radio2+(sin(i*6)*20))*j*0.01;
      float x = cos(i)*radio;
      float y = sin(i)*radio; 
      float z = j*resz;
      puntos.add(new PVector(x,y,z));
    }
  }
  for(PVector p:puntos){
    p.add(0,0,-capas*resz/2);
  }
  println(puntos.size());
  
  for(int i = 0 ; i<200;i++){
    extrudeProg1(random(-125,125),random(TWO_PI), random(70,120), random(-0.4,0.4));
  }
}

void draw(){
  background(255);
  lights();
  translate(width/2,height/2);
  rotateX(mouseY/100f);
  rotateY(mouseX/100f);
  fill(255,0,0);
  noStroke();
  //vertices();
  //stroke(0);
  //vectores();
  superficie();
}

void vertices(){
  for(PVector p:puntos){
    pushMatrix();
    translate(p.x,p.y,p.z);
    sphere(5);
    popMatrix();
  }
}

void vectores(){
  for(PVector p:puntos){
    line(p.x,p.y,p.z,0,0,0);
  }
}


void superficie(){
  for(int j = 1; j<capas;j++){
    for(int i = 1; i<res+1 && i+j*res<puntos.size(); i++){
      PVector p1 = puntos.get(i+int(j*res));
      PVector p2 = puntos.get((i-1)+int(j*res));
      PVector p3 = puntos.get((i-1)+int((j-1)*res));
      PVector p4 = puntos.get(i+int((j-1)*res));
      beginShape();
      vertex(p1.x,p1.y,p1.z);
      vertex(p2.x,p2.y,p2.z);
      vertex(p3.x,p3.y,p3.z);
      endShape();
       beginShape();
      vertex(p4.x,p4.y,p4.z);
      vertex(p1.x,p1.y,p1.z);
      vertex(p3.x,p3.y,p3.z);
      endShape();
    }
  }
  
}
void extrudeProg1(float z,float a, float r, float i){
  PVector puntoExt = new PVector(cos(a)*radio,sin(a)*radio,z);
  for (PVector p:puntos){
    float distancia = p.dist(puntoExt);
    if(distancia<r){
      float factor = sin(map(distancia,0,r,HALF_PI,-HALF_PI))*.5+0.5;
      p.x *= 1+i*factor;
      p.y *= 1+i*factor;
    }
  }
}
