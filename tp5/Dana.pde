class Dana {

  //CAMPOS (variables)
  PFont font2;

  float x, y;
  float t;

  int begin;
  int duracion;
  int time;

  int vidas;

  //CONSTRUCTOR (setup)
  Dana (float x_, float y_, float t_) {
    x = x_;
    y = y_;
    t = t_;
    vidas = 3;

    font2 = loadFont ("VCROSDMono-48.vlw");

    //Contador
    begin = millis();
    time=duracion=10;
  }

  //MÉTODOS (funciones)

  void dibujar(Escenario e, Escenario g) {
    float p = e.getEscena();
    if (p == 1) {

      pushStyle();

      //Varita
      strokeWeight(t/30);
      stroke (117, 117, 117);
      line(x+t/3.7, y+t/17, x+t/3, y-t/7);

      noStroke();
      //Luz
      fill(5, 252, 234, 117);
      circle(x+t/3, y-t/7, t/10);
      //Cabeza
      fill(47, 47, 100);
      circle(x, y-t/7, t/3.5);
      //Piel
      fill(250, 233, 207);
      circle(x-t/5, y+t/7, t/20);
      circle(x+t/3.7, y+t/17, t/20);
      //Zapatos
      fill(33, 34, 137);
      circle(x-t/13, y+t/3, t/20);
      circle(x+t/13, y+t/3, t/20);
      //Capa
      fill (33, 34, 137);
      quad(x-t/10, y, x+t/10, y, x+t/5, y+t/5, x-t/5, y+t/5);
      //Brazo1
      fill (117, 117, 117);
      quad(x-t/10, y, x-t/10, y, x-t/6, y+t/7, x-t/5, y+t/10);
      //Brazo2
      fill (117, 117, 117);
      quad(x+t/8, y+t/15, x+t/10, y, x+t/4, y+t/30, x+t/4, y+t/7);
      //Pierna1
      fill (117, 117, 117);
      quad(x-t/10, y+t/5, x-t/40, y+t/5, x-t/20, y+t/3, x-t/10, y+t/3);
      //Pierna2
      fill (117, 117, 117);
      quad(x+t/40, y+t/5, x+t/10, y+t/5, x+t/10, y+t/3, x+t/20, y+t/3);
      //Colita
      strokeWeight(2);
      stroke(0, 0, 70);
      fill(47, 47, 100);
      curve(x-t/1.07, y+t/1.07, x, y-t/10, x, y-t/10, x+t/1.07, y+t/1.07);

      popStyle();

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
  void colision( Fuego[] fu, Escenario e, Escenario fin) {
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
