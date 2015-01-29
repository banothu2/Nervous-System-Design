/*
  Creates a bacterial plate of 100 green cells. 
  Distribution of cells is generated through random Guassian function.
*/

int bacteria = 0;

void setup(){
  size(600, 600);
  background(204, 204, 204);  
  
  stroke(255, 255, 255);
  fill(255, 255, 255);
  ellipse(width/2, height/2, 200, 200);
}

void draw(){
  while(bacteria < 100){
    float x = randomGaussian()*width;
    float y = randomGaussian()*height;
    
    float distance = dist(width/2, height/2, x, y);
    
    if(distance < 100){
      PVector test = new PVector(x, y);
      stroke(46, 204,  113);
      fill(46, 204, 113);
      ellipse(test.x, test.y, 5, 5);
      bacteria++;
    }
  }

}
