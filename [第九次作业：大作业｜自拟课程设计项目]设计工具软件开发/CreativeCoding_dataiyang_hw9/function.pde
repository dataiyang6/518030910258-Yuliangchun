void function1(){
  pushMatrix();
  scale(width/(width1),height/(height1));
  
  for (int i=0; i < balls.size(); i++){
    Ball ball=balls.get(i);
    ball.run();
    
    if (ball.radius < 0){
      balls.remove(i);
    } 
  }

  if (mousePressed){
     for (int i = 0; i < 6; i++){
       balls.add(new Ball(int(mouseX*width1/width),int(mouseY*height1/height) , color(img.get(int(mouseX*width1/width),int(mouseY*height1/height)))));
    }
  }
  popMatrix();
}

void function3(){
  pushMatrix();
  scale(width/(width1),height/(height1));
  
  switch(mode%Pattern3ModeNum){
    case 0:
      for(int i=0;i<500;i++){
        int xx=floor(random(width1)); //Take the whole down
        int yy=ceil(random(height1)); //round up to an integer
        
        color c =img.get(xx,yy);
        //float b =brightness(c);
        //float eSize=map(b,0,255,5,20);
        float eSize= map(mouseX, 0, width, 1, 30);
        noStroke();
        fill(c);
        //ellipse(width/2,width/2,width/2,width/2);
        //ellipse(mouseX,mouseY,50,50);
        //ellipse(xx,yy,1,1);
        ellipse(xx,yy,eSize,eSize);
      }    
      break;
      
    case 1:
      for (int i = 0; i< 50; i ++) {
        int xx = (int)random(width1);
        int yy = (int)random(height1);
        color fc = img.get(xx, yy);
        fill(fc);
        noStroke();
        float eSize= map(mouseX, 0, width, 1, 40);
        
        pushMatrix();
        translate(xx, yy);
        rotate(random(TWO_PI));
        rect(0, 0, eSize, eSize);
        popMatrix();
        //rect(xx, yy, 20, 20);
      }    
      break;
      
    case 2:
      for (int i = 0; i< 500; i ++) {
        int xx = (int)random(width1);
        int yy = (int)random(height1);
        color fc = img.get(xx, yy);
        fill(fc);
        noStroke();
        float s1 = map(mouseX, 0, width, 1, 6);
        float s2 = map(mouseY, 0, height, 10, 100);  
        //float h = hue(fc);
        //float angle = map(h, 0, 255, 0, PI);
        
        pushMatrix();
        translate(xx, yy);
        rotate(random(PI));
        //rect(0, 0, 2, 50);
        rect(0, 0, s1, s2);
        popMatrix();
      }        
      break;
      
    case 3:
      float s1 = map(mouseX, 0, width, 1, 100);
      float s2 = map(mouseY, 0, width, 1, 100);  
      for (int y = 0; y < img.height; y+=s2 ) {
        for (int x = 0; x < img.width; x+=s1) {
          int loc = x + (y * img.width);
          fill(img.pixels[loc]);
          noStroke();
          rect(x, y, s1, s2);
        }
      }        
      break;  
      
    case 4:
      image(img,0,0);
      float l = map(mouseX, 0, width, 0, 1);
      // BLUR, POSTERIZE, THRESHOLD, INVERT, GRAY, ERODE, DILATE
      filter(THRESHOLD, l);        
      break;        
  }
  
  popMatrix();
    
  if(mousePressed){
    initiate();
  }
}

void function2(){
  pushMatrix();
  scale(width/(width1),height/(height1));
  
  if(mousePressed){
    initiate();
  }
  
  int index = 0;
  for (int y = 0; y < height1; y+=1) {
    for (int x = 0; x < width1; x+=1) {
      if (random(20000) < 1) {
        color pixelColor = img.pixels[index];
        
        switch(mode%Pattern2ModeNum){
        case 0:
          float s1 = map(mouseX, 0, width, 10, 255);    
          pixelColor = color(pixelColor, int(s1));
          break;
        case 1:
          pixelColor = color(pixelColor, 100);
          break;          
        }
       
        pushMatrix();
        translate(x, y);
        rotate(radians(random(-90, 90)));
        
        if (frameCount < 20) {
          paintStroke(random(150, 250), pixelColor, (int)random(20, 40));
        } else if (frameCount < 50) {
          paintStroke(random(75, 125), pixelColor, (int)random(8, 12));
        } else if (frameCount < 300) {
          paintStroke(random(30, 60), pixelColor, (int)random(1, 4));
        } else if (frameCount < 350) {
          paintStroke(random(5, 20), pixelColor, (int)random(5, 15));
        } else if (frameCount < 600) {
          paintStroke(random(1, 10), pixelColor, (int)random(1, 7));
        }
        
        popMatrix();
      }
      index += 1;
    }
  }
  
  if (frameCount > 600) {
    
  }
  
  popMatrix();
}

void paintStroke(float strokeLength, color strokeColor, int strokeThickness) {
  float stepLength = strokeLength/4.0;
  
  // Determines if the stroke is curved. A straight line is 0.
  float tangent1 = 0;
  float tangent2 = 0;
  
  if (random(1.0) < 0.7) {
    tangent1 = random(-strokeLength, strokeLength);
    tangent2 = random(-strokeLength, strokeLength);
  } 
  
  // Draw a big stroke
  noFill();
  stroke(strokeColor);
  strokeWeight(strokeThickness);
  curve(tangent1, -stepLength*2, 0, -stepLength, 0, stepLength, tangent2, stepLength*2);
  
  switch(mode%Pattern2ModeNum){
  case 0:
    break;
  case 1:
    int z = 1;
    // Draw stroke's details
    for (int num = strokeThickness; num > 0; num --) {
      float offset = random(-50, 25);
      color newColor = color(red(strokeColor)+offset, green(strokeColor)+offset, blue(strokeColor)+offset, random(100, 255));
      stroke(newColor);
      strokeWeight((int)random(0, 3));
      curve(tangent1, -stepLength*2, z-strokeThickness/2, -stepLength*random(0.9, 1.1), z-strokeThickness/2, stepLength*random(0.9, 1.1), tangent2, stepLength*2);
      z += 1;
    }
    break;          
  }

}
