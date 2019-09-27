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
      epiciclos.add(new Epiciclo(random(TWO_PI),random(-0.05,0.05),random(20,60)));
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
  
  void dibujaEnN(int n_, color c){
    noStroke();
    fill(c,80);
    ellipse(valorX(n_),valorY(n_),5,5);
  }
  
  float[] regresaN(int n_){
    float [] valor = {valorX(n_),valorY(n_)};
    return(valor);
  }
}

VariosEpiciclos uno;
VariosEpiciclos otro;
ArrayList <PVector> puntos;
float z;
void setup(){
  sphereDetail(3);
  size(400,400,P3D);
  puntos = new ArrayList <PVector>();
  uno = new VariosEpiciclos(8);
  otro = new VariosEpiciclos(8);
}

void draw(){
  z+=0.05;
  background(255);
  uno.avanza();
  otro.avanza();
  puntos.add(new PVector(uno.regresaN(8)[0],uno.regresaN(8)[1],otro.regresaN(8)[1]));
  background(255);
  lights();
  translate(width/2,height/2);
  rotateX(mouseY/100f);
  rotateY(mouseX/100f);
  fill(255,0,0);
  noStroke();
  vertices();
}

void vertices(){
  for(PVector p:puntos){
    pushMatrix();
    translate(p.x,p.y,p.z);
    sphere(5);
    popMatrix();
  }
}
