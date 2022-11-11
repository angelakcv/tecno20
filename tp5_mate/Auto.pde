class Auto {

  //CAMPOS (variables)
  PFont font2;

  float x, y;
  float t;

  int begin;
  int duracion;
  int time;

  int vidas;

  PImage auto;

  //CONSTRUCTOR (setup)
  Auto (float x_, float y_, float t_) {
    x = x_;
    y = y_;
    t = t_;
    vidas = 3;

    font2 = loadFont ("VCROSDMono-48.vlw");

    //Contador
    begin = millis();
    time=duracion=20;

     auto = loadImage("auto1.png");
  }

  //MÉTODOS (funciones)

  void dibujar(Escenario e, Escenario g) {
    float p = e.getEscena();
    if (p == 1) {

      image(auto, x, y, t, t);

      texto(font2, color(255), 30);
      text("VIDAS: "+ vidas, 20, 40);

      //contador
      if (time> 0) {
        time = duracion -(millis()-begin)/1000;
        texto(font2, color(255), 30);
        text("TIEMPO: "+ time, 550, 40);
      } else {
        text("TIEMPO: "+ time, 550, 40);

        //println(g.getEstado());
        g.cambiarEstado("ganar");
        reciclarVar();
      }
    }
  }


  //MOVIMIENTO RECARGADO
  void mover (int k) {
    if (k == RIGHT) {
      x +=20;
    } else if (k == LEFT) {
      x -= 20;
    }
  }

  void reciclarVar () {
    vidas = 3;
    begin = millis();
    time=duracion=10;
  }

  //COLISION
  void colision( Bomba[] fu, Escenario e, Escenario fin) {
    float p = e.getEscena();
    if (p==1) {

      for (int i = 0; i < fu.length; i++) {
        float x_fuego = fu[i].getX();
        float y_fuego = fu[i].getY();
        //hasta acá posiciones de x e y de cada fuego
        float d = dist (x_fuego, y_fuego, x, y-t/7);

        //calcular colisines
        if (d<(t/3.5)) {
          //si colisiona, evento:
          vidas--;
          println("COLISIÓN "+ vidas);
          fu[i].reciclar();
        }
        if (vidas == 0) {
          reciclarVar();
          //println ("PERDISTE");
          fin.cambiarEstado("perder");
        }
      }
    }
  }
}


//texto
void texto(PFont font, color ct, int sizeT) {
  fill (ct);
  textFont (font);
  textSize (sizeT);
}
