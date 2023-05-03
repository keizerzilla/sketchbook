class Card {
  
  int score;
  int max_score;
  PVector position;
  color tint;
  boolean activated;
  PImage frontTexture;
  PImage backTexture;
  int suit;

  Card(int x, int y, PImage imgFront, PImage imgBack, int s, boolean a, int ms) {
    score = 0;
    position = new PVector(x, y);
    frontTexture = imgFront;
    backTexture = imgBack;
    suit = s;
    activated = a;
    max_score = ms;
  }

  void forwards() {
    if (score + 1 > max_score+1)
      return;

    score++;
    position.y += frontTexture.height;
  }

  void backwards() {
    if (score - 1 < 0)
      return;

    score--;
    position.y -= frontTexture.height;
  }
  
  void flip() {
    activated = !activated;
  }
  
  boolean hasWon() {
    return score == max_score;
  }
  
  void show() {
    stroke(0);
    
    if (activated)
      image(frontTexture, position.x, position.y);
    else
      image(backTexture, position.x, position.y);
  }
}
