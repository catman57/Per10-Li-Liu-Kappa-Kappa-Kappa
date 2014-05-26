

Platform a = new Platform(100, 50, 26, 5);

int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped



void setup() {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  size(480, 480);
  background(155);
=======
=======
>>>>>>> cbe11be9acd91d3e3d6d90c8ff6aa73590c40f38
  size(1000, 650);
  background(255);
  fill(0);
  rect(0,580, 1000, 100);
  p.display();
  for (Platform platform: platforms){
    platform.display(p.locX, p.locY);
  }
  //a.display(p.locX, p.locY);
<<<<<<< HEAD
>>>>>>> cbe11be9acd91d3e3d6d90c8ff6aa73590c40f38
=======
>>>>>>> cbe11be9acd91d3e3d6d90c8ff6aa73590c40f38
=======
  size(480, 120);
  background(255);
>>>>>>> parent of e0527bc... Paul's work. Git hub doesnt let me do anything.
}

void draw() {
  if (keyPressed && dir != 0){
  a.display(dir);
  }
  
}
void keyPressed(){
  if (key == 'a'){
    dir = 1;
  }
  else if (key == 'd'){
    dir = -1;
  }
  else{
    dir = 0;
  }
}
  
  
  
  



