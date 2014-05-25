class Player{

//location as seen on screen, usually stationary
int x = 500;  
int y = 550;  
//location relative to the map
int locX = 25;
int locY = 100;

  
void display(){
  noStroke();
  fill(255,0,0);
  rect(x, y, 25, 30);
  
}
  
}
