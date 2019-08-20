size(400,400);
for (int i = 0 ; i<width; i+=10){
  for(int j =0 ; j<height; j+=10 ){
    fill(noise(i*0.01,j*0.01)*255);
    rect(i,j,10,10);
  }
}
