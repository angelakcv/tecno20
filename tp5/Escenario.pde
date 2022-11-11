 //<>//
class Escenario {
  Boton boton;

  //PROPIEDADES(VARIABLES)

  PFont font1, font2;
  PImage[] fondo = new PImage [2];
  String estado;
  int p=0;
  float x, y;
  
   Boton boton1;

  // CONSTRUCTOR (setup)
  Escenario (float x_, float y_) {
    x = x_;
    y = y_;

    for (int i = 0; i <fondo.length; i++) {
      fondo[i] = loadImage ("fon_0"+i+".png");
    }

    font1 = loadFont ("OldLondon-48.vlw");
    font2 = loadFont ("VCROSDMono-48.vlw");
    
     boton1 = new Boton ("INICIAR", /*font2,*/ width/2, height/2-40, 150, 50, 45);

    estado = "menu";
  }

  //METODOS (funciones)
  void dibujar () {
    image(fondo[0], x, y,800,400);
  }
  void draw () {

    if (estado.equals("menu")) {
      p = 0;
      dibujar();

      //image(fondo[0], 0, 0, 800, 400);

      //título
      texto(font1, color(255), 80);
      text("El ingrediente misterioso", 50, 100);

      //botón INICIAR
      boton1.dibujar();
      
    }
    if (estado.equals("juego")) {
      p = 1;
      dibujar();

      image(fondo[1], 0, 0, 800, 400);
      noStroke();
      //cuadro texto
      recTexto(color(0, 100), width/2, 400, width, 70);
      texto(font2, color(255), 20);
      text("Evita los ataques: <- ->", 10, 390);
    }
    if (estado.equals("ganar")) {
      p = 2;
      dibujar();

      recTexto(color(0, 255, 0), width/2, height/2, width, height);
      stroke(0);
      strokeWeight(100);

      texto(font2, color(255), 150);
      text("Ganaste", 100, 250);

      texto(font2, color(100), 30);
      text("Presiona 'r' para reiniciar el juego", 90, 385);
    }
    if (estado.equals("perder")) {
      p = 3;
      dibujar();

      recTexto(color(255, 0, 0), width/2, height/2, width, height);
      stroke(0);
      strokeWeight(100);

      texto(font2, color(255), 150);
      stroke(0);
      text("Perdiste", 50, 250);

      texto(font2, color(100), 30);
      text("Presiona 'r' para reiniciar el juego", 90, 385);
    }
  }

  void actualizar() {
      reciclar();
  }

  void reciclar() {
    p = 0;
  }


  void click (Escenario e, Dana d) {
    //botón inicio
    if (p == 0) {
      if ((mouseX > width/2) && (mouseX < width/2+150) && (mouseY > 160) && (mouseY < 160+50)) {
        e.cambiarEstado("juego");
        d.reciclarVar();
      }
    }
  }

  //reiniciar
  void key (Escenario e) {
    //float p = e.getEscena();
    if (keyPressed) {
      if (p == 1 || p==2 || p==3) {
        if (key == 'r') {
          //println("tecla r");
          e.cambiarEstado("menu");
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

  //rectangulo de texto
  void recTexto(color cr, float posXr, float posYr, float wr, float hr) {
    fill (cr);
    rectMode(CENTER);
    rect (posXr, posYr, wr, hr);
  }

  float getEscena() {
    return p;
  }

  void cambiarEstado(String nuevoEstado) {
    estado = nuevoEstado;
  }

  String getEstado() {
    return estado;
  }
}
