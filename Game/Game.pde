

Platform[] platforms = {new Platform(200, 400, 80, 30), 
new Platform(800, 200, 120, 30),
new Platform(1200, 400, 100, 30)

};

//Platform a = new Platform(200, 200, 40, 15);
//Platform b = new Platform(800, 400, 80, 15);

Player p = new Player();

int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped

boolean a = false;
boolean d = false;
boolean w = false;

void setup() {


  size(480, 480);
  background(155);



  size(480, 480);
  background(155);


  size(1000, 650);
  background(255);
  fill(0);
  rect(0,580, 1000, 100);
  p.display();
  for (Platform platform: platforms){
    platform.display(p.locX, p.locY);
  }
  //a.display(p.locX, p.locY);

}

void draw() {
// if (keyPressed ){
      playerMove();

      background(255);
      for (Platform platform: platforms){
      platform.display(p.locX, p.locY, dir);
      }
      p.display();   
      fill(0);
      rect(0,580, 1000, 100);
      
  
  //}
  
}

void playerMove(){
     if (a){
        dir = 1;
        p.locX -= 3;
      }
      else if (d){
        dir = -1;
        p.locX += 3;
      }
      if (w){
        p.jump();
      }
        
       

}



void keyPressed(){
 if (key == 'a'){
   a = true;
 }
 if (key == 'd'){
   d = true;
 }
 if (key == 'w'){
   w = true;
 }
 
} 
  



void keyReleased(){
   if (key == 'a'){
   a = false;
 }
 if (key == 'd'){
   d = false;
 }
 if (key == 'w'){
   w = false;
 }
}

