import javax.swing.JOptionPane;
int x, y;
color col = #2B3679;
String a [] = new String [2];
Respuesta respuestas [] ;
void setup () {
  fullScreen();
  x = width/2;
  y = height/2;
  respuestas = new Respuesta [4];
  respuestas[0] = new Respuesta (x-600, y +100, a,col);
  respuestas[1] = new Respuesta (x-600, y +250, a,col);
  respuestas[2] = new Respuesta (x+200, y +100, a,col);
  respuestas[3] = new Respuesta (x+200, y +250, a,col);
}

void draw () {
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
