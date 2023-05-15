float MAX_SPEED = 3;
float MAX_STEER = 0.075;
int SENSOR_SIZE = 512;

class Blob {
    
    PVector position;
    PVector velocity;
    PVector leftSensor;
    PVector rightSensor;
    float angle;
    float fov;
    float steer;
    float speed;
    float radius;
    float hitRadius;
    int score;
    
    Blob(float x, float y) {
        position = new PVector(x, y);
        velocity = new PVector();
        angle = PI;
        fov = PI / 6;
        steer = 0;
        speed = 0;
        radius = 40;
        hitRadius = 20;
        score = 0;
        leftSensor = PVector.fromAngle(angle - HALF_PI - fov);
        rightSensor = PVector.fromAngle(angle - HALF_PI + fov);
    }
    
    void forwards() {
        speed = MAX_SPEED;
    }
    
    void backwards() {
        speed = -MAX_SPEED;
    }
    
    void turnLeft() {
        steer = -MAX_STEER;
    }
    
    void turnRight() {
        steer = MAX_STEER;
    }
    
    void stopGo() {
        speed = 0;
    }
    
    void stopTurn() {
        steer = 0;
    }
    
    void addScore(int amount) {
        score += amount;
    }
    
    boolean collidesWith(Coin coin) {
        return dist(position.x, position.y, coin.position.x, coin.position.y) < hitRadius + coin.radius;
    }
    
    boolean sees(Coin coin) {
        return true;
    }
    
    void update() {
        angle += steer;
        angle = angle % 360;
        
        velocity.set(cos(angle - HALF_PI), sin(angle - HALF_PI));
        velocity.mult(speed);
        
        position.add(velocity);
        
        leftSensor = PVector.fromAngle(angle - HALF_PI - fov);
        rightSensor = PVector.fromAngle(angle - HALF_PI + fov);
    }
    
    void render() {
        stroke(255);
        
        pushMatrix();
        translate(position.x, position.y);
        fill(160);
        strokeWeight(2);
        arc(0, 0, SENSOR_SIZE, SENSOR_SIZE, angle - HALF_PI - fov, angle - HALF_PI + fov, PIE);
        rotate(angle);
        strokeWeight(2);
        fill(0, 0, 255);
        beginShape(TRIANGLES);
        vertex(0, -radius*0.8);
        vertex(-radius/2, radius/2);
        vertex(radius/2, radius/2);
        endShape();
        popMatrix();
        
        fill(255, 0, 0);
        circle(position.x, position.y, radius);
    }
    
}
