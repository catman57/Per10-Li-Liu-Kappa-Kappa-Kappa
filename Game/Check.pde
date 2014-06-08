class Check extends Goal{
 PImage img;
 float random;
 Check(int locX, int locY){
  super(locX, locY);
  /*random= random(10); 
  if(random<3){
    img= loadImage("drumstick.svg");
  }*/
 }
 
 Check(Platform platform){
   super(platform.locX + (int)random(platform.width + 25) - 25, platform.locY - 15 - (int)random(100));
 }
 
 
 void display(int pX, int pY){
   fill(50, 55, 100);
   super.display(pX, pY);
    
    
  }
  
  void display(int pX, int pY, int dir){
      fill(50,55,100);
      super.display(pX, pY, dir);
  }  

    
  }  
     
    
 
  
  

