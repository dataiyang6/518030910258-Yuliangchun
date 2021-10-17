//hw4
PFont font;
String txt= "create";

void setup(){
  size(600,600);
  background(255);

  font = createFont("Arial",24);
  frameRate(5);
}

void draw(){
  background(255);
  textFont(font);
  textSize(125);
 
  color thecolor=color(85,210,215);
  float tHeight = 0;
  float tHeight2 = 0;
  float ttW = textWidth(txt);
  float tH=0;
  
  for(int i = 0; i < txt.length(); i ++){
    tH =random(120,122);
    
    //use mousePressed to change
    if(mousePressed == true){
      tHeight =random(-height/5,height/5);
      thecolor =color(random(0,255),random(0,255),random(0,255));
      tH =tH*random(0.5,1.2);
    }else{
      tHeight = 0;
      thecolor=color(85,210,215);
    }
    
    textSize(tH);
    fill(thecolor);
    char c = txt.charAt(i);
    float tW = textWidth(c);
    println(tW);
    text(c,width/2-ttW*3/4+tHeight2+tW*random(0,0.5),height/2+tHeight);
    tHeight += tW;
    tHeight2 += tW*1.5;
  }    
}
