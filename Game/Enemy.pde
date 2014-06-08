public class Enemy{
  
  int locX;
  int locY;
  int animation1;
  int animation2;
  int leftBound;
  int rightBound;
  int cur = 1;
  int dir = 1;
  PImage img;
  Enemy(Platform platform){
    locX = platform.locX + (int)random(platform.width)-30;
    locY = platform.locY - 30;
    leftBound = platform.locX;
    rightBound = leftBound + platform.width;
    
   
  }

  void display(int pX, int pY){
    
    noStroke();
    fill(70);
    if (dir==1){
    img = loadImage("nyanright"+animation1+".png");
    animation1++;
      if(animation1>11){
        animation1=0;
      }
    }else{
      img = loadImage("nyanleft"+animation2+".png");
      if(animation2>11){
        animation2=0;
      }
    }
    //rect(locX - pX + cur, locY, 25, 30);
    if (locX + cur  + 30 < rightBound && dir == 1){
      cur++;
      image(img,locX+cur+30,locY);  
    }
    if (locX + cur + 30 == rightBound){
       dir = -1; 
       image(img,locX+cur+30,locY);
    }
    if (locX + cur  == leftBound){
       dir = 1; 
       image(img,locX+cur,locY);
    }
    if (locX + cur > leftBound && dir == -1){
       cur--; 
       image(img,locX+cur,locY);
    }
    
  

    
     
  }
    
    
  boolean intersects(Player p){
      return ( pow((p.locX + 525 - 25 - (locX+cur)),2) + pow((p.y - locY), 2) <= pow(25,2));
   
   
  } 
  
  
  
}
