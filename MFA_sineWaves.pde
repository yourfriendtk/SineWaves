import beads.*;

AudioContext ac;
WavePlayer wp1;
Glide frequencyGlide1;
WavePlayer wp2;
Glide frequencyGlide2;

Gain g;

float angle = 0;
float angleVel = 0.1;
float r = random(110);

float angle2 = 0;
float angleVel2 = 0.1;
float r2 = random(110);

boolean bgState = true;
int c = 0;

void setup() {
  size(1200, 400);
  background(c);
  //stroke(0);
  strokeWeight(2);
  noFill();
  
  ac = new AudioContext();
  frequencyGlide1 = new Glide(ac, 20, 50);
  wp1 = new WavePlayer(ac, frequencyGlide1, Buffer.SINE);
  
  frequencyGlide2 = new Glide(ac, 20, 50);
  wp2 = new WavePlayer(ac, frequencyGlide2, Buffer.SINE);
  
  g = new Gain(ac, 1, 0.5);
  
  g.addInput(wp1);
  g.addInput(wp2);
  
  ac.out.addInput(g);
  
  ac.start();
    
}

void draw() {
  sound();
  wave();
}

void sound() {
  frequencyGlide1.setValue(r);
  frequencyGlide2.setValue(r2);
}

void wave() {
  stroke(0);
  //  ellipse(0, 1200, 100, 400);
  beginShape();
  for (int x = 0; x <= width; x += r) {
    float y = map(sin(angle), -1, 1, 0, height);
    vertex(x, y);
    angle +=angleVel;
  } 
  endShape();
  stroke(255);
  beginShape();
  for (int x = 0; x <= width; x += r2) {
    float y = map(sin(angle2), -1, 1, 0, height);
    vertex(x, y);
    angle2 +=angleVel2;
  } 
  endShape();
}

void mouseClicked() {
  if (bgState = true) {
    c = 255;
  } 
  else {
    c = 0;
  }
  background(c);
  r = random(110);
  r2 = random(110);
}

