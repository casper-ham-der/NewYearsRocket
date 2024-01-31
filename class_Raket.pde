// lyde: https://www.epidemicsound.com/sound-effects/fireworks/ //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Raket {
  PVector location = new PVector(0, height);
  PVector velocity;
  PVector locationParticle = new PVector(0, 0);
  PVector velocityParticle;

  int dia=5;

  // farver RGB og opauqe værdi alfa
  int r=int(random(256));
  int g=int(random(256));
  int b=int(random(256));
  int alfa=255;

  int gram = int(random(100, 400));
  int lunte= int(random(1, 10));
  float angle=int(random(1, 7));
  boolean soundPayed = false;
  boolean lift= true; // bruges til bang lyd


  //construktor
  Raket() {
    velocity = new PVector(angle, -3);
  }



  void visRaket() {
    fill(0);
    //noStroke();
    circle(location.x, location.y, dia);
    stroke(2);
  }




  void playFireSound() {
    if (location.y==height) {
      start.play();
    }
  }

  void playExplodingSound() {
    if (!soundPayed && !lift) {
      raket2.play();
      soundPayed = true;
    }
  }

  void moveRaket() {

    location.add(velocity);
    if (location.y < gram) { // hvis  jeg har nået toppen og ikke er færdig
      velocity.x=0.8;
      velocity.y=-0.1;
      lift=false;
    }
  }


  //er raketten færdig??
  boolean done() {
    if (location.y<gram ) {
      return true;
    }
    return false;
  }


  void display() {
    println(location);
    println(velocity);

    println( dia);

    // farver RGB og opauqe værdi alfa
    println( r);
    println( g);
    println( b);
    println(alfa);

    println(gram);
    println(lunte);
    println(angle);
    println(soundPayed);
    println(lift);
  }

  void flyvRaket() {
    playFireSound();
    moveRaket();
    if (done()) {
      eksploderRaket();
    } else {
      visRaket();
    }
    playExplodingSound();
  }

  void reset() {


    // farver RGB og opauqe værdi alfa
    r=int(random(256));
    g=int(random(256));
    b=int(random(256));
    alfa=255;

    gram = int(random(100, 400));
    lunte= int(random(1, 10));
    angle=int(random(1, 7));
    soundPayed = false;
    lift= true; // bruges til bang lyd
    location = new PVector(0, height);
    velocity = new PVector(angle, -3);
    dia=5;
  }



  void eksploderRaket() {
  } // made to overwrite
}

class Raket1 extends Raket {

  void eksploderRaket() {

    pushMatrix();
    translate(location.x, location.y);
    stroke(r, b, g, alfa);

    if (alfa > 0) {
      for (int i=0; i<30; i++) {
        fill(r, g, b, alfa);
        for (int o = 0; o < 35; o++) {
          if (alfa < 255-o) {
            circle((255-o)-alfa, 0, 2-0.05*o);
          }
        }
        rotate(1);
      }
      // gør eksplosion gennemsigtig
      alfa--;
    }
    popMatrix();
  }
}

class Raket2 extends Raket {
  int count = 0;
  int size = 255;
  void eksploderRaket() {
    if (alfa > 0) {
      pushMatrix();
      translate(location.x, location.y);
      stroke(r, b, g, 0);
      fill(r, b, g, alfa);
      creeper();
      popMatrix();

      if (count > 0) {
        alfa--;
        count = 0;
      } else {
        count++;
      }
      size--;
    }
  }

  void creeper() {
    for (int i = 0; i < 5; i++) {
      circle(-((255-size)/16*14), -((255-size)/16*(16-2*i)), 3);
      circle(-((255-size)/16*12), -((255-size)/16*(16-2*i)), 3);
      circle(-((255-size)/16*10), -((255-size)/16*(16-2*i)), 3);
      circle(-((255-size)/16*8), -((255-size)/16*(16-2*i)), 3);
      circle(-((255-size)/16*6), -((255-size)/16*(16-2*i)), 3);
      circle(((255-size)/16*14), -((255-size)/16*(16-2*i)), 3);
      circle(((255-size)/16*12), -((255-size)/16*(16-2*i)), 3);
      circle(((255-size)/16*10), -((255-size)/16*(16-2*i)), 3);
      circle(((255-size)/16*8), -((255-size)/16*(16-2*i)), 3);
      circle(((255-size)/16*6), -((255-size)/16*(16-2*i)), 3);
    }

    for (int i = 0; i < 7; i++) {
      circle(-((255-size)/16*4), -((255-size)/16*(6-2*i)), 3);
      circle(-((255-size)/16*2), -((255-size)/16*(6-2*i)), 3);
      circle(((255-size)/16*0), -((255-size)/16*(6-2*i)), 3);
      circle(((255-size)/16*4), -((255-size)/16*(6-2*i)), 3);
      circle(((255-size)/16*2), -((255-size)/16*(6-2*i)), 3);
    }
    
    for ( int i = 0; i < 7; i++) { 
    circle(-((255-size)/16*6), ((255-size)/16*(2+2*i)), 3);
    circle(-((255-size)/16*8), ((255-size)/16*(2+2*i)), 3);
    circle(-((255-size)/16*10), ((255-size)/16*(2+2*i)), 3);
    circle(-((255-size)/16*12), ((255-size)/16*(2+2*i)), 3);
    circle(((255-size)/16*6), ((255-size)/16*(2+2*i)), 3);
    circle(((255-size)/16*8), ((255-size)/16*(2+2*i)), 3);
    circle(((255-size)/16*10), ((255-size)/16*(2+2*i)), 3);
    circle(((255-size)/16*12), ((255-size)/16*(2+2*i)), 3);
    }
  }
}
