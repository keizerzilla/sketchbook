int MAX_SCORE = 8;

PImage cardBack;

PImage clubs;
PImage diamonds;
PImage hearts;
PImage spades;

PImage[] suits;

Card[] horses;
Card[] checks;

boolean running;

void setup() {
  size(400, 600);
  
  cardBack = loadImage("card_back.png");
  
  clubs = loadImage("clubs.png");
  diamonds = loadImage("diamonds.png");
  hearts = loadImage("hearts.png");
  spades = loadImage("spades.png");
  
  suits = new PImage[4];
  suits[0] = clubs;
  suits[1] = diamonds;
  suits[2] = hearts;
  suits[3] = spades;
  
  horses = new Card[4];
  horses[0] = new Card(40, 30, clubs, cardBack, 0, true, MAX_SCORE);
  horses[1] = new Card(100, 30, diamonds, cardBack, 1, true, MAX_SCORE);
  horses[2] = new Card(160, 30, hearts, cardBack, 2, true, MAX_SCORE);
  horses[3] = new Card(220, 30, spades, cardBack, 3, true, MAX_SCORE);
  
  checks = new Card[MAX_SCORE];
  for (int i = 0; i < MAX_SCORE; i++) {
    int idx = int(random(0, 4));
    Card card = new Card(300, i*61 + 30, suits[idx], cardBack, idx, false, MAX_SCORE);
    checks[i] = card;
  }
  
  running = true;
}

void play() {
  int value = int(random(0, 4));
  horses[value].forwards();
}

void keyPressed() {
  if (key == ' ' && running)
    play();
}

void draw() {
  background(40, 99, 23);
  
  for (int i = 0; i < MAX_SCORE; i++) {
    if (checks[i].activated)
      continue;
    
    boolean flag = true;
    for (int j = 0; j < 4; j++) {
      if (horses[j].score <= i)
        flag = false;
    }
    
    if (flag) {
      checks[i].flip();
      for (int k = 0; k < 4; k++) {
        if (horses[k].suit == checks[i].suit) {
          horses[k].backwards();
          break;
        }
      }
    }
  }
  
  for (Card horse : horses)
    horse.show();
  
  for (Card check : checks)
    check.show();
  
  for (Card card : horses) {
    if (card.hasWon()) {
      running = false;
      
      for (Card horse : horses)
        horse.frontTexture = card.frontTexture;
      
      for (Card check : checks) {
        check.activated = true;
        check.frontTexture = card.frontTexture;
      }
    }
  }
}
