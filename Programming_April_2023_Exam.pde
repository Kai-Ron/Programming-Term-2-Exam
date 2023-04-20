//Flag pride;
Flag[] flags = new Flag[50];
int[] r = new int[8];
int[] g = new int[8];
int[] b = new int[8];

void setup()
{
  size(1000, 500);
  colorMode(RGB);
  noStroke();
  
  for (int i = 0; i < flags.length; i = i + 5)
  {
    int randomXPos = int(random(1, width));
    int randomYPos = int(random(1, height));
    int randomWidth = int(random(1, width/4));
    int randomHeight = int(random(1, height/32));
    flags[i + 4] = new Flag(randomXPos + width, randomYPos, randomWidth, randomHeight);
    flags[i + 3] = new Flag(randomXPos, randomYPos + height, randomWidth, randomHeight);
    flags[i + 2] = new Flag(randomXPos - width, randomYPos, randomWidth, randomHeight);
    flags[i + 1] = new Flag(randomXPos, randomYPos - height, randomWidth, randomHeight);
    flags[i] = new Flag(randomXPos, randomYPos, randomWidth, randomHeight);
  }
  
  r[0] = 255;
  r[1] = 255;
  r[2] = 255;
  r[3] = 0;
  r[4] = 0;
  r[5] = 0;
  r[6] = 127;
  r[7] = 255;
  
  g[0] = 0;
  g[1] = 127;
  g[2] = 255;
  g[3] = 255;
  g[4] = 255;
  g[5] = 0;
  g[6] = 0;
  g[7] = 0;
  
  b[0] = 0;
  b[1] = 0;
  b[2] = 0;
  b[3] = 0;
  b[4] = 255;
  b[5] = 255;
  b[6] = 255;
  b[7] = 255;
  
  //pride = new Flag(250, 125, 500, 250);
}

void draw()
{
  background(255);
  for (int i = 0; i < flags.length; i++)
  {
  flags[i].draw();
  flags[i].update();
  }
}

class Flag
{
  int x, y, w, h, xStart, yStart, wStart, hStart;
  
  Flag(int xPos, int yPos, int flagWidth, int flagHeight)
  {
    x = xPos;
    y = yPos;
    w = flagWidth;
    h = flagHeight;
    xStart = xPos;
    yStart = yPos;
    wStart = flagWidth;
    hStart = flagHeight;
  }
  
  void draw()
  {
    for (int j = 0; j < 8; j++)
    {
    fill(r[j], g[j], b[j]);
    rect(x, y + (h * j), w, h);
    }
  }
  
  void update()
  {
    
  }
  
}
