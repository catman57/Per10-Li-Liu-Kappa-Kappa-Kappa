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
   // println(yVel);
    if (isJumping){
      yVel += gravity;
      //y += yVel;

      if (!isLanding && landed(platforms, yVel, 0)){
        y -= needToFall;
       yVel = 0;
       isLanding = true;
       isJumping = true;
       println("up stop");
      }
    
      
      else if (isLanding && landed(platforms, yVel, 1)){
        
        isJumping = false;
        isLanding = false;
        yVel = 0;
        y += needToFall;
        println("fall stop");
      }
      else{
       y += yVel; 
      }
    
    
           if (y + yVel>= 550){
            yVel = 0;
           y += (580-(y+30));
            isJumping = false;
            isLanding = false;
      }
    
      
      if (yVel >= 0){
        isLanding = true;
      }
      

  }
  
}

boolean landed(Platform[] platforms, int yVel, int dir){   //if dir==1, for falling; if dir==0, for checking if hit the bottom of a platform
  for (Platform platform : platforms){
    if (platform.intersects(locX, y + 30*dir + yVel)
       || platform.intersects(locX - 25, y + 30*dir + yVel) ){   //If either edge of player is on the platform
       

      needToFall = abs(platform.locY + 40 - 40*dir - (y + 30*dir));
      return true;
    }
    
  }
  return false;
   
}






void jump(){
  if (!isJumping){
    isJumping = true;
    isLanding = false;
    yVel -= 20;
  }
}
  


  
  
}
  
  
  

  

