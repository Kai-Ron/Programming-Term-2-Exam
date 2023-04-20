Flag pride;

void setup()
{
  size(1000, 500);
  colorMode(RGB);
  noStroke();
  pride = new Flag(500, 250);
}

void draw()
{
  background(255);
  pride.draw();
  pride.update();
}

class Flag
{
  int w, h;
  
  Flag(int flagWidth, int flagHeight)
  {
    w = flagWidth;
    h = flagHeight;
  }
  
  void draw()
  {
    for (int i = 0; i < 10; i++)
    {
    fill(0, 0, 0);
    rect(0, 0, w, h);
    }
  }
  
  void update()
  {
    w++;
    h++;
  }
  
}
