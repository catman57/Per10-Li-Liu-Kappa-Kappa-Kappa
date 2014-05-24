class Platform{
  
  int x;  //top left X coord
  int y;  //top left y coord
  int width;   
  int height;
  
  Platform(int x, int y, int width, int height){
    this.x = x; 
    this.y = y;
    this.width = width;
    this.height = height; 
  }
  

  
  void display(int dir){
 
    stroke(0);
    fill(0);
    rect(x, y, width, height);
    
    stroke(255);
    
    line(x+(width/2)+(width/2*dir*-1), y, x+(width/2)+(width/2*dir*-1), y+height);
    move(dir);
    
  }
  
  
  void move(int dir){
    x+= (1 * dir);
       
  }
  
    
    
    
  }
  
  

