size(400,400);
loadPixels();

for(int i = 0; i<400; i++){
  for(int j = 0; j<400; j++){
    float perlin = ceil(noise(i*0.01,j*0.01)*30);
    color c = 0;
    if(perlin%5 == 0){
      c = color(0);
    }
    else if(perlin%8 == 0){
      c = color(255,0,0);
    }
    else{
      c = color(255);
    }
    pixels[i+j*height] = c;  
  }
}

updatePixels();
