/* Pong, the magnificant - by DBDB
 Implements a single-player Pong-like game
 Uses a Ball class, and a Paddle class
 */

Ball b;              // Ball object
Paddle pad;          // Paddle object
boolean playOn;      // Value is true if still playing, false when game over
int score;           // Score displayed at end of game

void setup()
{
  size(500, 500);    // Make the window 500 X 500, white background
  colorMode(HSB);    // Use Hue/Saturation/Brightness color mode
  background(255);

  b = new Ball(2, -3, 50);
  pad = new Paddle();
  playOn = true;
  score = 0;
}

void draw( )
{
  background(255);


  if (playOn)
  {
    if (b.move(pad))
    {
      b.display();
      pad.move();
      pad.display();
    } else
    {
      playOn = false;
      score = frameCount;
    }
  } else
  {
    fill(175,255,255);
    textSize(32);
    text("Game over! Score = " + score , 40, 200);
  }
}
