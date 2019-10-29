class Nodo1{
   float r;
   PVector p;
  
  Nodo1(float x_, float y_){
    p = new PVector(x_,y_);
    this.r = 3;
  }
  
  void display(){
    ellipse(this.p.x,this.p.y,this.r,this.r);
  }
  
  float accion(PVector p_, float rango, float fuerza){
    float v = 0;
    float dist = this.p.dist(p_);
    if(dist<rango){
      v = map(dist, 0, rango, fuerza, 0);
    }
    return v;
  }
  
  void cambiarT(PVector p_, float rango, float fuerza){
    float a = this.accion( p_,  rango,  fuerza);
    this.r += a;
  }
  
 void cambiarP(PVector p_, float rango, float fuerza){
    float a = this.accion( p_,  rango,  fuerza);
    this.p.x += a;
    this.p.y += a;
  }
}

class Nodo2{
  PVector p;
  float rango;
  float fuerza;
  
  Nodo2(PVector p_, float rango_, float fuerza_){
    this.p = p_;
    this.rango = rango_;
    this.fuerza = fuerza_;
  }
}

ArrayList<Nodo1> nodos1;
ArrayList<Nodo2> nodos2;

void setup(){
  size(400,400);
  nodos1 = new ArrayList<Nodo1> ();
  nodos2 = new ArrayList<Nodo2> ();
  
  for(int i = 0; i<100; i++){
    nodos2.add(new Nodo2(new PVector(random(400),random(400)),random(50,100),random(-10,10)));
  }
  
  for (int i = 0 ; i<width; i+=10){
    for (int j = 0; j<height; j+= 10){
      nodos1.add(new Nodo1(i,j));
  }
  }
  background(255);
  for(Nodo1 n: nodos1){
    for (Nodo2 n2: nodos2){
      n.cambiarP(n2.p,n2.rango,n2.fuerza);
    }
    
    n.display();
  }
}

void draw(){
  
}
