import peasy.*;

ArrayList<Walker> texasRangers;
float rand;
float timeStep;
int globalBoundaries;
int nbrRangers;

PeasyCam cam;

void setup(){
  frameRate(30);
  fullScreen(P3D);
  colorMode(HSB);
  noFill();
  texasRangers = new ArrayList<Walker>();
  rand = 10;
  timeStep = 0.001;
  globalBoundaries = 500;
  nbrRangers = 300;
  for(int i=0; i<nbrRangers; i++){
    float initSpeedX = random(random(-5, -2), random(2, 5));
    float initSpeedY = random(random(-5, -2), random(2, 5));
    float initSpeedZ = random(random(-5, -2), random(2, 5));
    Walker texasRanger = new Walker(initSpeedX, initSpeedY, initSpeedZ);
    texasRangers.add(texasRanger);
  }
  stroke(255, 50);
  cam = new PeasyCam(this, 700);
}

void draw(){
  background(0);
  for(int i=0; i<nbrRangers; i++){
    Walker texasRanger = texasRangers.get(i);
    texasRanger.update();
    texasRanger.display();
  }
}
