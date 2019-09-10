class Fourier{
  float amplitudes[];
  float freq[];
  int n;
  float ampTotal;
  
  Fourier(int n_){
    this.n = n_;
    amplitudes = new float[n_];
    freq = new float[n_];
    for(int i = 0; i<this.n; i++){
      amplitudes[i] = random(-1.5,1.5);
      freq[i] = random(-1.5,1.5);
    }
    float amp = 0;
    for(int i = 0; i<this.n; i++){
      amp+= amplitudes[i];
    }
    this.ampTotal = amp;
  }
  
  float v(float i_){
    float v = 0;
    for(int i = 0 ;i<this.n;i++){
      v += sin(i_*freq[i])*amplitudes[i];
    }
    return(v);
  }
}
Fourier rojo;
Fourier verde;
Fourier azul;
PImage gato;
void setup(){
  size(970,450);
  rojo = new Fourier(50);
  verde = new Fourier(50);
  azul = new Fourier(50);
  gato = loadImage("gato.jpg");
  loadPixels();
  gato.loadPixels();
  for(int i = 0; i<gato.pixels.length; i++){
    float ro = red(gato.pixels[i]);
    float go = green(gato.pixels[i]);
    float bo = blue(gato.pixels[i]);
    float rf = map(rojo.v(ro*TWO_PI*3/255),rojo.ampTotal,-rojo.ampTotal,0,255);
    float gf = map(verde.v(go*TWO_PI*3/255),verde.ampTotal,-verde.ampTotal,0,255);
    float bf = map(azul.v(bo*TWO_PI*3/255),azul.ampTotal,-azul.ampTotal,0,255);
    pixels[i] = color(rf,gf,bf);
  }
  updatePixels();
}
