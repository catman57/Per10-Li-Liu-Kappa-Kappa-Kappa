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
  
  int getLocX(){
     return this.locX;
  }
  int getLocY(){
      return this.locY;
  }
  int getWidth(){
      return this.width;
  }
  int getHeight(){
      return this.height;
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

    
    
  }
  
  
  boolean intersects(int objX, int objY){
    return(objX + 525 >= locX && objX + 525 <= locX + width && objY >= locY && objY <= locY + height);
    
  }

  
    
    
    
  }
  
  

