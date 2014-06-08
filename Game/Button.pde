class Button{
  
  
  int x, y, width, height;
  String name;
  int textSize;
  //PImage img;
  
  Button(String name, int textSize, int x, int y, int width, int height){
    this.name = name;
    this.textSize = textSize;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    
  }
  
  void display(){
    fill(0);
    textAlign(LEFT, TOP);
    textSize(textSize);
    text(name,x, y);
    
  }
  
  boolean clickedButton(int mX, int mY){
    return (mX > x && mX < x + width && mY > y && mY < y + height);
  }
  
}
