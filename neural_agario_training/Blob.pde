class Blob {
    
    PVector position;
    float angle;
    float radius;
    
    Blob(float x, float y) {
        position = new PVector(x, y);
        angle = PI;
        radius = 48;
    }
    
    void forwards() {}
    
    void backwards() {}
    
    void turnLeft() {}
    
    void turnRight() {}
    
    void stopGo() {}
    
    void stopTurn() {}
    
    void update() {}
    
    void render() {
        stroke(255);
        strokeWeight(2);
        fill(255, 0, 0);
        circle(position.x, position.y, radius);
    }
    
}
