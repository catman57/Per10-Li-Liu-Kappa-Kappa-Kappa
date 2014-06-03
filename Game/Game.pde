


 ArrayList<Platform> platforms = new ArrayList<Platform>();
//Platform a = new Platform(200, 200, 40, 15);
//Platform b = new Platform(800, 400, 80, 15);
ArrayList<Check> checks = new ArrayList<Check>();
Finish finish = new Finish(2500, 565);
//Check[] checks = new Check[1];

Player p;

int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped

boolean a = false;
boolean d = false;
boolean w = false;
int savedTime;
int totalTime=1000;//1 second
int time = 0;//seconds right now
int coins= 0;
void setup() {



  savedTime= millis();
  
  size(1000, 650);
  background(204,255,255);
  
  fill(0);
  rect(0,580, 1000, 100);
  p = new Player();
//{new Platform(200, 400, 80, 30), 
//new Platform(800, 200, 120, 30),
//new Platform(1200, 400, 100, 30)

  //randomSeed(0);  
  
  /*
int i = 0;
while (i<platforms.length){
   //randomSeed(i);
   if(i<10){
  platforms[i]= new Platform(700+ (i*(int)(random(-50,50))),550-(i*50),60,40);
   }else if(i<20){
  platforms[i]= new Platform(700+(i*50),600-(i*50),60,40); 
   }
  i++;
}

*/

  createLevel();


  p.display(platforms);
  for (Platform platform: platforms){
    platform.display(p.locX, p.locY);
  }
  //a.display(p.locX, p.locY);
  for (Check check: checks){
  check.display(p.locX, p.locY);
  }
  finish.display(p.locX, p.locY);

}

void createLevel(){
  
  platforms.clear();
  int i = 0;
  int dist = 500;
  int inc = 300;
  int rand = 0;
  int width = 0;
  
  int height = 0;
  
  
  int shift = 0;
  int shifted = 0;
  while (i < 5){
    rand = (int)random(300);
    height = (int)random(85)+15;
    width = (int)random(300)+50;
    platforms.add(new Platform(dist+inc+rand, 550 - height - 30, width, 40));
    i++;
    dist = dist+inc+rand;
  }
  
 ArrayList<Platform> addPlatforms = new ArrayList<Platform>();
  for (Platform platform: platforms){                     ///meh
    if (random(100) < 30){
    // shift = (int)random(100) + 25;
    // width = (int)random(300) + 50;
    // shifted = shifted + shift + width;
     addPlatforms.add(new Platform(platform.locX + (int)random(300)-150, platform.locY - 90 - (int)random(80), (int)random(300)+75 , 40));
     
           
    }
  }
  for (Platform platform: addPlatforms){
    platforms.add(platform);
  }
    
  for (Platform platform: platforms){
        if (random(100) < 60){
    // shift = (int)random(100) + 25;
    // width = (int)random(300) + 50;
    // shifted = shifted + shift + width;
     addPlatforms.add(new Platform(platform.locX + (int)random(300)-150, platform.locY - 90 - (int)random(80), (int)random(300)+75 , 40));
     
           
    }
  }
  addPlatforms.clear();
  for (Platform platform: addPlatforms){
    platforms.add(platform);
  }
    
    
  

  
  
  
}


void draw() {
// if (keyPressed ){
  
  
  
    
  int passedTime=millis()-savedTime;
  if (passedTime>totalTime){
      time ++;
      savedTime=millis();
  }
 
  if(time>10){
    print("YOU HAVE ");
    print(20-time);
    println(" SECONDS LEFT");
  }  
  if (time == 20){//20 seconds for testing purposes. change at will. if you change this, change statement above to changed time -10 secs. 
    time = 0;
    println("YOU HAVE LOST");
    coins = 0;
    setup();
  }
      
      playerMove();
      background(204,255,255);
      textSize(50);
      text("DEATH APPROACHES ", 200,200);
      text(20-time,250,250);
      text(coins,100,200);
      for (Platform platform: platforms){
        
      platform.display(p.locX, p.locY, dir);
      }
   
   
     ArrayList<Check> toRemove = new ArrayList<Check>();
      for (Check check: checks){
        check.display(p.locX, p.locY, dir);
        
        if (check.intersects(p.locX, p.y)){
          println("fsd");
          coins ++;
         toRemove.add(check); 
        }
      }
      if (checks.isEmpty() && finish.intersects(p.locX, p.y)){
        println("You win."); 
        time = 0;
        println(coins);
        coins= 0;
        setup();
      }
      
      
      finish.display(p.locX, p.locY, dir);
      checks.removeAll(toRemove);
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

