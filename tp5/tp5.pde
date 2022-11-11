//VIDEO
//https://youtu.be/2slFulsWPBY

// tp5 | tmm1 | FdA | UNLP
// com2 | Prof. Matias Jauregui Lorda

// Angela Calizaya
// "El ingrediente misterioso"

// "Esquiva esquiva"

/* PROPUESTA DESCRIPTIVA
 Dana está siendo atacada por Calcifer, el demonio fuego,
 ayúdala a esquivar sus ataques para poder ganar
 */

//------------------------------------------------------------------------

//declaro la clase juego
Juego juego;

void setup() {
  size (800, 400);
  //inicializo clase juego
  juego = new Juego(10);
}

void draw() {
  background(247, 117, 117);

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
