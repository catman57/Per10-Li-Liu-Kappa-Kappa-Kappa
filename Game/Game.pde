

Platform[] platforms = {new Platform(200, 200, 40, 15), new Platform(800, 400, 80, 15)};

//Platform a = new Platform(200, 200, 40, 15);
//Platform b = new Platform(800, 400, 80, 15);

Player p = new Player();

int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped



void setup() {
  size(1000, 650);
  background(255);
  p.display();
  a.display(p.locX, p.locY);
}

void draw() {
  if (keyPressed ){
      
      a.display(p.locX, p.locY, dir);
      b.display(p.locX, p.locY, dir);
    
    
  }
  
}
void keyPressed(){
  if (key == 'a'){
    dir = 1;
    p.locX -= 2;
  }
  else if (key == 'd'){
    dir = -1;
    p.locX += 2;
  }
  else{
    dir = 0;
  }
}
  
  
  
  




