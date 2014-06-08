import ddf.minim.*;
Minim minim;
AudioPlayer player;
ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Check> checks = new ArrayList<Check>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Finish finish;
PImage img;
Player p;

int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped

boolean a = false;
boolean d = false;

int savedTime;
int totalTime=1000;//1 second
int time = 0;//seconds right now
int coins= 0;



int  safeTime;
boolean attacked = false;
int lives = 3;


boolean startedGame = false;
Button startButton = new Button("Start", 50, 400, 450, 120, 50);

void setup() {


  minim= new Minim(this);
  player= minim.loadFile("nyancat.mp3");
  player.play(); 
  
  size(1000, 650);
  background(204, 255, 255);
  
 

}

void setupLevel(){
   savedTime= millis();
  

  
  background(204,255,255);
  
  fill(0);
  //rect(0,580, 1000, 100);
  p = new Player();


  createLevel();


  p.display(platforms);
  for (Platform platform: platforms){
    platform.display(p.locX, p.locY);
  }
  for (Check check: checks){
  check.display(p.locX, p.locY);
  }
  finish.display(p.locX, p.locY);
  for (Enemy enemy: enemies){
   enemy.display(p.locX, p.locY); 
    
  }
}



void createLevel(){
  
  
  fill(0);
  //rect(0,580, 1000, 100);
  p = new Player();


  time = 0;
  platforms.clear();
  enemies.clear();
  checks.clear();
  attacked = false;
  lives = 3;
  coins = 0;
  int i = 0;
//  int dist = 500;
//  int inc = 300;
  //int rand = 0;
//  int width = 0;
  
  //int height = 0;
  
  
  int leapDist = 50;
  
  /*
  int shift = 0;
  int shifted = 0;
  */
  
  platforms.add(new Platform(500, 400, 100, 25));
  
  while (i < 10){
   // rand = 0;// (int)random(300);
 //   height = (int)random(85)+15;
    Platform previous = platforms.get(i);
    int newLocX = previous.locX + previous.width + (int)random(150) + 50;
    int newLocY;
    int oldLocY = platforms.get(i).locY;
    if (oldLocY < 100){
      
       newLocY =  oldLocY + (int)random(150);
    }
    else if (oldLocY > 500){
       newLocY = oldLocY - (int)random(100);
    }
    else{
       newLocY = oldLocY + (int)random(150) - 75; 
    }
    
    /*
    if (random(100) < 25){
      newLocY = 400 + (int)random(210);
    }
    
    */
    
    platforms.add(new Platform(newLocX, newLocY, (int)random(250) + 75, 25));
    i++;
   // dist = dist+inc+rand;
  }
  
 ArrayList<Platform> addPlatforms = new ArrayList<Platform>();
 i = 1;
  while (i < platforms.size()){  
   
    if (random(100) < 25)     enemies.add(new Enemy(platforms.get(i))); 
    if (random(100) < 50)     checks.add(new Check(platforms.get(i)));
    i++;
  }
  finish = new Finish(platforms.get(platforms.size()-1));
  enemies.add(new Waley(0, platforms));
  
  
    /*

    ///meh
    if (random(100) < 30){
    // shift = (int)random(100) + 25;
    // width = (int)random(300) + 50;
    // shifted = shifted + shift + width;
     addPlatforms.add(new Platform(platform.locX + (int)random(300)-150, platform.locY - 90 - (int)random(80), (int)random(300)+75 , 40));
     
           
    }
  }
  for (Platform platfowrm: addPlatforms){
    platforms.add(platform);
  }
  
  */
    
  for (Platform platform: platforms){
        if (random(100) < 50){
   
     addPlatforms.add(new Platform(platform.locX - (int)random(100), platform.locY - 90 - (int)random(80), (int)random(300)+75 , 40));
     
           
    }
  }
  addPlatforms.clear();
  for (Platform platform: addPlatforms){
    platforms.add(platform);
  }
  
  

  
  
  
}


void startScreen(){
    startButton.display();
    
    if (mousePressed && startButton.clickedButton(mouseX, mouseY)){
      startedGame = true;
      setupLevel();
    }
    
}


void draw() {
  
  if (!startedGame){
    startScreen();
  }
  else{
  
  
  if (p.y > 650){
    setupLevel();
  }
  
    
  int passedTime=millis()-savedTime;
  if (passedTime>totalTime){
      time ++;
      savedTime=millis();
  }
 

  if (time == 40){//20 seconds for testing purposes. change at will. if you change this, change statement above to changed time -10 secs. 
    
    println("YOU HAVE LOST");
    setupLevel();
  }
      
      playerMove();
      background(204,255,255);
      textSize(50);
      text("DEATH APPROACHES ", 200,200);
      text(40-time,250,250);
      text(coins,100,200);
      text(lives,100,125);

   
   
      displayChecks();
      displayPlatforms();
      displayEnemies();
   

      p.display(platforms);   
      fill(0);
      //rect(0,580, 1000, 100);
      
  //image(img,p.x,p.y);
  //}
  
}
  
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
    
    
  
void displayPlatforms(){
      for (Platform platform: platforms){
        
      platform.display(p.locX, p.locY, dir);
      }

}


void displayChecks(){
       ArrayList<Check> toRemove = new ArrayList<Check>();
      for (Check check: checks){
        check.display(p.locX, p.locY , dir);
        
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
        setupLevel();
      }
      
      
      finish.display(p.locX, p.locY, dir);
      checks.removeAll(toRemove);
  
}


void displayEnemies(){
     
       for (Enemy enemy: enemies){
             enemy.display(p.locX, p.locY); 
             if (!attacked && enemy.intersects(p)){
                lives--;
                safeTime = millis();
                attacked = true;
                //break;

             }
       }
    
     if (lives == 0){
       setupLevel();
       
     }
     else if (lives != 3){
       if (millis() - 1500 > safeTime){
         attacked = false;
     }
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
   //w = true;
   p.jump();
 }
 
} 
  



void keyReleased(){
   if (key == 'a'){
   a = false;
 }
 if (key == 'd'){
   d = false;
 }/*
 if (key == 'w'){
   w = false;
 }*/
}

