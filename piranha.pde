class Piranha extends Fish {
  Piranha () {
    super();
    this.maxWeight = 50;
    this.maxSpeed = 2;
    this.maxAge = 10000;
    this.weight = random(15, 25);
    this.skin = color(random(0,200), random(0,255), 255);
    this.outline = this.skin;
    this.deltaX = random(-maxSpeed, maxSpeed);
    this.deltaY = random(-maxSpeed, maxSpeed);
  }
}
