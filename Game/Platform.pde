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
    noStroke();
    fill(0);
    rect(locX - pX, locY, width, height);
    
    
  }
  
  void display(int pX, int pY, int dir){
    
     
    noStroke();

    fill(0);
    rect(locX - pX, locY, width, height);
    //rect(locX, locY, 25, 5);
   /*
   fill(255);
   
   if (dir == 1){
   rect( (locX-pX), locY, -3, height);
   }
   else{
     rect( (locX-pX) + width, locY, 3, height);
   }
   */
   
   
   //line( (locX-pX) + (width/2) + (width/2 * dir * -1), locY, (locX-pX) + (width/2) + (width/2 * dir * -1), locY+height);
 //  line( (locX-pX) + (width/2) + (width/2 * dir * -1 -dir), locY, (locX-pX) + (width/2) + (width/2 * dir * -1 - dir), locY+height); 
  // line((locX-pX) + (width/2) + (width/2 * dir *-1), locY, (locX-pX) + (width/2) + (width/2 * dir * -1), locY+height));
   //line(x+(width/2)+(width/2*dir*-1), y-1, x+(width/2)+(width/2*dir*-1), y+height+1);
    //move(dir);
    
    
  }

  
    
    
    
  }
  
  

