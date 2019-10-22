class Particula{
  PVector posicion;
  PVector velocidad;
  float velMax;
  float acP;
  float dir;
  float rangoV =40;
  float cambioDir;
 
 Particula(PVector pos_, float velMax_, float acP_, float dir_, float cd_){
   this.posicion = pos_;
   this.velocidad = new PVector(0,0);
   this.velMax = velMax_;
   this.acP = acP_;
   this.dir = dir_;
   this.cambioDir = cd_;
 }
 
 void display(){
   noStroke();
   fill(255,0,0);
   pushMatrix();
   translate(posicion.x,posicion.y);
   ellipse(0,0,50,50);
   popMatrix();
 }
 
 void mover(){
   this.posicion.add(velocidad);
   setVelocidad();
   limites();
   println(this.posicion);
   println(dir);
 } 
 
 void setVelocidad(){
   if(this.dir<-TWO_PI){
     this.dir = 0;
   }
   this.velocidad.x += cos(this.dir)*this.acP;
   this.velocidad.y += sin(this.dir)*this.acP;
   PVector l = this.velocidad.copy();
   l.normalize();
   float mag = velocidad.mag();
   if(mag>this.velMax){
     this.velocidad.setMag(this.velMax);
   }
 }
 
 void limites(){
   if(this.posicion.y>height-rangoV && this.dir> 0){
     this.dir += this.cambioDir;
   }
   
   if(this.posicion.x>width-rangoV && this.dir >-HALF_PI){
     this.dir += this.cambioDir;
   }
   
   if(this.posicion.y<rangoV && this.dir > -PI){
     this.dir += this.cambioDir;
   }
   
   if(this.posicion.x<rangoV && this.dir<0){
     this.dir += this.cambioDir;
   }

 }
 
}

Particula una;
ArrayList <Particula> particulas;
void setup(){
  size(400,400);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<20; i++){
    particulas.add(new Particula (new PVector(width/2,height/2), random(0.8,2), random(0.01,0.1), random(1),-random(0.1,0.4)));
  }
  una = new Particula (new PVector(width/2,height/2), 1, 0.05, 1,-0.3);
}

void draw(){
  background(255);
  una.display();
  una.mover();
  
  for(Particula p:particulas){
    p.display();
    p.mover();
  }
}
