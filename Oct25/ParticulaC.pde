class Particula {

  PVector posicion;
  PVector vel;
  PVector acc;
  float r;
  float maxf;
  float maxv;
  float rango;

  Particula(float x, float y) {
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    posicion = new PVector(x,y);
    r = 20;
    maxv = 4;
    maxf = 0.1;
    rango = 100;
  }
  
  void update() {
    vel.add(acc);
    println(acc);
    vel.limit(maxv);
    posicion.add(vel);
    acc.mult(0);
  }
  
  void corriente(){
    float angulo = noise(posicion.x*0.01,posicion.y*0.01)*TWO_PI;
    PVector d = PVector.fromAngle(angulo);
    d.mult(1);
    PVector mov = PVector.sub(d,vel);
    mov.limit(maxf);
    aplicarFuerza(mov);

 }


  void aplicarFuerza(PVector fuerza) {
    acc.add(fuerza);
  }

  void buscar(PVector target) {
    float dist = posicion.dist(target);
    if(dist<rango){
      
      PVector d = PVector.sub(target,posicion);
      d.normalize();
      d.mult(maxv);
      PVector mov = PVector.sub(d,vel);
      mov.limit(maxf);
      aplicarFuerza(mov);
    }
  }
  
  void huir(PVector target) {
    float dist = posicion.dist(target);
    if(dist<rango){
      
      PVector d = PVector.sub(target,posicion);
      d.normalize();
      d.mult(maxv);
      PVector mov = PVector.sub(vel,d);
      mov.limit(maxf);
      aplicarFuerza(mov);
    }
  }


  void display() {
    fill(255,0,0);
    noStroke();
    pushMatrix();
    translate(posicion.x,posicion.y);
    ellipse(0,0,r,r);
    popMatrix();
  }
}

Particula una;

void setup(){
  size(400,400);
  una = new Particula(width/2,height/2);
}

void draw(){
  background(255);
  for(int i = 0; i<width; i+=20){
    for(int j = 0; j<height; j+= 20){
      pushMatrix();
      stroke(0);
      translate(i,j);
      rotate(noise(i*0.01,j*0.01)*TWO_PI);
      line(0,0,10,0);
      ellipse(10,0,3,3);
      popMatrix();
    }
  }
 // una.huir(new PVector(mouseX,mouseY));
  una.corriente();
  una.update();
  una.display();
}
