class Brown{
  
  float x,y;
  float dx, dy;
  float vel;
  
  
  Brown (float x_, float y_, float vel_){
    this.x = x_;
    this.y = y_;
    this.vel = vel_;
  }
  
  void movimiento(){
    this.dx = random(-1,1)*this.vel;
    this.dy = random(-1,1)*this.vel;
    this.x += this.dx;
    this.y += this.dy;
  }
  
  void display(){
    noStroke();
    fill(0);
    ellipse(this.x,this.y,2,2);
  }
}

Brown una;
void setup(){
  size(400,400);
  una = new Brown(200,200,1);
  background(255);
}

void draw(){
  una.display();
  una.movimiento();
}
