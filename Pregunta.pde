class Pregunta {

  int tipo, opt, prgId;
  boolean Pass;
  String corpusP;
  ArrayList<String> corpusR; 

  Pregunta (int prgId, int tipo, boolean Pass, String corpusP, ArrayList<String> corpusR, int opt) {
    this.tipo = tipo;
    this.Pass = Pass; 
    this.corpusP =corpusP;
    this.corpusR =corpusR;
    this.opt=opt;
  }

  void imprP() {
    String impresion = this.corpusP + "\n" + this.opt + ": " + this.corpusR;
    println(impresion);
  }
}
