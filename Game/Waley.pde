public class Waley extends Enemy{
  


  
  //Platform curPlatform;
  int curPlatform;
  ArrayList<Platform> platforms;
  boolean jumping = false;
  
 Waley(int curPlatform, ArrayList<Platform> platforms){
    super(platforms.get(curPlatform));
    this.curPlatform = curPlatform;
    this.platforms = platforms;
    
 } 
 
 void display(int pX, int pY){
     location();
     if (!jumping)  {
       super.display(pX, pY);
      track(pX);
     }
    if (jumping){
       jumpRightPlatform(pX);
       whenToLand();
     }
      
      
   
 }
  
  void whenToLand(){
    if (locX >= platforms.get(curPlatform+1).locX){
      locY += 5;
      jumping = false;
      curPlatform++;
      rightBound = platforms.get(curPlatform).locX + width;
      
    }
    
  }
  
  void jumpRightPlatform(int pX){
        fill(70);
      rect(locX - pX , locY, 25, 30);
      locX++;
    
    
  }

 void track(int pX){

  if (pX + 525 > rightBound && locX + cur > rightBound - 40){
      locY -= 5;
      jumping = true;    
      
  }
  
  
 } 
 

  
  
 void location(){
     leftBound = platforms.get(curPlatform).locX;
     rightBound = leftBound + platforms.get(curPlatform).width; 
   
   
 }
  
  
}
