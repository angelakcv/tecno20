class Juego {

  //PROPIEDADES (variables)
  int estado;
  int c = 10;


  Dana jugador;
  Fuego[] fuego;
  Escenario fondo;


  //CONSTRUCTOR (setup del objeto)
  Juego(int cantidad) {
    c = cantidad;
    estado = 0;
    // inicializar los ojetos: jugador,fuego
    jugador = new Dana(width/2, 300, 100);
    //declaro la dimension de los arreglos
    fuego = new Fuego[c];
    //inicializo los objetos de los arreglos
    for (int i = 0; i<c; i++) {
      fuego[i] = new Fuego (-100, -100, 100);

      fondo = new Escenario (0, 0);
    }
  }

  //METODOS (funciones)
  //actualizar()
  void update () {

    for (int i = 0; i<c; i++) {
      fuego [i].update();
    }

    //deduzco si hay colision
    jugador.colision(fuego, fondo, fondo);
    fondo.actualizar();
  }

  //dibujar()
  void draw () {

    fondo.draw();

    jugador.dibujar(fondo, fondo);

    for (int i = 0; i<c; i++) {
      fuego [i].draw(fondo);
    }
  }


  //resetear()
  void reciclar() {
    for (int i = 0; i<c; i++) {
      fuego [i].draw(fondo);
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
