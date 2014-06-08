public class Enemy{
  
  int locX;
  int locY;
  
  int leftBound;
  int rightBound;
  int cur = 1;
  int dir = 1;
  
  Enemy(Platform platform){
    locX = platform.locX + (int)random(platform.width)-30;
    locY = platform.locY - 30;
    leftBound = platform.locX;
    rightBound = leftBound + platform.width;
    
   
  }

  void display(int pX, int pY){
    
    noStroke();
    fill(70);
    //rect(locX - pX + cur, locY, 25, 30);
    if (locX + cur  + 30 < rightBound && dir == 1){
      cur++;}
    if (locX + cur + 30 == rightBound){
       dir = -1; 
    }
    if (locX + cur  == leftBound){
       dir = 1; 
    }
    if (locX + cur > leftBound && dir == -1){
       cur--; 
    }
    image(loadImage("nyanleft"+".png"), locX -pX + cur, locY);
      

    
     
  }
    
    
  boolean intersects(Player p){
      return ( pow((p.locX + 525 - 25 - (locX+cur)),2) + pow((p.y - locY), 2) <= pow(25,2));
   
   
  } 
  
  
  
}
