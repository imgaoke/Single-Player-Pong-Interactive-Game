/* Paddle class - by DBDB
 */
class Paddle
{
  // Attributes
  float xLoc;              // X and Y locations
  float yLoc;
  float halfLeng;          // Half the length of the paddle
  // Constructor
  Paddle()
  {
    xLoc = 10;             // Always 10 pixels right of left wall
    yLoc = height / 2;      
    halfLeng = 30;         // Total length of paddle is 60 (30 * 2)
  }
  // Methods
  void move()
  {
    yLoc = mouseY;         // Move with mouse in y dimention
  }

  boolean collide(Ball b)
  {
    if (b.xLoc < this.xLoc + b.rad &&            // Ball close enough to paddle
      b.yLoc > this.yLoc - this.halfLeng &&      // and below the upper end of paddle
      b.yLoc < this.yLoc + this.halfLeng)        // and above the lower end of paddle
    {
      return true;
    } else
    {
      return false;
    }
  }
  void display()
  {
    strokeWeight(10);
    stroke(150, 255, 175);
    line(xLoc, yLoc-halfLeng, xLoc, yLoc+halfLeng);
  }
}
