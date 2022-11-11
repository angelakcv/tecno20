class Bomba {

  //CAMPOS (variables)
  float x, y;
  float t;
  float vel;

  PImage bomba;

  //CONSTRUCTOR (setup)
  Bomba (float x_, float y_, float t_) {
    x = x_;
    y = y_;
    t = t_;
    vel = random (5, 7);
    
    bomba = loadImage("bomba.png");
  }

  //MÉTODOS (funciones)
  void update () {
    y += vel;
    if (y > height+100) {
      reciclar();
    }
  }

  void draw(Escenario e) { //void dibujar
    float p = e.getEscena();
    if (p == 1) {

      image(bomba, x, y, t, t);
    }
  }

  void reciclar () {
    x = random (width);
    y = -100;
    t = 40;
    vel = random (5, 7);
  }

  //como acceder a una variable de la clase
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
}
