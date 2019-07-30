int x, y;
color col = #2B3679;
String a [] = new String [2];
Respuesta respuestas [] ;
float velocidad=5, radio=80.0;
float i =0, t=0, n=0, advance=0.1, pregunta=0;
String[] preguntas;
int[] alrdP; 
Pregunta pregS;
Pregunta pregSH;
boolean preguntaLoaded= false, chsyn=false;
int rtaCh, count=0, numerito;
String preguntaTexto = "";
ArrayList <String> resp = new ArrayList<String>();
void setup () {
  numerito =1;
  ellipseMode(CENTER);
  rectMode(CENTER);
  textSize(28);
  fullScreen();
  x = width/2-350;
  y = height/2;
  respuestas = new Respuesta [4];
  respuestas[0] = new Respuesta (x-600, y +75, a, col);
  respuestas[1] = new Respuesta (x-600, y +175, a, col);
  respuestas[2] = new Respuesta (x-600, y +275, a, col);
  respuestas[3] = new Respuesta (x-600, y +375, a, col);
  preguntas = loadStrings("preguntas.txt");
  alrdP=new int[preguntas.length];
  while (n==0||n==41 ||n==88||n==33||n==80) {
    n=(int)(Math.random()* 62 )+25;
    break;
  }
}

void draw () {
  if (numerito == 1) {
    menu();
  } else {
    ruleta();
  }
}
void ruleta () {


  if (n>24 && n<34) {
    pregunta=1;
  }  //amarillo
  if (n>33 && n<42) {
    pregunta=2;
  }  //verde
  if (n>41 && n<49) {
    pregunta=3;
  }  //violeta
  if (n>48 && n<57) {
    pregunta=4;
  }  //morado
  if (n>56 && n<65) {
    pregunta=5;
  }  //rojo
  if (n>64 && n<73) {
    pregunta=6;
  }  //azul claro
  if (n>72 && n<81) {
    pregunta=7;
  }  //azul oscuro
  if (n>80 && n<88) {
    pregunta=8;
  }  //naranja

  //Dibujo
  background(157, 103, 59);
  strokeWeight(0);
  fill(0);
  rect(width/2, 40, 800, 10);


  pushMatrix();
  translate(width/2, (2*height)/7);
  rect(350, 0, 400, 360);

  fill(108, 206, 232);
  text("Sociedad", 180, -100);
  fill(108, 232, 171);
  text("Cliente y Empresario", 180, -70);
  fill(108, 135, 232);
  text("Producto", 180, -40);
  fill(232, 108, 230);
  text("Juicio", 180, -10);
  fill(232, 108, 108);
  text("Gestion", 180, 20);
  fill(232, 170, 108);
  text("Profesion", 180, 50);
  fill(229, 232, 108);
  text("Companeros", 180, 80);
  fill(175, 108, 232);
  text("Personas", 180, 110);

  fill(0);

  rotate(i);
  //figuras
  ellipse(0, 0, 300, 300);
  fill(255, 255, 255);
  ellipse(0, 0, 290, 290);
  //div
  strokeWeight(2);
  line(0, 0, 105, 105);
  line(0, 0, -105, -105);
  line(0, 0, 145, 0);
  line(0, 0, -145, 0);
  line(0, 0, 0, 145);
  line(0, 0, 0, -145);
  line(0, 0, 105, -105);
  line(0, 0, -105, 105);
  //colores
  fill(108, 206, 232);
  ellipse(100, 40, 50, 50);
  fill(108, 232, 171);
  ellipse(-100, -40, 50, 50);
  fill(108, 135, 232);
  ellipse(100, -40, 50, 50);
  fill(232, 108, 230);
  ellipse(-100, 40, 50, 50);
  fill(232, 108, 108);
  ellipse(40, 100, 50, 50);
  fill(232, 170, 108);
  ellipse(40, -100, 50, 50);
  fill(229, 232, 108);
  ellipse(-40, -100, 50, 50);
  fill(175, 108, 232);
  ellipse(-40, 100, 50, 50);
  popMatrix();

  fill(0);
  triangle((width/2)-40, 40, (width/2)+40, 40, (width/2), 120);
  rect(width/2, height, 800, 400);
  if (t<n) {
    i=i+advance;
  } else {
    if (advance<=0) {
      advance=0;
      delay(2000);
      cuadrosPreguntas();
    } else {
      i=i+advance;
      advance=advance-0.0005;
    }
  }
  t++;
}


void cuadrosPreguntas () {
  loadPrg();
  loadQuestion();
  fill(157, 103, 59);
  rect(0, 0, width*2, height*2);

  //text ();
  for (int i = 0; i < 4; i++) {
    respuestas[i].pintar();
  }
  mostrarPregunta();
}

