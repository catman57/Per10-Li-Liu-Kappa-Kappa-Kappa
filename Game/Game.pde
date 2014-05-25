

Platform a = new Platform(100, 50, 26, 5);
Player p = new Player();

int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped



void setup() {
  size(480, 120);
  background(255);
  p.display();
  a.display(p.locX, p.locY);
}

void draw() {
  if (keyPressed ){
      
      a.display(p.locX, p.locY, dir);
    
    
  }
  
}
void keyPressed(){
  if (key == 'a'){
    dir = 1;
    p.locX -= 1;
  }
  else if (key == 'd'){
    dir = -1;
    p.locX += 1;
  }
  else{
    dir = 0;
  }
}
  
  
  
  



