class Finish extends Goal{
  PImage img; 

 Finish(int locX, int locY){
  super(locX, locY); 
  //img = loadImage("nyancat0.png");
 }
 
  
     Finish(Platform platform){
       super(platform);
       img = loadImage("warpgate.png");
 }
 
 void display(int pX, int pY){
   fill(204, 153, 0);
   //per.display(pX, pY);
   //super.display(pX, pY);
   imageMode(CENTER);
   image(img,locX - pX,locY);
   imageMode(CORNERS);
    
  }
    
  
  
  void display(int pX, int pY, int dir){
      fill(204, 153, 0);
      //super.display(pX, pY, dir);
      imageMode(CENTER);
      image(img,locX-pX,locY);
      imageMode(CORNERS);
  }  

    
  }  
     
    
 
  
  

