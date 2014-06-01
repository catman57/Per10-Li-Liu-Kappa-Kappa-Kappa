


 Platform[] platforms = new Platform[10];
//Platform a = new Platform(200, 200, 40, 15);
//Platform b = new Platform(800, 400, 80, 15);

Player p = new Player();

int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped

boolean a = false;
boolean d = false;
boolean w = false;

void setup() {





  size(1000, 650);
  background(255);
  fill(0);
  rect(0,580, 1000, 100);
 
//{new Platform(200, 400, 80, 30), 
//new Platform(800, 200, 120, 30),
//new Platform(1200, 400, 100, 30)
  randomSeed(0);  
int i = 0;
while (i<platforms.length){
  platforms[i]= new Platform(700+ (i*150),600-(i*50),80,40);
  i++;
}

platforms[0] = new Platform(1500, 400, 400,40);
//platforms[1] = new Platform (1000,400, 60, 100);

  p.display(platforms);
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
      p.display(platforms);   
      fill(0);
      rect(0,580, 1000, 100);
      
  
  //}
  
}

void playerMove(){
     if (a & doesNotCollide(-1)){
        dir = 1;
        p.locX -= 5;
      }
      else if (d & doesNotCollide(0)){
        
        dir = -1;
        p.locX += 5;
      }
      if (w){
        p.jump();
      }
        
       

}

boolean doesNotCollide(int shift){    //shift moves the coordinate that is checked when moving left

  //return !(platforms[0].intersects(p.locX, 551));
  
  for (Platform platform: platforms){
    if (platform.intersects(p.locX + shift*25 , p.y)){
      return false;
    }
  }
  return true;
  
  
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

