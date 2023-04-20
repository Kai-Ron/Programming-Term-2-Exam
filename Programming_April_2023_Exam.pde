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
    int randomXPos = int(random(0, width));
    int randomYPos = int(random(0, height));
    int randomWidth = int(random(8, width/4));
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
  background(127, 127, 127);
  for (int i = 0; i < flags.length; i++)
  {
  flags[i].draw();
  flags[i].update();
  }
}

class Flag
{
  int x, y, w, h, xStart, yStart, wStart, hStart;
  boolean xGrow = true;
  boolean yGrow = true;
  
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
    fill(0, 0, 0);
    triangle(x, y, x, y + (h * 8), x + (w / 3), y + (h * 4));
    fill(255, 255, 255);
    triangle(x + w, y, x + w, y + (h * 8), x + ((2 * w) / 3), y + (h * 4));
    stroke(127, 127, 127);
    strokeWeight(5);
    noFill();
    ellipse(x + (w/2), y + (h * 4), (w / 3), (h * 4));
    noStroke();
  }
  
  void update()
  {
    if (xGrow)
    {
      
      x+=2;
      
      if (w <= width / 4)
      {
        x--;
        w += 2;
      }
      else
      {
        xGrow = false;
      }
    }
    else
    {
      
      x-=2;
      
      if (w > wStart)
      {
        x++;
        w -= 2;
      }
      else
      {
        xGrow = true;
      }
    }
    
    if (yGrow)
    {
      
      y+=2;
      
      if (h <= height / 16)
      {
        y--;
        h += 2;
      }
      else
      {
        yGrow = false;
      }
    }
    else
    {
      
      y-=2;
      
      if (h > hStart)
      {
        y++;
        h -= 2;
      }
      else
      {
        yGrow = true;
      }
    }
  }
  
}