void mouseClicked () {
  if (numerito != 1) {
    for (int i = 0; i < 4; i++) {
      if (mouseX > respuestas[i].x && mouseX < respuestas[i].x3 && mouseY > respuestas[i].y1 && mouseY < respuestas[i].y2 ) {
        break;
      }
    }
  }
  if (mouseX > (width/2-150) && mouseX < (width/2 + 150) && mouseY > (600-75) && mouseY < (750-75)) {
    numerito = 2;
  }
  if (mouseX > (width/2-150) && mouseX < (width/2 + 150) && mouseY > (800-75) && mouseY < (950-75)) {
    exit();
  }
}

////////////////////////////////////////////////Metodos de preguntas////////////////////////////////////////////////////
void loadQuestion() {

  if (preguntaLoaded== true) {
    switch(key) {
    case 'j':
      rtaCh=0;
      chsyn=true;
      break;
    case 'k':
      rtaCh=1;
      chsyn=true;
      break;
    case 'l':
      rtaCh=2;
      chsyn=true;
      break;
    case 'x':
      rtaCh=3;
      chsyn=true;
      break;
    case'r':
      break;
    default :
      println("Seleccion invalida");
      break;
    }
  }
}
boolean verifDup(ArrayList<String> input) {
  for (int i=0; i<input.size(); i++) {
    for (int j=0; j<input.size(); j++) {
      if (input.get(i).toString().equals(input.get(j).toString()) && i!=j) {
        return true;
      }
    }
  }
  return false;
}

void loadPrg() {
  ArrayList<String> respuesta = new ArrayList<String>(); 
  String [] pregF;
  int k = 0;
  switch (int(pregunta)) {
  case 1:
    k= int(random(0, 5));
    pregunta = 9;

    break;
  case 2:
    k= int(random(6, 10));
    pregunta = 9;

    break;
  case 3:
    k= int(random(11, 15));
    pregunta = 9;

    break;
  case 4:
    k= int(random(16, 20));
    pregunta = 9;

    break;
  case 5:
    k= int(random(21, 25));
    pregunta = 9;

    break;
  case 6:
    k= int(random(26, 30));
    pregunta = 9;

    break;
  case 7:
    k= int(random(31, 35));
    pregunta = 9;

    break;
  case 8:
    k= int(random(36, preguntas.length));
    pregunta = 9;

    break;
  case 9:
    break;
  }
  //println("Numero de pregunta: " +pregunta);
  //println("Numero variable n: " + n);
  pregF= preguntas[k].split(";");

  int opt= int(random(0, 4));
  boolean jk= true;
  while (jk==true) { 
    respuesta =new ArrayList<String>();
    for (int h=0; h<=3; h++) {
      int z= int(random(0, preguntas.length));
      String[] pregH= preguntas[z].split(";");
      respuesta.add(pregH[3]);
    }
    respuesta.add(opt, pregF[3]);

    jk=verifDup(respuesta);
  }
  pregS= new Pregunta(int(pregF[0]), int (pregF[1]), false, pregF[2], respuesta, opt);
  preguntaLoaded= true;
  pregS.imprP();
  alrdP[count]= pregS.prgId;
  count ++;
  pregunta = 9;
  preguntaTexto = pregS.corpusP;
  resp = pregS.corpusR;
  delay(5000);
}

void mostrarPregunta () {
  fill(#3B444D);
  rectMode(CORNER);
  rect(x-1050, 10, 2 *(x + 825), height/2);
  fill(#FFFFFF);
  textSize(28);
  text(preguntaTexto,width/2-900,400);
  textSize(50);
  text(resp.get(0),100,y+75);
  text(resp.get(1),100,y+175);
  text(resp.get(2),100,y+275);
  text(resp.get(3),100,y+375);
  fill(#FFFFFF);
  rect(x-900,20,200,30);
}
void menu () {
  fill(#FFFFFF);
  rect(0, 0, width*2, height*2);
  textSize(200);
  fill(#FC0A0A);
  text("LE ROULETTE", width/2-600, 300);
  rect(width/2, 600, 300, 150, 20);
  rect(width/2, 800, 300, 150, 20);
  fill(#034316);
  textSize(50);
  text("Jugar", width/2-50, 605);
  text("Salir", width/2-50, 805);
}

void procesarP() {
  if (pregS.opt == rtaCh) {
    println("Respuesta correcta");
    //respuestas.col
  } else {
    println("Incorrecto");
  }
  chsyn=false;
  preguntaLoaded=false;
}
