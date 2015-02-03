class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float   size;
  float   size_height_factor;
  color   colour;

  Ball(int x, int y) {
    if (x == 0 && y == 0) {
      position = new PVector( random(width), random(height));
    } else {
      position = new PVector( x + randomGaussian()*20, y + randomGaussian()*20);
    }
    velocity = new PVector( random(-1.0, 1.0), random(-1.0, 1.0));
    acceleration = new PVector(0, 0);
    size = randomGaussian()*30+10;
    size_height_factor = randomGaussian()*1;
    colour = color(random(0, 255), random(0, 255), random(0, 255), 150);
  }

  void display() {
    noStroke();
    fill(colour);  

    ellipse(position.x, position.y, size, size);
  }

  void update() {

    /* 
     f_x = (mouseX - position.x)
     */
    //acceleration.x = 1;
    //acceleration.y = 1;

    acceleration.x = (mouseX - position.x)*0.001*0.5*0.5;
    acceleration.y = (mouseY - position.y)*0.001*0.5*0.5;

    if ((mouseX - position.x) > 150 || (mouseY-position.y) > 150) {
    } else {
      velocity.setMag(2);
    }



    //    if (velocity.mag() > 4){
    //      velocity.setMag(2);
    //    } else {
    //      velocity.add(acceleration);    
    //    }
    //    
    velocity.add(acceleration);    

    //velocity.x = (mouseX - position.x);
    //velocity.y = (mouseY - position.y);
    position.add(velocity);
  }   

  void redistribute() {
    acceleration.x = (mouseX - random(0, 400))*0.1;
    acceleration.y = (mouseY - random(0, 400))*0.1;

    velocity.add(acceleration);
    position.add(velocity);
  }

  void wallContact() {
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


void mousePressed() {

  /*
  for(int i = 0; i < 10; i++){
   balls.add(new Ball(mouseX, mouseY));
   }
   */
  for (Ball b : balls) {
    b.redistribute();
  }
}

void setup() {
  size(600, 600); 
  balls = new ArrayList<Ball>();

  for (int i = 0; i < 15; i++) {
    balls.add(new Ball(0, 0));
  }
}

void draw() {
  background(0);

  fill(153);
  ellipse(mouseX, mouseY, 150, 150); 

//  textAlign(RIGHT);
//  float xt = width/2;
//  float yt = height/3;
//  fill(0,255,0);
//  textSize(20);
//  String message = "Number of balls in sphere: "+ballsInSphere;
//  text(message, xt, yt+=30);
  //text("Jan 29 homework assignment", xt, yt+=30);
  //text("Wandering blobs attracted to the mouse", xt, yt+=30);
  for (Ball b : balls) {
    b.display();
    b.update();
    b.wallContact();
  }
   
}

