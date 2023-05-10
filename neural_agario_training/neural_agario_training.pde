Blob blob;

void setup() {
    size(800, 600);
    
    blob = new Blob(100, 100);
}

void keyPressed() {
    if (keyCode == UP || key == 'w' || key == 'W')
        blob.forwards();
    
    if (keyCode == DOWN || key == 's' || key == 'S')
        blob.backwards();
    
    if (keyCode == LEFT || key == 'a' || key == 'A')
        blob.turnLeft();
    
    if (keyCode == RIGHT || key == 'd' || key == 'D')
        blob.turnRight();
}

void keyReleased() {
    if (keyCode == UP || key == 'w' || key == 'W')
        blob.stopGo();
    
    if (keyCode == DOWN || key == 's' || key == 'S')
        blob.stopGo();
    
    if (keyCode == LEFT || key == 'a' || key == 'A')
        blob.stopTurn();
    
    if (keyCode == RIGHT || key == 'd' || key == 'D')
        blob.stopTurn();
}

void draw() {
    background(0);
    
    blob.update();
    blob.render();
}
