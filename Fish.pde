class Fish {
  private String name;
  protected float deltaX, deltaY;
  protected float maxSpeed;
  private float x, y, xBubble, yBubble;
  protected color skin;
  private float age;
  protected float maxAge;
  protected float weight;
  protected float maxWeight;
  private boolean dead, bobUp;
  private color addFishColor;
  protected float xEye, yEye;
  private boolean collided;
  protected color outline;

  Fish () {
      this.x=random(50, 550);
      this.y=random(50, 550);
      this.age = 0;
  }
  
  Fish (String name) {
      this.name = name;
      this.x = random(50, 550);
      this.y = random(50, 550);
      this.age = 0;
  }//fish constructor
  
  public float getX () {
    return this.x;
  }
  
  public float getY () {
    return this.y;
  }
  
  public float getWeight () {
    return this.weight;
  }

  public boolean collided (Pellet p) {
    if ((p.getSize()/2 + this.weight/2) > sqrt(sq(this.x-p.getX())+sq(this.y-p.getY()))) {
      if (!this.dead) {
        if (p.getType() == 0) {
          this.weight += 5;
        }
        else {
          this.weight -= 10;
        }
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  
  public boolean collided (Fish f2) {
    if ((f2.getWeight()/2 + this.weight/2) > sqrt(sq(this.x-f2.getX())+sq(this.y-f2.getY()))) {
      if (!this.dead) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  
  public void changeDir(Fish f1) {
    this.deltaX *= -1;
    this.deltaY *= -1;
  }
  
  /*if(this instanceof Goldfish && f instanceof Goldfish) {
      this.changeDir();  
      f.changeDir();
    }
    else if (this instanceof Whale && f instanceof Goldfish) {
      this.weight += f.getWeight/4;
    }
    */
  
  public void update () {
    if (!dead) {
      this.age += 1;
      this.weight += .005;
    }
    move();
    show();
  }//update
  
  public void show () {
    fill(skin);
    stroke(outline);
    ellipse(x, y, weight, weight);
    fill(255);
    text(toString(),x-5,y-5);
    fill(0);
    noStroke();
    if (!this.dead) {
      ellipse(this.x+(this.deltaX/(abs(this.deltaX)))*(this.weight/5), this.y+(this.deltaY/(abs(this.deltaY)))*(this.weight/5), this.weight/5, this.weight/5);
    }
    if (this.age%5000 == 0) {
      this.xBubble = this.x;
      this.yBubble = this.y;
    }
    if (this.yBubble > 0) {
      fill(134, 255, 240);
      ellipse(this.xBubble, this.yBubble, 8, 8);
      ellipse(this.xBubble, this.yBubble-20, 6, 6);
      ellipse(this.xBubble, this.yBubble-30, 5, 5);
      this.yBubble -= .5;
    }
    if (collided) {
      println("yee");
    }
    if (this.weight > this.maxWeight) {
      this.dead = true;
    }
    if (this.age > this.maxAge) {
      this.dead = true;
    }
    if (this.weight < .1*this.maxWeight) {
      this.dead = true;
    }
  }//show() 
  
  public void move () {
    if ((x > width - this.weight/2) || (x < this.weight/2)) {
      this.deltaX *= -1;
    }
    if ((y > height - this.weight/2) || (y < this.weight/2)) {
      this.deltaY *= -1;
    }
    if (dead) {
      this.deltaX = 0;
      if (this.y > 70 && !bobUp) {
        this.deltaY = -1;
      }//float to top
      else {
        this.bobUp = true;
      }
      if (bobUp) {
        if (this.y < 0) {
          this.deltaY = .25;
        }//bob down
        else if (this.y > 70) {
          this.deltaY = -.25;
        }//bob up
      }//bob at top
    }
    this.x += this.deltaX;
    this.y += this.deltaY;
  }//move()
 
  public String toString () { 
    return "age:" + this.age + ", weight:" + this.weight;
  }
}//abstract class Fish
