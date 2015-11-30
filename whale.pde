class Whale extends Fish {
  Whale () {
    super();
    this.maxWeight = 100;
    this.maxSpeed = 1;
    this.maxAge = 30000;
    this.weight = random(30, 60);
    this.skin = color(random(40, 220));
    this.outline = this.skin;
    this.deltaX = random(-maxSpeed, maxSpeed);
    this.deltaY = random(-maxSpeed, maxSpeed);
  }
}
