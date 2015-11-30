class Goldfish extends Fish {
  Goldfish () {
    super();
    this.maxWeight = 30;
    this.maxSpeed = 3;
    this.maxAge = 20000;
    this.weight = random(5, 10);
    this.skin = color(255, random(255), 0);
    this.outline = this.skin;
    this.deltaX = random(-maxSpeed, maxSpeed);
    this.deltaY = random(-maxSpeed, maxSpeed);
  }
}
