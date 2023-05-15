int NUM_COINS = 10;
int OFFSET = 30;

Blob blob;
ArrayList<Coin> coins;

void setup() {
    size(800, 600);
    
    blob = new Blob(100, 100);
    
    coins = new ArrayList<Coin>();
    for (int i = 0; i < NUM_COINS; i++) {
        float x = random(OFFSET, width - OFFSET);
        float y = random(OFFSET, height - OFFSET);
        Coin coin = new Coin(x, y);
        coins.add(coin);
    }
}

void keyPressed() {
    if (keyCode == UP || key == 'w' || key == 'W') {
        blob.forwards();
    }
    
    if (keyCode == DOWN || key == 's' || key == 'S') {
        blob.backwards();
    }
    
    if (keyCode == LEFT || key == 'a' || key == 'A') {
        blob.turnLeft();
    }
    
    if (keyCode == RIGHT || key == 'd' || key == 'D') {
        blob.turnRight();
    }
}

void keyReleased() {
    if (keyCode == UP || key == 'w' || key == 'W') {
        blob.stopGo();
    }
    
    if (keyCode == DOWN || key == 's' || key == 'S') {
        blob.stopGo();
    }
    
    if (keyCode == LEFT || key == 'a' || key == 'A') {
        blob.stopTurn();
    }
    
    if (keyCode == RIGHT || key == 'd' || key == 'D') {
        blob.stopTurn();
    }
}

void debug() {
    fill(255);
    textSize(24);
    text("SCORE: " + blob.score, 20, 30);
}

void draw() {
    background(0);
    
    blob.update();
    blob.render();
    
    for (int i = coins.size() - 1; i >= 0; i--) {
        Coin coin = coins.get(i);
        
        if (blob.collidesWith(coin)) {
            blob.addScore(1);
            coins.remove(i);
        }
        
        coin.visible = blob.sees(coin);
    }
    
    for (Coin coin : coins) {
        coin.render();
    }
    
    debug();
}
