/*
  Program: FishTales_I.pde
  Author:  Nivita Arora
  Date: 01/20/15
  Notes: 
*/

ArrayList<Fish> fishies = new ArrayList<Fish>();
ArrayList<Pellet> pellets = new ArrayList<Pellet>();
float xPos;
float yPos;

void setup () {
  size(600,600);
}

void draw () {
  background(5,170,155);
  noStroke();
  
  textSize(12);
  fill(23, 193, 81);
  ellipse(width-60, 50, 80, 80);
  fill(0);
  text("add food", width-85, 55);
  
  fill(206, 15, 18);
  ellipse(width-60, 150, 80, 80);
  fill(0);
  text("add poison", width-90, 155);
  
  fill(250, 160, 43);
  ellipse(width-60, 250, 80, 80);
  fill(0);
  text("add goldfish", width-95, 255);
  
  fill(188);
  ellipse(width-60, 350, 80, 80);
  fill(0);
  text("add whales", width-92, 355);
  
  fill(172, 13, 222);
  ellipse(width-60, 450, 80, 80);
  fill(0);
  text("add piranha", width-95, 455);
  
  noFill();
  stroke(255, 0, 0);
  ellipse(width-60, 550, 80, 80);
  fill(0);
  text("add", width-70, 548);
  text("toroidalfin", width-90, 562);
  
  //println(fishies.size(), pellets.size());
  
  for (int i = 0; i < fishies.size(); i++) {
    Fish f = fishies.get(i);
    f.update();
    for (int j = 0; j < pellets.size(); j++) {
      Pellet p = pellets.get(j);
      if (f.collided(p)) {
        pellets.remove(j);
      }
    }
  }
  for (int i = 0; i < pellets.size(); i++) {
    pellets.get(i).update();
  }
  for (int i = 0; i < fishies.size(); i++) {  
    Fish f1 = fishies.get(i);
    for (int j = 0; j < fishies.size(); j++) {
      if (i != j) {
        Fish f2 = fishies.get(j);
        if (f1.collided(f2)) {
          if (f1 instanceof Whale && f2 instanceof Goldfish) {
            f1.weight += .25*f2.weight;
            fishies.remove(j);
          }
          else if (f1 instanceof Whale && f2 instanceof Piranha) {
            f1.weight += .25*f2.weight;
            fishies.remove(j);
          }
          else if (f1 instanceof Piranha && f2 instanceof Goldfish) {
            f1.weight += .25*f2.weight;
            fishies.remove(j);
          }
          else if (f1 instanceof Goldfish && f2 instanceof Goldfish) {
            f1.changeDir(f1);
            //f2.changeDir(f2);
          }
        }
      }
    }
  }
}

void mouseClicked () {
  yPos = sqrt(abs(sq(40) - sq(540-mouseX)));
  if ((width-100) < mouseX && mouseX < (width-20) && 50-yPos < mouseY && mouseY < 50+yPos) {
    for (int i = 0; i < 20; i++) {
      pellets.add(new Pellet(0));
    }
  }
  else if ((width-100) < mouseX && mouseX < (width-20) && 150-yPos < mouseY && mouseY < 150+yPos) {
    for (int i = 0; i < 20; i++) {
      pellets.add(new Pellet(1));
    }
  }
  else if ((width-100) < mouseX && mouseX < (width-20) && 250-yPos < mouseY && mouseY < 250+yPos) {
      fishies.add(new Goldfish());
  }
  else if ((width-100) < mouseX && mouseX < (width-20) && 350-yPos < mouseY && mouseY < 350+yPos) {
      fishies.add(new Whale());
  }
  else if ((width-100) < mouseX && mouseX < (width-20) && 450-yPos < mouseY && mouseY < 450+yPos) {
      fishies.add(new Piranha());
  }
  else if ((width-100) < mouseX && mouseX < (width-20) && 550-yPos < mouseY && mouseY < 550+yPos) {
      fishies.add(new Toroidalfin());
  }
  else {
    for (int i = 0; i < fishies.size(); i++) {
      Fish f = fishies.get(i);
      f.deltaX *= -1;
      f.deltaY *= -1;
    }
  }
}
