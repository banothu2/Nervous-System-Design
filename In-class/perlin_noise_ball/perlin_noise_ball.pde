void setup() {  // this is run once.   
  size(400, 400); 
  balls = new ArrayList<Ball>();
 
  balls.add(new Ball(width/2, height/2));
}
 
void draw() {  // this is run repeatedly.  
    background(0);   // black
    String xoff_factor_text = "The value of x is: " + xoff_factor;
    fill(255,255,0); // yellow
    textAlign(TOP, LEFT);
    text(xoff_factor_text, width/2, height/2);
    
    for(Ball b: balls){
      b.display();
      b.update();
    }
}
float xoff = 0.0;
float xoff_factor = 0.01;

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
   xoff = xoff + xoff_factor;
   size = noise(xoff) * width;//randomGaussian()*30+10;
   size_height_factor = randomGaussian()*1;
   colour = color(random(0, 255), random(0, 255), random(0, 255), 150);
  }
  
  void display(){
     noStroke();
     fill(colour);  
    
     ellipse(position.x, position.y, size, size); 
  }

  void update(){
    xoff = xoff + xoff_factor;
    size = (noise(xoff) * width);
    
  }   

}

ArrayList<Ball> balls;


void mouseMoved(){
  xoff_factor = (float) mouseX / (float) width;
}

 
