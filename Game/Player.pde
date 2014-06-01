class Player{

//location as seen on screen, usually stationary
int x = 500;  
int y = 550;  
//location relative to the map
int locX = 25;
int locY = 100;

int yVel = 0;
int gravity = 1;
boolean isJumping = false;
boolean isLanding = false;
int needToFall = 0;

  
void display(Platform[] platforms){
  land(platforms);
  
  noStroke();
  fill(255,0,0);
  rect(x, y, 25, 30);
  
  
}

void land(Platform[] platforms){
    if (isJumping){
    yVel += gravity;
    //y += yVel;
    
    
    
    if (isLanding && landed(platforms, yVel)){
      
      isJumping = false;
      isLanding = false;
      yVel = 0;
      y += needToFall;
    }
    else{
     y += yVel; 
    }
    
    
    
    
    
    if (yVel >= 0){
      isLanding = true;
    }
    
    if (y >= 550){
          yVel = 0;
          isJumping = false;
    }
  }
  
}

boolean landed(Platform[] platforms, int yVel){   //doesn't work yet
  for (Platform platform : platforms){
    if (platform.intersects(locX, y + 30 + yVel  )){
      println(platform.locY);
      println(y+30);
      println(platform.locY - (y+30));
      println();
      needToFall = platform.locY - (y + 30);
      return true;
    }
    
  }
  return false;
  
  
}

void jump(){
  if (!isJumping){
    isJumping = true;
    yVel -= 20;
  }
}
  


  
  
}
  
  
  

  

