class Juego {

  //PROPIEDADES (variables)
  int estado;
  int c = 10;


  Auto jugador;
  Bomba[] bomba;
  Escenario fondo;


  //CONSTRUCTOR (setup del objeto)
  Juego(int cantidad) {
    c = cantidad;
    estado = 0;
    // inicializar los ojetos: jugador,fuego
    jugador = new Auto(width/2, 250, 100);
    //declaro la dimension de los arreglos
    bomba = new Bomba[c];
    //inicializo los objetos de los arreglos
    for (int i = 0; i<c; i++) {
      bomba[i] = new Bomba (-100, -100, 100);

      fondo = new Escenario (0, 0);
    }
  }

  //METODOS (funciones)
  //actualizar()
  void update () {

    for (int i = 0; i<c; i++) {
      bomba [i].update();
    }

    //deduzco si hay colision
    jugador.colision(bomba, fondo, fondo);
    fondo.actualizar();
  }

  //dibujar()
  void draw () {

    fondo.draw();

    jugador.dibujar(fondo, fondo);

    for (int i = 0; i<c; i++) {
      bomba [i].draw(fondo);
    }
  }


  //resetear()
  void reciclar() {
    for (int i = 0; i<c; i++) {
      bomba [i].draw(fondo);
    }
  }

  void teclado (int k) {
    jugador.mover(k);
  }

  void click() {
    fondo.click(fondo,jugador);
  }

  void key() {
    fondo.key(fondo);
  }
}
