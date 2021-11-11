PFont font;
PShape s;

Population population;
Button button;
int rs;

void setup() {
  size(900,600);
  
  rs=int(random(10000));
  colorMode(RGB,1.0);
  font = createFont("微软雅黑",24);
  //s = loadShape("groupLogo_200.svg"); 
  //s.disableStyle();
  int popmax = 8;
  float mutationRate = 0.05;  // A pretty high mutation rate here, our population is rather small we need to enforce variety
  // Create a population with a target phrase, mutation rate, and population max
  population = new Population(mutationRate,popmax);
  // A simple button class
  button = new Button(width/2-80,height-50,160,20, "重新生成卡通形象");
}

void draw() {
  randomSeed(rs);
  
  background(1.0);
  // Display the pallettes
  population.display();
  population.rollover(mouseX,mouseY);
  // Display some text
  textAlign(CENTER);
  fill(0);
  text("Generation #:" + population.getGenerations(),width/2,height-60);

  // Display the button
  button.display();
  button.rollover(mouseX,mouseY);
  //saveFrame("output/####.png");
  
}

// If the button is clicked, evolve next generation
void mousePressed() {
  if (button.clicked(mouseX,mouseY)) {
    population.selection();
    population.reproduction();
    save("hw8_generation"+population.getGenerations()+".png");
  }
}

void mouseReleased() {
  button.released();
}

void keyPressed(){ //save image
  if(key == 's'){
    save("hw8_generation"+population.getGenerations()+".png");
  }
}
