class Walker{
  ArrayList<PVector> points;
  float xPos;
  float yPos;
  float zPos;
  float xSpeed;
  float ySpeed;
  float zSpeed;
  float timeX;
  float timeY;
  float timeZ;
  boolean inBounds;
  
  float hue;
  
  Walker(float xs, float ys, float zs){
    this.points = new ArrayList<PVector>();
    this.points.add(new PVector(0, 0, 0));
    this.xPos = 0;
    this.yPos = 0;
    this.zPos = 0;
    this.xSpeed = xs;
    this.ySpeed = ys;
    this.zSpeed = zs;
    this.timeX = random(10000);
    this.timeY = random(10000);
    this.timeZ = random(10000);
    this.inBounds = true;
    
    this.hue = random(255);
  }
  
  void update(){
    if(this.inBounds){
      PVector next_point = new PVector();
      float curr_xSpeed;
      float curr_ySpeed;
      float curr_zSpeed;
      if(this.points.size() == 0){
        curr_xSpeed = this.xSpeed;
        curr_ySpeed = this.ySpeed;
        curr_zSpeed = this.zSpeed;
      } else {
        float varX = noise(timeX);
        float varY = noise(timeY);
        float varZ = noise(timeZ);
        varX = map(varX, 0, 1, -rand, rand);
        varY = map(varY, 0, 1, -rand, rand);
        varZ = map(varZ, 0, 1, -rand, rand);
        curr_xSpeed = varX;
        curr_ySpeed = varY;
        curr_zSpeed = varZ;
        this.timeX += timeStep;
        this.timeY += timeStep;
        this.timeZ += timeStep;
      }
      this.xPos += curr_xSpeed;
      this.yPos += curr_ySpeed;
      this.zPos += curr_zSpeed;
      next_point.x = this.xPos;
      next_point.y = this.yPos;
      next_point.z = this.zPos;
      this.xSpeed = curr_xSpeed;
      this.ySpeed = curr_ySpeed;
      this.zSpeed = curr_zSpeed;
      this.points.add(next_point);
      if(pow(this.xPos,2) + pow(this.yPos,2) + pow(this.zPos,2) > pow(globalBoundaries,2)){
        this.inBounds = false;
      }
    }
  }
  
  void display(){
    float hu = this.hue;
    beginShape();
    for(PVector point : points){
      stroke(hu, 255, 255, 50);
      vertex(point.x, point.y, point.z);
      hu += 2;
      if(hu > 255){
        hu = 0;
      }
    }
    endShape();
  }
}
