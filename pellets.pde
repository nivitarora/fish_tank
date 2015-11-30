class Pellet {
  private float size;
  private float deltaX, deltaY;
  private float x, y;
  private color pelletColor;
  private int type; //(0 = food, 1 = poison)
  
  public float getSize () {
    return this.size;
  }
  
  public float getType () {
    return this.type;
  }
  
  public float getX () {
    return this.x;
  }
  
  public float getY () {
    return this.y;
  }
  
  Pellet (int type) {
      this.type = type;
      this.deltaY = 1;
      this.x = random(10, width-10);
      this.y = random(50, height/3);
      if (type == 0) {
        this.pelletColor = color(74, 201, 20);
      }
      else {
        this.pelletColor = color(252, 23, 238);
      }
      this.size = 5;
  }
  
  public void update () {
    move();
    show();
  }//update
  
  public void show () {
    fill(this.pelletColor);
    noStroke();
    ellipse(this.x, this.y, this.size, this.size);
  }//show() 
  
  public void move () {
    if (this.y + this.size/2 < height) {
      this.y += this.deltaY;
    }
  }//move()
}
