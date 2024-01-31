import processing.sound.*;
SoundFile start;
SoundFile raket1;
SoundFile raket2;


//deklaration af raket batterier
Raket1 r1;
Raket2 r2;

void setup() {
  size(1500, 800);
  start = new SoundFile(this, "start.mp3");
  raket1 = new SoundFile(this, "multiRaket.mp3");
  raket2 = new SoundFile(this, "raket1.mp3");

  // hvis ikke er height ikke initialiseret

  r1 = new Raket1();
  r2 = new Raket2();
}



void draw() {
  background(205);
  r1.flyvRaket();
  r2.flyvRaket(); 
}
