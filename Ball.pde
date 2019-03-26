/* Ball calss - by DBDB
 Implements a ball suitable for pong
 */

class Ball
{
  // Attributes, aka class variables, instance variables, properties
  float xLoc;       // x location (coordinate) for the center of the logo
  float yLoc;       // y location for the center of the logo
  float xVel;       // Velocity of the logo in the X dimension
  float yVel;       // Velocity of the logo in the Y dimension
  float accel;      // Acceleration factor to make ball speed up gradually
  float diam;       // diameter of the logo
  float rad;        // Radius of the logo
  float oHue;       // Hue value of the outer circle of the logo
  float iHue;       // Hue value of the inner circle of the logo

  // Constructor for the Ball class
  // Parameters xV and yV initialize xVel and yVel
  Ball(float xV, float yV, float di)
  {
    xLoc = width / 2;      // Start logo at center of window
    yLoc = height / 2;
    xVel = xV;             // Start moving to the right
    yVel = yV;             // Start moving up a little faster
    accel = 1.001;
    diam = di;             // Set logo's diameter
    rad = diam / 2;        // and its radius
    oHue = random(0, 255);  // Hue values for outer
    iHue = random(0, 255);  // and inner circles initialized randomly
  }

  // Methods for the Ball calss
  // Code to move the logo each frame of the animation
  // Parameter is the paddle object, needed for collision detection
  // Returns ture if the game is not over (play on), false if game over
  boolean move(Paddle pad)
  {
    xVel = xVel * accel;       // Accelerate in x dimension only
    xLoc = xLoc + xVel;        // Move in x dimension
    if (xLoc > width - rad)    // Bounce off of right wall
    {
      xVel = xVel * -1;        // Change direction
    } else if (pad.collide(this)) // Bounce off of the paddle
    {
      xVel = xVel * -1;
    } else if (xLoc < rad)        // Game over
    {
      return false;
    }

    yLoc = yLoc + yVel;
    if (yLoc > height-rad)    // Bounce off of floor
    {
      yVel = yVel * -1;
    } else if (yLoc < rad)    // Bounce off of ceiling
    {
      yVel = yVel * -1;
    }
    return true;              // If game is not over, return true
  }

  // Displaay logo at xLoc, yLoc
  void display()
  {
    //float rad = diam * 0.5;               // Radius is half the diameter

    strokeWeight(5);
    stroke(0);
    oHue = oHue + 1;
    if (oHue > 255)
    {
      oHue = 0;
    }
    //println(oHue);
    fill(oHue, 255, 255);
    ellipse(xLoc, yLoc, diam, diam);      // Draw big green circle

    line(xLoc-rad, yLoc, xLoc+rad, yLoc);   // Draw the crosshairs
    line(xLoc, yLoc-rad, xLoc, yLoc+rad);

    iHue = iHue - 1;
    if (iHue < 0)
    {
      iHue = 255;
    }
    //println(iHue);
    fill(iHue, 255, 255);
    ellipse(xLoc, yLoc, rad, rad);         // Draw the small purple circle
  }
}
