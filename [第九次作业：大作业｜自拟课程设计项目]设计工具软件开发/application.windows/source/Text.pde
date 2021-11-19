class Text {

  Text() {
    T = loadFont("AdobeDevanagari-Italic-48.vlw");
    //T=createFont("AdobeDevanagari-Italic", 150);
    textFont(T);
  }

  void display() {
    //println("frameCount:",frameCount);
    fill(#4D118E);

    textSize(50);
    text(string1,width/6,height*2/5);
    text(string2,width/6,height*2/5+50);
    
  }
}
