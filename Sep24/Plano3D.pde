ArrayList <PVector> puntos;
int ancho = 400;
int alto = 400;
int res = 5;

void setup(){
  size(400,400,P3D);
  puntos = new ArrayList<PVector>();
  sphereDetail(2);
  for(int i = 0; i<ancho; i+= res){
    for(int j = 0; j<alto; j+= res){
      puntos.add(new PVector(i,j,0));
    }
  }
  
  for(PVector p:puntos){
    p.add(-ancho/2f, -ancho/2f);
  }
  
  for(int i = 0; i<30; i++){
    extrudeProgRadial1(int(random(-200,200)),int(random(-200,200)),int(random(50,200)),random(-30,30));
  }
}

void draw(){
  background(255);
  lights();
  translate(width/2,height/2);
  rotateX(mouseY/100f);
  rotateY(mouseX/100f);
  fill(255,0,0);
  noStroke();
  superficie();
}

void vertices(){
  for(PVector p:puntos){
    fill(255,0,0);
    noStroke();
    pushMatrix();
    translate(p.x,p.y,p.z);
    sphere(10);
    popMatrix();
  }
}

void superficie(){
  for(int i = 1; i<ancho/res;i++){
    for(int j = 1; j<alto/res; j++){
      PVector uno= puntos.get(i+j*ancho/res);
      PVector dos =puntos.get((i-1)+j*ancho/res);
      PVector tres =puntos.get((i-1)+(j-1)*ancho/res);
      PVector cuatro =puntos.get(i+(j-1)*ancho/res);
      beginShape();
      vertex(uno.x,uno.y,uno.z);
      vertex(dos.x,dos.y,dos.z);
      vertex(tres.x,tres.y,tres.z);
      endShape();
      
      beginShape();
      vertex(cuatro.x,cuatro.y,cuatro.z);
      vertex(uno.x,uno.y,uno.z);
      vertex(tres.x,tres.y,tres.z);
      endShape();
    }
  }
}

void extrudeSimple(int x_,int y_, int w_, int h_, float d_){
  for(PVector p:puntos){
    if(p.x>x_ && p.x<x_+w_  && p.y>y_ && p.y<y_+w_){    
      p.add(0,0,d_);
    }
  }
}

void extrudeSimpleRadial( int  x_ , int y_, int r_ , float d_ ){
  for(PVector p:puntos){
    if(p.dist(new PVector(x_,y_,0))<r_ ){
      p.add(0,0,d_);
    }
  }
}

void extrudeProgRadial1(int x_ , int y_, int r_, float d_ ){
  for(PVector p:puntos){
    if(p.dist(new PVector(x_,y_,0))<r_ ){
      float dist = p.dist(new PVector(x_,y_,0));
      float factor = sin(map(dist,0,r_,HALF_PI,-HALF_PI))+1;    
      p.add(0,0,d_*factor);
    }
  }
}
