PGraphics2D foo;
PShader shader;
float dx[] = new float[300];
float dy[] = new float[300];
float px[] = new float[300];
float py[] = new float[300];
float r[] = new float[300];
float vr[] = new float[300];
float vg[] = new float[300];
float vb[] = new float[300];
PVector colores[] = new PVector[300];



void setup(){
  size(600,400,P2D);

  foo = (PGraphics2D) createGraphics(600,400,P2D);
  shader = loadShader("miShader.glsl");
  
  for (int i = 0; i<300; i++){
      dx[i] =random(-0.002,0.002);
     dy[i] = random(-0.002,0.002);
     px[i] =random(1);
     py[i] = random(1);
     r[i] = random(0.05,0.25);
     vr[i] = random(-0.25,1);
     vg[i] = random(-0.25,1);
     vb[i] = random(-0.25,1);
     colores[i] = new PVector(random(1),random(1),random(1));
  }
  
}



void draw(){
  
  background(0);
  
  foo.beginDraw();
  foo.noStroke();
  foo.fill(255);
  if(mousePressed){
    foo.fill(0);
  }
  foo.ellipse(mouseX,mouseY,50,50);
  foo.endDraw();
  shader(shader);
  for (int i = 0; i<300; i++){
     px[i] +=dx[i];
     py[i] += dy[i];
     
     if (px[i]<0 || px[i]>1){
       dx[i]*= -1;
     }
     if (py[i]<0 || py[i]>1){
       dy[i]*= -1;
     }
  }
  shader.set("ancho", float(width));
  shader.set("alto",float(height));
  shader.set("mouseX",px);
  shader.set("mouseY",py);
  shader.set("radio", r);
  shader.set("cr", vr);
  shader.set("cg",vg);
  shader.set("cb",vb);

  image(foo,0,0);
  
 // ellipse(mouseX,mouseY,30,30);
}
