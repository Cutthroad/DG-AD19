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
  
   void llegar(PVector target) {
    PVector d = PVector.sub(target,posicion);
    float dist = d.mag();
    d.normalize();
    if (dist < 100) {
      float m = map(dist,0,100,0,maxv);
      d.mult(m);
    } else {
      d.mult(maxv);
    }
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
  
  void limitar(){
    if (posicion. x < 25) {
      PVector d = new PVector(maxv,vel.y);
      PVector mov = PVector.sub(d, vel);
      mov.limit(maxf);
      aplicarFuerza(mov);
    }
    if (posicion. x >width - 25) {
      PVector d = new PVector(maxv,vel.y);
      PVector mov = PVector.sub( vel,d);
      mov.limit(maxf);
      aplicarFuerza(mov);
    }
    if (posicion. y < 25) {
      PVector d = new PVector(maxv,vel.x);
      PVector mov = PVector.sub(d, vel);
      mov.limit(maxf);
      aplicarFuerza(mov);
    }
    
    //if (posicion. y > height- 25) {
    //  PVector d = new PVector(maxv,vel.x);
    //  PVector mov = PVector.sub(vel,d);
    //  mov.limit(maxf);
    //  aplicarFuerza(mov);
    //}
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
  una.update();
  una.display();
}
