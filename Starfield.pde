Particle[] p = new Particle[1000];
void setup()
{
  size(800, 600);
  noStroke();
  for (int i = 0; i < 1000; i++)
    p[i] = new Particle();
    for(int i = 0; i < 20; i++)
      p[i] = new OddballParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i < p.length; i++) {
    p[i].show();
    p[i].drift();
  }
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle() {
    myX = 400;
    myY = 300;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySpeed = (int)(Math.random()* 10);
    myAngle = (int)(Math.random()*2*Math.PI);
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, 10.0, 10.0);
  }
  void drift() {
    myX = myX + mySpeed*Math.cos(myAngle);
    myY = myY + mySpeed*Math.sin(myAngle);
    if (myX>800)
      myX = 400;
    if (myY>600)
      myY = 300;
    if (myY <0)
      myY = 300;
    if(myX <0)
      myX = 400;
  }
}
class OddballParticle extends Particle
{
  OddballParticle(){
    myX = 350;
    myY = 250;
    myAngle = (Math.random()*2*Math.PI);
    mySpeed = (Math.random()*.5);
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 50);
  }
  void show() {
    fill(myColor);
    rect((float)myX,(float)myY, 100.0,100.0);
  }
}
