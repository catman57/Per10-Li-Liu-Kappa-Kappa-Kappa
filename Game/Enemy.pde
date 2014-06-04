public class Enemy{
  
  int locX;
  int locY;
  
  
  Enemy(Platform platform){
    locX = platform.locX;
    locY = platform.locY - 30;
    
   
  }

  void display(int pX, int pY){
    
    noStroke();
    fill(70);
    rect(locX - pX, locY, 25, 30);
  }
    
    
  boolean intersects(Player p){
      return ( pow((p.locX + 525 - 12 -locX),2) + pow((p.y + 15 -locY), 2) <= pow(25,2));
   
   
  } 
  
  
  
}
