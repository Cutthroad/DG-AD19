class Epiciclo{
  float x,y;
  float a;
  float da;
  float r;
  
  Epiciclo(float a_, float da_, float r_){
    this.a = a_;
    this.da = da_;
    this.r = r_;
    this.x = this.valorX();
    this.y = this.valorY();
  }
  
  float valorX(){
    return(cos(this.a)*this.r);
  }
  
  float valorY(){
    return(sin(this.a)*this.r);
  }
  
  void avanza(){
    this.a+= this.da;
    this.x = this.valorX();
    this.y = this.valorY();
  }
  
  void display(){
    strokeWeight(1);
    stroke(0,255);
    line(0,0,this.x,this.y);
  }  
}

class VariosEpiciclos{
  ArrayList<Epiciclo> epiciclos;
  int n;
  
  VariosEpiciclos(int n_){
    epiciclos = new ArrayList <Epiciclo>();
    for(int i = 0; i<n_; i++){
      epiciclos.add(new Epiciclo(random(TWO_PI),random(-0.05,0.05),random(20,40)));
    }
    this.n = n_;
  }
  
  void avanza(){
    for(Epiciclo e:epiciclos){
      e.avanza();
    }
  }
  
  float valorX(int n_){
    float vx = 0;
    for(int i = 0; i< n_; i++){
      vx+= epiciclos.get(i).x;
    }
    return vx;
    
  }
  
  float valorY(int n_){
    float vy = 0;
    for(int i = 0; i< n_; i++){
      vy+= epiciclos.get(i).y;
    }
    return(vy);
  }
  
  void display(){
    strokeWeight(0.4);
    stroke(0,80);
    for(int i = 1; i<this.n; i++){
      line(valorX(i),valorY(i),valorX(i-1),valorY(i-1));
    }
  }  
}



VariosEpiciclos enXY;
VariosEpiciclos enZ;
ArrayList <PVector> puntos;
float radio = 100;
float radio2 = 100;
float res = 100;
int capas = 40;
int resz = 5;

void setup(){
  size(400,400,P3D);
  sphereDetail(3);
  puntos = new ArrayList <PVector>();
  for(int j = 0 ; j<capas; j++){
    for(float i = 0 ; i<PI*2; i += (PI*2)/res){
      float x = cos(i)*radio;
      float y = sin(i)*radio; 
      float z = j*resz;
      puntos.add(new PVector(x,y,z));
    }
  }
  for(PVector p:puntos){
    p.add(0,0,-capas*resz/2);
  }
  
  enXY = new VariosEpiciclos(6);
  enZ = new VariosEpiciclos(6);

  
  //int c = int(random(3,10));
  //float amp = random(0.1,0.5);
  
  //for(PVector p:puntos){
  //  float angulo = p.heading();
  //  p.x *= 1 + sin(angulo*c)*amp;
  //  p.y *= 1 + sin(angulo*c)*amp;
  //}
  
  //for(PVector p:puntos){
  //  p.x *= 1+sin(p.z*0.06)*0.3 +p.z*0.001;
  //  p.y *= 1+sin(p.z*0.06)*0.3 +p.z*0.001;
  //}
  
  //for(PVector p:puntos){
  //  p.rotate(p.z*0.03);
  //}
  //for(int i = 0 ; i<50;i++){
  //extrudeProg1(random(-125,125),random(TWO_PI), random(70,120), random(-0.3,0.3));
  //}
  for(int i = 0; i<4000;i++){
  enXY.avanza();
  enZ.avanza();
  extrudeProg1(new PVector(enXY.valorX(6),enXY.valorY(6),enZ.valorX(6)),  50, 0.01);
  }
  
}

void draw(){
  background(255);
  lights();
  translate(width/2,height/2);
  rotateX(mouseY/50f);
  rotateY(mouseX/50f);
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
void extrudeProg1(PVector pv_, float r, float i){
  PVector puntoExt = pv_;
  for (PVector p:puntos){
    float distancia = p.dist(puntoExt);
    if(distancia<r){
      float factor = sin(map(distancia,0,r,HALF_PI,-HALF_PI))*.5+0.5;
      p.x *= 1+i*factor;
      p.y *= 1+i*factor;
      p.z *= 1+i*factor;
    }
  }
}
