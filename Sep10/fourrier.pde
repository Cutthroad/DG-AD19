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
      amplitudes[i] = random(0.5,1.5);
      freq[i] = random(0.5,1.5);
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
Fourier f;

void setup(){
  size(400,400);
  f = new Fourier(20);
}

void draw(){
  background(255);
  noStroke();
  fill(0);
  float amp = f.ampTotal;
  for(int i = 0; i<400; i++){
    ellipse(i,map(f.v(i*0.1),amp,-amp,0,400),2,2);
  }
}
