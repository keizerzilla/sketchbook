class Coin {
    
    PVector position;
    float radius;
    boolean visible;
    
    Coin(float x, float y) {
        position = new PVector(x, y);
        radius = 16;
        visible = false;
    }
    
    void update() {}
    
    void render() {
        if (visible) {
            fill(255, 255, 0);
            strokeWeight(2);
            circle(position.x, position.y, radius);
        }
    }
    
}
