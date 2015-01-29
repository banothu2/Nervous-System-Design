/*
  Random Ball Simulation 
  
*/
class Ball {
  PVector position;
  PVector velocity;
  float   size;
  float   size_height_factor;
  color   colour;
   
  Ball(int x, int y){
    if(x == 0 && y == 0){
        position = new PVector( random(width), random(height));
    } else {
        position = new PVector( x + randomGaussian()*20, y + randomGaussian()*20);
    }
   velocity = new PVector( random(-1.0, 1.0), random(-1.0, 1.0));
   size = randomGaussian()*30+10;
   size_height_factor = randomGaussian()*1;
   colour = color(random(0, 255), random(0, 255), random(0, 255), 150);
  }
  
  void display(){
     noStroke();
     fill(colour);  
    
     ellipse(position.x, position.y, size, size); 
  }

  void update(){
    position.add(velocity);
  }   

  void wallContact(){
    float r = size/2.0;
    if (position.x < r || position.x > width - r) {
      velocity.x *= -1;
      position.x = constrain(position.x, r, width - r);
    }
    if (position.y < r || position.y > height - r) {
      velocity.y *= -1;
      position.y = constrain(position.y, r, height - r);
    }
  }
}

ArrayList<Ball> balls;


void mousePressed(){
  for(int i = 0; i < 10; i++){
    balls.add(new Ball(mouseX, mouseY));
  }
}

void setup(){
 size(500, 500); 
 balls = new ArrayList<Ball>();
 
 for(int i = 0; i < 15; i++){
   balls.add(new Ball(0, 0));
 }
}

void draw(){
  background(52, 152, 219);
  for(Ball b: balls){
    b.display();
    b.update();
    b.wallContact();
  }
}
