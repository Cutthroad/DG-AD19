PGraphics2D foo;
PShader shader;



void setup(){
  size(600,400,P2D);

  foo = (PGraphics2D) createGraphics(600,400,P2D);
  shader = loadShader("miShader.glsl");
  
}



void draw(){
  
  background(255);
  
  foo.beginDraw();
  foo.fill(255,120,56);
  foo.noStroke();
  foo.background(0);
  foo.endDraw();
  shader(shader);
  shader.set("ancho", width);
  shader.set("alto",height);
  shader.set("mouseX",mouseX/600.0);
  shader.set("mouseY",(400-mouseY)/400.0);
  shader.set("radio", 0.3);
  shader.set("cr", 1.0);
  shader.set("cg", 0.0);
  shader.set("cb", 0.0);
  image(foo,0,0);
  
 // ellipse(mouseX,mouseY,30,30);
}
