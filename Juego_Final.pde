int x, y;
color col = #2B3679;
String a [] = new String [2];
Respuesta respuestas [] ;
float velocidad=5,radio=80.0;
float i =0, t=0, n=0, advance=0.1, pregunta=0;
String[] preguntas;
int[] alrdP; 
Pregunta pregS;
Pregunta pregSH;
boolean preguntaLoaded= false, chsyn=false;
int rtaCh, count=0;

void setup () {
  ellipseMode(CENTER);
  rectMode(CENTER);
  textSize(28);
  fullScreen();
  x = width/2;
  y = height/2;
  respuestas = new Respuesta [4];
  respuestas[0] = new Respuesta (x-600, y +100, a,col);
  respuestas[1] = new Respuesta (x-600, y +250, a,col);
  respuestas[2] = new Respuesta (x+200, y +100, a,col);
  respuestas[3] = new Respuesta (x+200, y +250, a,col);
  preguntas = loadStrings("preguntas.txt");
  alrdP=new int[preguntas.length];
}

void draw () {
  ruleta();

}
void ruleta () {
  while(n==0||n==41 ||n==88||n==33||n==80){
  n=(int)(Math.random()* 62 )+25;
  break;
  }
  
  if(n>24 && n<34){pregunta=1;}  //amarillo
  if(n>33 && n<42){pregunta=2;}  //verde
  if(n>41 && n<49){pregunta=3;}  //violeta
  if(n>48 && n<57){pregunta=4;}  //morado
  if(n>56 && n<65){pregunta=5;}  //rojo
  if(n>64 && n<73){pregunta=6;}  //azul claro
  if(n>72 && n<81){pregunta=7;}  //azul oscuro
  if(n>80 && n<88){pregunta=8;}  //naranja
  println(pregunta+"  "+n);    //para verificar
   
  //Dibujo
  background(157,103,59);
  strokeWeight(0);
  fill(0);
  rect(width/2,40,800,10);

  
  pushMatrix();
  translate(width/2,(2*height)/7);
  rect(320,0,300,260);
  
  fill(108,206,232);
  text("Sociedad",180,-100);
  fill(108,232,171);
  text("Cliente y Empresario",180,-70);
  fill(108,135,232);
  text("Producto",180,-40);
  fill(232,108,230);
  text("Juicio",180,-10);
  fill(232,108,108);
  text("Gestion",180,20);
  fill(232,170,108);
  text("Profesion",180,50);
  fill(229,232,108);
  text("Companeros",180,80);
  fill(175,108,232);
  text("Personas",180,110);
  
  fill(0);
  
  rotate(i);
  //figuras
  ellipse(0,0,300,300);
  fill(255,255,255);
  ellipse(0,0,290,290);
  //div
  strokeWeight(2);
  line(0,0,105,105);
  line(0,0,-105,-105);
  line(0,0,145,0);
  line(0,0,-145,0);
  line(0,0,0,145);
  line(0,0,0,-145);
  line(0,0,105,-105);
  line(0,0,-105,105);
  //colores
  fill(108,206,232);
  ellipse(100,40,50,50);
  fill(108,232,171);
  ellipse(-100,-40,50,50);
  fill(108,135,232);
  ellipse(100,-40,50,50);
  fill(232,108,230);
  ellipse(-100,40,50,50);
  fill(232,108,108);
  ellipse(40,100,50,50);
  fill(232,170,108);
  ellipse(40,-100,50,50);
  fill(229,232,108);
  ellipse(-40,-100,50,50);
  fill(175,108,232);
  ellipse(-40,100,50,50);
  
  popMatrix();
  

  fill(255,255,255);
  //persona1
  rect(300,520,20,100);
  ellipse(300,450,60,60);
  ellipse(281,450,16,32); 
  ellipse(319,450,16,32);
  //persona2
  rect(500,520,20,100);
  ellipse(500,450,60,60);
  ellipse(481,450,16,32); 
  ellipse(519,450,16,32);
  //persona3
  rect(700,520,20,100);
  ellipse(700,450,60,60);
  ellipse(681,450,16,32); 
  ellipse(719,450,16,32);
  //persona4
  rect(900,520,20,100);
  ellipse(900,450,60,60);
  ellipse(881,450,16,32); 
  ellipse(919,450,16,32);
  
  fill(0);
  triangle((width/2)-10,40,(width/2)+10,40,(width/2),60);
  rect(width/2,height,800,400);
  if(t<n){
  i=i+advance;
  } else{
    if(advance<=0){
    advance=0;
    delay(2000);
    cuadrosPreguntas();
     } else{
       i=i+advance;
       advance=advance-0.0005;}
  }
  t++;
}


void cuadrosPreguntas () {
  loadQuestion();
  fill(157,103,59);
  rect(0,0,width*2,height*2);
  fill(#3B444D);
  rectMode(CORNER);
  rect(x-600,10,x + 525,height/2);
  for (int i = 0; i < 4; i++) {
    respuestas[i].pintar();
  }
}

void mouseClicked () {
  for (int i = 0; i < 4; i++) {
    if (mouseX > respuestas[i].x && mouseX < respuestas[i].x3 && mouseY > respuestas[i].y1 && mouseY < respuestas[i].y2 ) {
      respuestas[0].col = #96AA07;  
      break;
    }
  }
}

////////////////////////////////////////////////Metodos de preguntas////////////////////////////////////////////////////
void loadQuestion() {
  if (key=='r') {
    loadPrg();
  }

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
  ArrayList<String>respuesta =new ArrayList<String>(); 
  int k= int(random(0, preguntas.length));
  String[] pregF= preguntas[k].split(";");
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
}



void procesarP() {
  if (pregS.opt==rtaCh) {
    println("Respuesta correcta");
  } else {
    println("Incorrecto");
  }
  chsyn=false;
  preguntaLoaded=false;
}
