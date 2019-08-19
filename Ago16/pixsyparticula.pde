class Pix{
  int pos;
  int x,y;
  int r,g,b;
  int rr,gr,br;
  float dr;
  int cuantos = 1;
  
  Pix(int x_, int y_){
    this.x = x_;
    this.y = y_;
    this.r=0;
    this.g=0;
    this.b=0;
  }
  
  Pix(int pos){
    this.pos = pos;
    this.r=0;
    this.g=0;
    this.b=0;
  }
  
  void receive(float distancia_, int r_, int g_, int b_){
    this.rr = r_;
    this.gr = g_;
    this.br = b_;
    this.dr = distancia_;
    //this.resuelveColorAditivo();
    this.prom();

  }
  
  void resuelveColorAditivo(){
    this.r += floor(this.rr*this.dr);
    this.g += floor(this.gr*this.dr);
    this.b += floor(this.br*this.dr);
  }
  
  void prom(){
    this.r = floor((this.r+this.rr)/2);
    this.g = floor((this.g+this.gr)/2);
    this.b = floor((this.b+this.br)/2);
  }
  

  void negro(){
    cuantos = 1;
    this.r = 0;
    this.g = 0;
    this.b = 0;
  }
  
  void reduce(float factor_){
    this.r = floor(this.r * factor_);
    this.g = floor(this.g * factor_);
    this.b = floor(this.b * factor_);
  }
  
  void pinta(){
    this.r = abs((this.r<255)? this.r:255);
    this.g = abs((this.g<255)? this.g:255);
    this.b = abs((this.b<255)? this.b:255);
    int a = 255 << 24;
    int r_ = this.r << 16;
    int g_ = this.g << 8;
    int b_ = this.b;
    int colorF = a | r_ | g_ | b_;
    pixels[pos] = colorF;
  }
  
  int calculaXY(int x, int y){
    int resultado = y*width + x;
    return resultado;
  }
}



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
  int r,g,b;
  Particula2(){
    super();
    this.radio = random(10,200);
    this.radioMAX = random(10,200); 
    this.r = floor(random(255));
    this.g= floor(random(255));
    this.b= floor(random(255));
    this.tr = random(TWO_PI);
    this.dtr = random(0.001,0.005);
  }
  
  void mensaje(){
    this.tr+= this.dtr;
    this.radio = this.radioMAX*sin(this.tr);
    for(float i = (this.x - this.radio<0)? 0:this.x - this.radio; i<this.x+this.radio && i<width; i++){
      for(float j = (this.y - this.radio<0)? 0:this.y-this.radio; j<this.y+this.radio && j<height; j++){
        int ii = floor(i);
        int jj = floor(j);        
        if(this.radio>dist(ii,jj,this.x,this.y)){
          float dist = dist(ii,jj,this.x,this.y);
          float saturacion = map(dist,0,this.radio,1,0);
          pixs.get(calculaXY(ii,jj)).receive(saturacion,this.r,this.b,this.g);
        } 
      }
    }
  }
 
  int calculaXY(int x, int y){
    int resultado = y*width + x;
    return resultado;
  }
}


ArrayList<Particula2> particulas;
ArrayList<Pix> pixs;

void setup(){
  size(400,400);
  particulas = new ArrayList<Particula2>();
  pixs = new ArrayList<Pix>();
  loadPixels();
  for(int i = 0; i<pixels.length;i++){
    pixs.add(new Pix(i));
  }
  
  for(int i = 0; i<100; i++){
    particulas.add(new Particula2());
  }
}

void draw(){
  loadPixels();
  for(Pix p:pixs){
   p.negro();
  }
  for(Particula2 p: particulas){
    p.mover();
    p.mensaje();
  }
  for(Pix p:pixs){
    p.pinta();
  }
  updatePixels();
}
