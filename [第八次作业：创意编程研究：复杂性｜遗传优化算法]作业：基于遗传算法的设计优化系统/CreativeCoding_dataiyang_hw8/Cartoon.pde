class Cartoon{
  DNA dna;          // Design's DNA
  int width=200;
  int height=200;
  

  Cartoon(DNA dna_){
    dna = dna_;
  }
    
  void display() {
  rectMode(CENTER);
  strokeWeight(1);
  stroke(0);
  
  color skincolor=color(dna.genes[0], dna.genes[1], dna.genes[2]);
  color haircolor=color(dna.genes[3+0], dna.genes[3+1], dna.genes[3+2]);
  color eyecolor=color(dna.genes[6+0], dna.genes[6+1], dna.genes[6+2]);
  color mousecolor=color(dna.genes[9+0], dna.genes[9+1], dna.genes[9+2]);
  
  float earY= height/2+map(dna.genes[12], 0, 1, -width/20, width/20);
  float eyexoffset= map(dna.genes[13], 0, 1, -width/40, width/40);
  float eyeyoffset= map(dna.genes[14], 0, 1, -width*0.015, width*0.015);
  float mousewidth=map(dna.genes[15], 0, 1, width*0.06, width*0.16);
  float mouseheight=map(dna.genes[16], 0, 1, width*0.015, width*0.16);
  float hairamount=dna.genes[17]*500;
  
  //head and ears
  float headwidth= width*0.6;
  float headheight=height*0.825;
  float earwidth=width*0.15;
  float earheight=width*0.16;
  
  fill(skincolor);
  ellipse(width/2+ headwidth/2,  earY, earwidth, earheight);
  ellipse(width/2- headwidth/2,  earY, earwidth, earheight);
  
  fill(0, 0.1);
  noStroke();
   ellipse(width/2+ (headwidth/2)*0.95,  earY, earwidth, earheight);
  ellipse(width/2- (headwidth/2)*0.95,  earY, earwidth, earheight);
  
  fill(skincolor);
  stroke(0);
  rect(width/2, height/2,headwidth, headheight, random(70, 80));
  
  //eyes
  float eyeheight= width*0.2;
  float eyewidth= width*0.16;
  float squint= 6;

  fill(0, 0.1);
  noStroke();
  ellipse(width/2+eyewidth, height/2-eyeheight, 35, 35-squint);
  ellipse(width/2-eyewidth, height/2-eyeheight, 35, 35-squint);
  
  fill(1);
  stroke(0);
  ellipse(width/2+eyewidth, height/2-eyeheight, 25, 25-squint);
  ellipse(width/2-eyewidth, height/2-eyeheight, 25, 25-squint);
  
  fill(eyecolor);
  ellipse(width/2+eyewidth+eyexoffset, height/2-eyeheight +eyeyoffset, 12,12);
  ellipse(width/2-eyewidth+eyexoffset, height/2-eyeheight+eyeyoffset, 12,12);
  
   //eyebrows
  stroke(haircolor);
  float outeroffset= random(-5, 5);
  float inneroffset= random(5, -5);
  line(width/2 -eyewidth-12, height/2-eyeheight-18+outeroffset, (width/2 - eyewidth)+ 12, height/2-eyeheight-18+inneroffset );
  line(width/2 + eyewidth-12, height/2-eyeheight-18+inneroffset, width/2+ eyewidth+12, height/2-18-eyeheight+outeroffset);
  
  //mouth
  fill(mousecolor);
  stroke(0);
  ellipse(width/2, random(height*0.65, height*0.75), mousewidth, mouseheight);
  
 //hair
  stroke(haircolor);
  strokeWeight(0.5);
  noFill();
  for(int i=0; i<hairamount; i++){
    float rootx= width/2 + random(-headwidth/4, headwidth/4);
    float rooty= height/2 - headheight/2 + random(0, 12);
    bezier(rootx, rooty, rootx, rooty, rootx+ random(-15, 15), rooty+random(2, 10), rootx+ random(-15, 15), rooty=random(5, 25));
  }
  
  //nose
  noStroke();
  fill(0, 30);
  ellipse(width/2, width/2-eyewidth+ random(15, 25), 15, 5);
  }
}
