class Button {
  float posX, posY;
  float buttonWidth, buttonHeight;
  color buttonColor;
  boolean pickColor;
  boolean picked;

  Button(float x, float y, float w, float h, color c) {
    posX = x;
    posY = y;
    buttonWidth = w;
    buttonHeight = h;
    buttonColor = c;
  }

  void showButton() {
    
    //change the stroke according to choice.
    if (picked){
      stroke(#FF0307);
      strokeWeight(2);
    }else if (hover()) {
      stroke(255);
      strokeWeight(2);
    } else {
      noStroke();
    }
    
    if (mousePressed && hover()) {
      pickColor = true;
      picked = true;
      fill(buttonColor, 100);
    } else {
      fill(buttonColor);
    }
    
    //judge which button in bt1 is picked.
    for(Button tb1:bt1){
      if(tb1 ==this){
        for(Button tb:bt1){
          if(this.picked){
            if(tb !=this){
            tb.picked=false;
            } 
          }
        }
      }  
    }
    //judge which button in bt2 is picked.
    for(Button tb1:bt2){
      if(tb1 ==this){
        for(Button tb:bt2){
          if(this.picked){
            if(tb !=this){
            tb.picked=false;
            } 
          }
        }
      }  
    }
       
    rect(posX, posY, buttonWidth, buttonHeight);
  }

  boolean hover() {
    if (mouseX < posX + buttonWidth && mouseX > posX &&
      mouseY < posY + buttonHeight && mouseY > posY) {
      return true;
    } else {
      return false;
    }
  }
}
