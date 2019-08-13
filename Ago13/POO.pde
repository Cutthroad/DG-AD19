class Particula{
  //atributos
  float x,y;
  float dir;
  float v; 
  
  //metodos
  Particula(){
    this.x =  random(width);
    this.y = random(height);
    this.dir = random(TWO_PI);
    this.v = random(2,-2);
  }
  
  Particula(float x_, float y_, float dir_, float v_){
    this.x = x_;
    this.y = y_;
    this.dir = dir_;
    this.v = v_;
  }
  
  void mover(){
    float dx = cos(this.dir)*this.v;
    float dy = sin(this.dir)*this.v;
    this.x += dx;
    this.y += dy;
    if(this.x>width || this.x< 0){
      this.dir = random(TWO_PI);
      this.x = constrain(this.x,0,width);
    }
    if(this.y>height || this.y< 0){
      this.dir = random(TWO_PI);
      this.y = constrain(this.y,0,height);
    }
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    ellipse(this.x,this.y,20,20);
  } 
}

class Particula2 extends Particula{
  Particula2(){
    super();
  }
  void display(){
    fill(0,0,255);
    rect(this.x,this.y,20,20);
  }
}


Particula una;
Particula2 otra;
ArrayList<Particula> particulas;


void setup(){
  size(400,400);
  una = new Particula(200,200,0,1);
  otra = new Particula2();
  particulas = new ArrayList<Particula>();
  for(int i = 0; i<100; i++){
    particulas.add(new Particula());
  }
}

void draw(){
  background(255);
  una.display();
  una.mover();
  otra.display();
  otra.mover();
  for(Particula p: particulas){
    p.display();
    p.mover();
  }
}
