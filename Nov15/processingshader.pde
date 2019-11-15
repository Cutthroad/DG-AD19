import processing.video.*;
PGraphics2D foo;
PShader shader;
float [] deltax = new float[3];
float [] deltay = new float[3];
float [] ddeltax = new float[3];
float [] ddeltay = new float[3];
float [] freq = new float[3];
float [] amp = new float[3];

Capture video;



void setup(){
  size(400,400,P2D);
  video = new Capture(this, Capture.list()[3]);
  foo = (PGraphics2D) createGraphics(400,400,P2D);
  shader = loadShader("miShader.glsl");
  for(int i = 0; i<3; i++){
    deltax[i] = random(1);
    deltay[i] = random(1);
    ddeltax[i] = random(-0.5,0.5);
    ddeltay[i] = random(-0.5,0.5);
    freq[i] = random(20,100);
    amp[i] = random(0.1,0.6);
  }
  
  video.start();
}



void draw(){
  if (video.width != 0){
  for(int i = 0; i<3; i++){
    deltax[i] += ddeltax[i];
    deltay[i] += ddeltay[i];
  }
  background(255);
  
  foo.beginDraw();
  foo.fill(255,120,56);
  foo.noStroke();
  foo.ellipse(mouseX,mouseY,30,30);
  foo.endDraw();
  shader(shader);
  shader.set("deltax",deltax);
  shader.set("deltay",deltay);
  shader.set("freq",freq);
  shader.set("amp",amp);
  shader.set("video",video);
  image(foo,0,0);
  }
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed(){
  for(int i = 0; i<3; i++){
    deltax[i] = random(1);
    deltay[i] = random(1);
    ddeltax[i] = random(-0.1,0.1);
    ddeltay[i] = random(-0.1,0.1);
    freq[i] = random(20,100);
    amp[i] = random(0.1,0.6);
  }
}
