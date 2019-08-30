class Linea{
  
  float x,y;
  float v;
  float dx,dy;
  ArrayList <PVector> posiciones;
  float limiteSup;
  float limiteInf;
  float limiteDer;
  float limiteIzq;
  float ancho;
  float alto;
  float px[];
  float py[];
  float centrox;
  float centroy;

  
  Linea(int n_){
    this.x =0;
    this.y =0;
    this.v=random(-1,1);
    this.posiciones = new ArrayList <PVector>();
    this.px = new float[n_];
    this.py = new float[n_];
    for(int i = 0; i<n_; i++){
      this.mover();
      posiciones.add(new PVector(this.x,this.y));
      this.px[i] = this.x;
      this.py[i] = this.y;
    }
    this.limiteSup = min(this.py);
    this.limiteInf = max(this.py);
    this.limiteDer = max(this.px);
    this.limiteIzq = min(this.px); 
    this.ancho = limiteDer- limiteIzq;
    this.alto = limiteInf - limiteSup; 
    this.centrox = limiteIzq + this.ancho/2;
    this.centroy = limiteSup + this.alto/2;
}
  
  Linea(float x_,float y_,float v_,float dx_,float dy_){
    this.x=x_;
    this.y=y_;
    this.v=v_;
    this.dx=dx_;
    this.dy=dy_;
  }
  
  void mover(){
    
    this.dx = random(-10,10);
    this.dy = random(-10,10);
    

    
    this.x += this.dx;
    this.y += this.dy;
    
    

  }   
}

Linea una;

void setup(){
  size(400,400);
  una = new Linea(2000);
    println(una.limiteSup);
  println(una.limiteInf);
  println(una.limiteDer);
  println(una.limiteIzq);
  println(una.ancho);
  println(una.alto);
  
} 

void draw(){
  background(255);
  pushMatrix();
  translate(-una.limiteIzq,-una.limiteSup);
  for(int i = 0; i<2000-1; i++){
    stroke(255,0,0);
    strokeWeight(1);
    line(una.posiciones.get(i).x,una.posiciones.get(i).y,una.posiciones.get(i+1).x,una.posiciones.get(i+1).y);
  }
  popMatrix();
}
