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

  
void display(){
  land();
  noStroke();
  fill(255,0,0);
  rect(x, y, 25, 30);
  
  
}

void land(){
    if (isJumping){
    yVel += gravity;
    y += yVel;
    if (yVel >= 0){

    }
    
    if (y >= 550){
          yVel = 0;
          isJumping = false;
    }
  }
  
}


void jump(){
  if (!isJumping){
    isJumping = true;
    yVel -= 20;
  }
}
  


  
  
}
  
  
  

  

