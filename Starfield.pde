Particles[] particlesMix;

interface Particles
{
  public void move();
  public void show();
}

void setup()
{
  size(500,500);
  particlesMix = new Particles[100];
  for (int i = 0; i < particlesMix.length; i++)
  {
    particlesMix[i] = new NormalParticle();
  }
  particlesMix[0] = new OddballParticle();
  particlesMix[1] = new JumboParticle();
}

void draw()
{
  background(255);
  for ( int i = 0; i < particlesMix.length; i++)
  {
    particlesMix[i].move();
    particlesMix[i].show();
  }
}

class NormalParticle implements Particles
{
  double myX, myY, mySpeed, myAngle;
  int myColor, r;
  NormalParticle()
  {
    myX = 250;
    myY = 250;
    myAngle = Math.PI*2*Math.random();
    mySpeed = Math.random()*10;
    r = (int)(Math.random()*256);
  }
  public void move()
  {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    myColor = color(r,0,0);
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)myX-15,(float)myY+7,11,15);
    ellipse((float)myX-5,(float)myY+7,11,15);
    triangle((float)myX-20,(float)myY+10,(float)myX-10,(float)myY+20,(float)myX,(float)myY+10);
  }
}

class OddballParticle implements Particles
{
  int myX, myY;
  OddballParticle()
  {
    myX = 400;
    myY = 350;
  }
  public void move()
  {
    myX = myX + (int)(Math.random()*5)-2;
    myY = myY + (int)(Math.random()*5)-2;
  }
  public void show()
  {
    //dagger
    fill(197);
    triangle(myX,myY,myX+4,myY-10,myX+8,myY);
    rect(myX,myY,8,20);
    fill(126,93,8);
    rect(myX-4,myY+20,16,4);
    rect(myX,myY+24,8,10); 
  }
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill(234,228,24);
    ellipse((float)myX-5,(float)myY+17,21,25);
    ellipse((float)myX+10,(float)myY+17,21,25);
    triangle((float)myX-13,(float)myY+25,(float)myX+3,(float)myY+40,(float)myX+18,(float)myY+25);
  }
}
