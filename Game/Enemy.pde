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
    
    
   
  
  
  
}
