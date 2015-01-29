void setup(){
 size(500, 500);
 background(204, 204, 204);  
}

void draw_platter(float mouseX, float mouseY){
  int x_deviation = 100;
  int y_deviation = 200;
  
  for(int i = 0; i < 10; i++){
    fill(random(0, 255), random(0, 255), random(0, 255)); 
    float size = randomGaussian()*10;
    ellipse(mouseX + randomGaussian()*20, mouseY + randomGaussian()*20, size, size);
  } 
}

void mousePressed(){
  draw_platter(mouseX, mouseY);
}

void draw(){
  
}
