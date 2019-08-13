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
  float radio;
  float radioMAX;
  float tr;
  float dtr;
  float r,g,b;
  Particula2(){
    super();
    this.radio = random(10,100);
    this.radioMAX = random(10,200);
    
    this.r = random(255);
    this.g= random(255);
    this.b= random(255);
    this.tr = random(TWO_PI);
    this.dtr = random(0.001,0.005);
  }
  void display(){
    this.tr+= this.dtr;
    this.radio = this.radioMAX*sin(this.tr);
    for(float i = (this.x - this.radio<0)? 0:this.x - this.radio; i<this.x+this.radio && i<width; i++){
      for(float j = (this.y - this.radio<0)? 0:this.y-this.radio; j<this.y+this.radio && j<height; j++){
        int ii = floor(i);
        int jj = floor(j);
        int colorActual = pixels[this.calculaXY(ii,jj)];
        float rojo = red(colorActual);
        float verde = green(colorActual);
        float azul = blue(colorActual);
        float saturacion = 0;
        if(this.radio>dist(ii,jj,this.x,this.y)){
          float dist = dist(ii,jj,this.x,this.y);
          saturacion = map(dist,0,this.radio,1,0);
        }
        
        pixels[this.calculaXY(ii,jj)]= color(rojo+this.r*saturacion,verde+this.g*saturacion,azul+this.b*saturacion);
      }
    }
  }
  int calculaXY(int x, int y){
    int resultado = y*width + x;
    return resultado;
  }
}


ArrayList<Particula2> particulas;


void setup(){
  size(400,400);
  particulas = new ArrayList<Particula2>();
  for(int i = 0; i<100; i++){
    particulas.add(new Particula2());
  }
}

void draw(){
  background(0);
  loadPixels();
  for(Particula p: particulas){
    p.display();
    p.mover();
  }
  updatePixels();
}
