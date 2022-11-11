//declaro la clase juego
Juego juego;

void setup() {
  size (800, 400);
  //inicializo clase juego
  juego = new Juego(10);
}

void draw() {
  background(0);

  //llamo a los métodos de la clase juego
  juego.update();
  juego.draw();
}

void keyPressed() {
  juego.teclado (keyCode);
  juego.key();
}

void mouseClicked() {
  juego.click();
}
