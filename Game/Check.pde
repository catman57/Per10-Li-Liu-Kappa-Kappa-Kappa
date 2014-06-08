class Check extends Goal{
 PImage img;
 float random;
 boolean special;
 
 
 /*
 Check(int locX, int locY){
  super(locX, locY);
  random= random(10); 
 // if(random<3){
    img= loadImage("drumstick.svg");
 // }
 }
 */
 
 Check(Platform platform){
   super(platform.locX + (int)random(platform.width + 25) - 25, platform.locY -  20 - (int)random(200));
   if(random(100) < 10){
     special = true;
   }
   img= loadImage("nyancat.png");
 }
 

 
 void display(int pX, int pY){
   
   fill(50, 55, 100);
   if (special){
    fill(84, 227, 117); 
   }
   //super.display(pX, pY);
   imageMode(CENTER);
   image(img,locX - pX,locY);
   imageMode(CORNERS);
    
  }
  
  void display(int pX, int pY, int dir){
      fill(50,55,100);
      if (special){
        fill(84, 227, 117);
      }
      //super.display(pX, pY, dir);
      imageMode(CENTER);
      image(img,locX -pX,locY);
      imageMode(CORNERS);
  }  

    
  }  
     
    
 
  
  

