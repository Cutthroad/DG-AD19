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

class EpicicloD{
  float x,y;
  float a1;
  float da1;
  float a2;
  float da2;
  float r1;
  float r2;
  
  EpicicloD(float a1_, float da1_,float a2_, float da2_, float r1_, float r2_){
    this.a1 = a1_;
    this.da1 = da1_;
    this.a2 = a2_;
    this.da2 = da2_;
    this.r1 = r1_;
    this.r2 = r2_;
    this.x = this.valorX();
    this.y = this.valorY();
  }
  
  float valorX(){
    return(cos(this.a1)*this.r1);
  }
  
  float valorY(){
    return(sin(this.a2)*this.r2);
  }
  
  void avanza(){
    this.a1+= this.da1;
    this.a2+= this.da2;
    this.x = this.valorX();
    this.y = this.valorY();
  }
  
  void display(){
    noStroke();
    fill(0,80);
    ellipse(this.x,this.y,5,5);
  }  
}

class VariosEpiciclosD{
  ArrayList<EpicicloD> epiciclos;
  int n;
  
  VariosEpiciclosD(int n_){
    epiciclos = new ArrayList <EpicicloD>();
    for(int i = 0; i<n_; i++){
      epiciclos.add(new EpicicloD(random(TWO_PI),random(-0.05,0.05),random(TWO_PI),random(-0.05,0.05),random(20,60),random(20,60)));
    }
    this.n = n_;
  }
  
  void avanza(){
    for(EpicicloD e:epiciclos){
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

EpicicloD e;
VariosEpiciclos ve;
float y;
void setup(){
  size(400,400);
  e = new EpicicloD(0, 0.05,1, 0.14,50,86);
  ve = new VariosEpiciclos(10);
  background(255);
}

void draw(){
  //background(255);
  y+=0.1;
  translate(200,200);
  ve.avanza();
  //ve.display();
  float[] primero = ve.regresaN(5);
  float[] segundo = ve.regresaN(9);
  stroke(0,7);
  strokeWeight(20);
  line(primero[0],primero[1],segundo[0],segundo[1]);
}
