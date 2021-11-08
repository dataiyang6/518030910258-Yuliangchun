class  Ball {
  float positionX;
  float positionY;
  float velocityX;
  float velocityY;
  color c;
  
  float dd;
  
  Ball() {
    positionX=mouseX;
    positionY=mouseY;
    velocityX=0;
    velocityY=0;
    c=color(random(100,200),random(100,120), random(100,250), random(180,250));
    dd=random(1, 30);
  }
  
  void update() {
    
    float accelerationX = 0, accelerationY = 0;
    //velocityX=0;
    //velocityY=0;
    
    for(Ball b : balls){
      float distanceX = b.positionX - positionX;
      float distanceY = b.positionY - positionY;
      float distance = sqrt(distanceX * distanceX + distanceY * distanceY);
      
      if (distance >0){
        if (distance < 1) distance = 1;
        
        float force = (distance - 300)*b.dd / distance;       
        accelerationX += force * distanceX;
        accelerationY += force * distanceY;
      } 

      velocityX = velocityX * 0.99 + accelerationX*dd/1000000;
      velocityY = velocityY * 0.99 + accelerationY*dd/1000000;

    }
    
    positionX += velocityX;
    positionY += velocityY;  

    fill(c);
    ellipse(positionX, positionY, dd, dd);
    
  }
  
}
