class Goal{
  
  int locX;
  int locY;
  PImage img;
  
  Goal(int locX, int locY){
    this.locX = locX;
    this.locY = locY;
    //img = loadImage("nyanright0.png");
    
    
  }
  
  
   Goal(Platform platform){
     this.locX = platform.locX + (int)random(platform.width + 25) - 25;
     this.locY = platform.locY - 15 - (int)random(50);
 }
    
    
    void display(int pX, int pY){
    //img= loadImage("nyanright0");
    noStroke();
    //fill(50, 55, 100);
    rect(locX - pX, locY, 20, 20);
    //image(img,locX,locY);
    
  }
  
  void display(int pX, int pY, int dir){
    
    //img = loadImage("nyanright0");
    noStroke();

    //fill(50, 55, 100);
    ellipse(locX - pX, locY, 25, 25);
  //  image(img,locX-pX,locY);
    
    
  }  
  
  
  boolean intersects(int objX, int objY){
    return ( pow((objX + 525 - 12 -locX),2) + pow((objY  -locY), 2) <= pow(25,2));
    
    
  }
    
    
    
  
  
  
  
}
