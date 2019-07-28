class Respuesta {
  int x, y;
  String [] answrs;
  int x1,x2,x3,y1,y2;
  color col;
  Respuesta (int x, int y, String [] answrs,color col) {
    this.x = x;
    this.y = y;
    this.answrs = answrs.clone();
    this.x1 = this.x +25;
    this.x2 = this.x +400;
    this.x3 = this.x + 425;
    this.y1 = y-50;
    this.y2 = y+50;
    this.col = col;
  }

  void pintar () {
    fill(col);
    beginShape();
    vertex(x, y);
    vertex(x1, y1);
    vertex(x2, y1);
    vertex(x3, y);
    vertex(x2, y2);
    vertex(x1, y2);   
    endShape(CLOSE);
  }
}
