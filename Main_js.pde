String[] preguntas;
int[] alrdP; 
Pregunta pregS;
Pregunta pregSH;
boolean preguntaLoaded= false, chsyn=false;
int rtaCh, count=0;

void setup() {
  size(600, 300);
  preguntas = loadStrings("preguntas.txt");
  alrdP=new int[preguntas.length];
}

void draw() {
  if (chsyn==true) {
    procesarP();
  }
}
void keyTyped() {
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
    case 'ñ':
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
