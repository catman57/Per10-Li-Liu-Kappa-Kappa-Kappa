class Platform{
  
  //int x;  //top left X coord
  //int y;  //top left y coord
  
  int locX;
  int locY;
  int width;   
  int height;
  
  Platform(int locX, int locY, int width, int height){
    this.locX = locX; 
    this.locY = locY;
    this.width = width;
    this.height = height; 
  }
  

  

  
  
  
  
  
  void display(int pX, int pY){
      stroke(0);
    fill(0);
    rect(locX - pX, locY, width, height);
    
    
  }
  
  void display(int pX, int pY, int dir){
    
     

    stroke(0);

    fill(0);
    rect(locX - pX, locY, width, height);
    //rect(locX, locY, 25, 5);
   stroke(255);
   
   line( (locX-pX) + (width/2) + (width/2 * dir * -1), locY, (locX-pX) + (width/2) + (width/2 * dir * -1), locY+height);
    
  // line((locX-pX) + (width/2) + (width/2 * dir *-1), locY, (locX-pX) + (width/2) + (width/2 * dir * -1), locY+height));
   //line(x+(width/2)+(width/2*dir*-1), y-1, x+(width/2)+(width/2*dir*-1), y+height+1);
    //move(dir);
    
    
  }

  
    
    
    
  }
  
  

