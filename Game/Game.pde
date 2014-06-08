import ddf.minim.*;
Minim minim;
AudioPlayer player;

//Game elements
ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Check> checks = new ArrayList<Check>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Finish finish;
//PImage img;
Player p;

//Controls
boolean a = false;
boolean d = false;
int dir = 0;  // Direction: 1 for right, -1 for left, 0 for stopped

//Time
int savedTime;
int totalTime=1000;//1 second
int time = 0;//seconds right now

//Lives
int  safeTime;
boolean attacked = false;
int lives = 3;

//Start Screen
//Button startButton = new Button("Start", 50, 400, 450, 120, 50);
boolean startedGame = false;
boolean restartedGame = true;

//Counters for coins, etc.
int coins = 0;

//background color
int ri = 204;//186;
int gi = 255;//216;
int bi = 255;
int rf = 0;
int gf = 28;
int bf = 64;
double r = ri;
double g = gi;
double b = bi;
int divisions = 100;
int soundInc = 0;


void setup() {

  //sound
  minim= new Minim(this);
  player= minim.loadFile("nyancat.mp3");
  player.play(); 
  player.setGain(0);
  //background
  size(1000, 650);
  background(204, 255, 255);
  
  
        fill(0);
  textSize(30);
  text("Press any button to start.", 285, 350);
 
}

void setupLevel(){
 
  
  createLevel();


  //Initially display game elements
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
  p = new Player();

  //Time
  savedTime= millis();
  time = 0;
  
  //Clear game elements, initialize counters
  platforms.clear();
  enemies.clear();
  checks.clear();
  attacked = false;
  //lives = 3;
  coins = 0;
  platforms.add(new Platform(500, 400, 100, 25)); //base starting platform
  
  
  //Generating rest of platforms
  int leapDist = 50;
  int i = 0;
  while (i < 10){
    
    Platform previous = platforms.get(i);
    int newLocX = previous.locX + previous.width + (int)random(150) + 50;
    int newLocY;
    int oldLocY = platforms.get(i).locY;
    if (oldLocY < 100){      
       newLocY =  oldLocY + (int)random(150);
    } else if (oldLocY > 500){
       newLocY = oldLocY - (int)random(150);
    }else{
       newLocY = oldLocY + (int)random(250) - 125; 
    }
    
    platforms.add(new Platform(newLocX, newLocY, (int)random(250) + 75, 25));
    
    i++;
    
  }
  
  
  //Generating other game elements
 ArrayList<Platform> addPlatforms = new ArrayList<Platform>();
 i = 1;
  while (i < platforms.size()){     
    if (random(100) < 40)     enemies.add(new Enemy(platforms.get(i))); 
    if (random(100) < 50)     checks.add(new Check(platforms.get(i)));
    i++;
  }
  finish = new Finish(platforms.get(platforms.size()-1));

    /* (For creating multi-layered platforms)
  for (Platform platform: platforms){
        if (random(100) < 50){
   
     addPlatforms.add(new Platform(platform.locX - (int)random(100), platform.locY - 90 - (int)random(80), (int)random(300)+75 , 40));
     
           
    }
  }
  addPlatforms.clear();
  for (Platform platform: addPlatforms){
    platforms.add(platform);
  }
  */
  
  

  
  
  
}


void startScreen(){

    
    if (keyPressed){
      startedGame = true;
      setupLevel();
    }
    
}

void ending(){
  if (keyPressed){
    restartedGame = false;
    startedGame = true;
    player.setGain(0);
    lives = 3;
    setupLevel();
    
  }else{
  background(0); 
  player.setGain(-100);
  fill(255);
  textSize(30);
  text("Press any button to restart.", 275, 350);
  }
}


void draw() {
  
  if (!startedGame){
    startScreen();
    if (!restartedGame){
      ending();
    }
  } else{
  
  
  if (p.y > 650){
    
    restartedGame = false;
    startedGame = false;
    //setupLevel();  //gameover if fall
  }
  
    
  //Time
  int passedTime=millis()-savedTime;
  if (passedTime>totalTime){
      time++;
      savedTime=millis();
        if (time > 10){
          player.setGain(player.getGain() - 2);
        }
  }if (time == 30){//20 seconds for testing purposes. change at will. if you change this, change statement above to changed time -10 secs. 
    
    println("YOU HAVE LOST");
    restartedGame = false;
    startedGame = false;
    //setupLevel();  //gameover out of time
  }
      
      playerMove();
      colorBackground();
      //background(204,255,255);
      textSize(30);
      text("DEATH APPROACHES ", 200,200);
      text(30-time,250,250);
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
      if (enemies.isEmpty() && finish.intersects(p.locX, p.y)){
        println("You win."); 
        time = 0;
        println(coins);
        coins= 0;
        lives++;
        setupLevel();
      }
      
      
      finish.display(p.locX, p.locY, dir);
      checks.removeAll(toRemove);
  
}


void displayEnemies(){
       Enemy[] toKill = new Enemy[1];
       for (Enemy enemy: enemies){
             enemy.display(p.locX, p.locY); 
             if (enemy.locY > 650){
               toKill[0] = enemy;
             }
             if (enemy.jumpKilled(p)){
               
               
             }
            else if (!attacked && enemy.intersects(p)){
                lives--;
                safeTime = millis();
                attacked = true;
                //break;

            }
       }
       
      enemies.remove(toKill[0]);
             
      
       
    
     if (lives == 0){
    restartedGame = false;
    startedGame = false;
       //setupLevel();
       
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



void endLevel(){
  startedGame = false;
  platforms.clear();
  enemies.clear();
  checks.clear();
  
  
  
}



void colorBackground(){
  
    
  if (time < 10){
    background(ri, gi, bi);
  }
  else if (time == 10){
    r = ri;
    g = gi;
    b = bi;
    background(ri, gi, bi);
  }else{
     r = r + (rf - ri)*.00115;
     g = g + (gf - gi)*.00115;
     b = b + (bf - bi)*.00115;
    background((int)r,(int)g, (int)b);
  }
  
}


