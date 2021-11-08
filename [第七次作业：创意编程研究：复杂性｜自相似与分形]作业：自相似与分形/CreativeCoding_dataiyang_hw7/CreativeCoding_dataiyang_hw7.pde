//hw7
float angleL ;
float angleR ;
float scaleL = 0.85;
float scaleR = 0.85;
color cl=(#F2204A);
color cl2=(#F5A1B6);

void setup() {
  size(800, 600);
}

void draw() {
  background(#B6DAEA);
  translate(width/2, height/2+300);
  Tree(10);
  
  float angle=map(mouseX, 0, width, 0, 360);
  float scale=map(mouseY, 0, height, 0, 180);
  
  angleL = map(cos(radians(angle)), -1, 1, radians(10), radians(28));
  angleR = map(sin(radians(angle)), -1, 1, radians(10), radians(28));  
  scaleL=map(cos(radians(scale)), -1, 1, 0.75, 0.88);
  scaleR=map(sin(radians(scale)), -1, 1, 0.75, 0.88);
}

void Tree(float level) {
  float dl=0.9;
  
  if (level>0) {
    strokeWeight(level+2);
    if (level>1.8) {
      stroke(#672B32);
    } else {
      stroke(#BF6C7C);
    }
    line(0, 0, 0, -80);
    if (level < 1){
      fill(cl);
      noStroke();
      ellipse(0,-110,20,40);
    }
    translate(0, -80);
    
    pushMatrix();
    cl=(#F2204A);
    rotate(-angleL);
    scale(scaleL);
    Tree(level-dl);
    popMatrix();

    pushMatrix();
    cl=cl2;
    rotate(angleR);
    scale(scaleR);
    Tree(level-dl);
    popMatrix();
  }
}

void mousePressed(){
  cl2=color(227,random(60,160),153);
}
