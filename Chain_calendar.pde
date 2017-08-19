
PFont fArial;
PFont fImpact;
PFont fAndalus;
PFont fGabrielle;
Month[] y2015 = new Month[8];
int N = 1;
byte menAc;
boolean[] menE = new boolean[4];  // Convertir ESTA variable en un vector booleano público que dependa de menAc y controle la escena según menAc.
boolean tild;
boolean umlaut;
String title = "Don't break the chain";
String[] dataChain = new String[9];
String[] dataNotes = new String[8];
char letter;
char[] ch1;
byte iNotes;

void setup() {
  size(940, 620);
  fArial = createFont("Arial",25,true);
  fImpact = createFont("Impact", 25, true);
  fAndalus = createFont("Andalus", 25, true);
  fGabrielle = createFont("Gabrielle", 25, true);
  y2015[0] = new Month("Mayo", byte(31), 4, 140, 100);
  y2015[1] = new Month("Junio", byte(30), 0, 360, 100);
  y2015[2] = new Month("Julio", byte(31), 2, 580, 100);
  y2015[3] = new Month("Agosto", byte(31), 5, 800, 100);
  y2015[4] = new Month("Septiembre", byte(30), 1, 140, 370);
  y2015[5] = new Month("Octubre", byte(31), 3, 360, 370);
  y2015[6] = new Month("Noviembre", byte(30), 6, 580, 370);
  y2015[7] = new Month("Diciembre", byte(31), 1, 800, 370);
  
  String[] dataLoad = loadStrings("Data.save");
  String[] dataNotesLoad = loadStrings("DataNotes.save");
  N = int(dataLoad[0]);
  if (N < 1) N = 1;
  for (int i = 0; i < 8*N; i++) {
    if (dataLoad[i+1].equals("null")) {
      dataLoad[i+1] = "0";
      for (byte b = 0; b < y2015[(i+1)%8].ndays-1; b++)  dataLoad[i+1] = dataLoad[i+1] + ",0";
    }
    y2015[i].cchain = int(split(dataLoad[i+1],','));
    String[][] dataNotesLoadb = new String[8][y2015[i].ndays];
    dataNotesLoadb[i] = split(dataNotesLoad[i], 'ÿ');
    for (byte b = 0; b < y2015[i].ndays; b++) y2015[i].notes[b] = split(dataNotesLoadb[i][b],'ö');
  }
}

void draw() {
  background(0);
  stroke(110);
  fill(0);
  if (menAc != 5) {
    if (menAc == 0) {
      if (40 <= mouseX && mouseX <= 70 && 30 <= mouseY && mouseY <= 60) {
        fill(150, 0, 150, 70);
        menE[0] = true;
      } else {
        fill(0);
        menE[0] = false;
      }
    }
    rect(40, 30, 30, 30);
  } else {
    stroke(60);
    rect(40, 30, 30, 30);
  }
  noStroke();
  textFont(fGabrielle, 28);
  textAlign(LEFT);
  fill(200, 0, 0, 180);
  ellipse(120, 30, 20, 10);
  fill(0, 0, 200, 160);
  ellipse(275, 30, 20, 10);
  fill(200);
  text("Pintura", 140, 40);
  text("Leer " + N, 295, 40);
  textFont(fImpact, 26);
  fill(0, 100, 100, 150);
  text(title, 2*width/3, 40);
  fill(200);
  text("2.015", width/2-30, 70);
  for (int i1 = 0; i1 < 8; i1++) {
    if (menAc == 0) {
      y2015[i1].display(true);
    } else {
      y2015[i1].display(false);
    }
  }
  for (int i2 = 0; i2 < 8; i2++) {
    for (int i0 = 0; i0 < y2015[i2].ndays; i0++) {
       if (y2015[i2].bdays[i0]) {
          if (menAc == 1) y2015[i2].menu(i0);
          if (menAc == 2) y2015[i2].menNotes(i0);
          if (menAc == 3 || menAc == 4) y2015[i2].notes(i0,menE[2]);
       } 
    }
  }
  if (menAc >= 5) {
    fill(0);
    rect(40, 70, 200, 115);
    textAlign(LEFT);
    textFont(fAndalus, 22);
    fill(160);
    text("Editar leyenda", 60, 105);
    text("Abrir calendario", 60, 135);
    text("Borrar calendario", 60, 165);
    fill(150, 0, 150, 70);
    if (menAc == 5) {
      if (56 <= mouseX && mouseX <= 226 && 83 <= mouseY && mouseY <= 110) {
        rect(56, 83, 170, 27);
        menE[0] = true;
      } else {
        menE[0] = false;
      }
      if (56 <= mouseX && mouseX <= 226 && 113 <= mouseY && mouseY <= 140) {
        rect(56, 113, 170, 27);
        menE[1] = true;
      } else {
        menE[1] = false;
      }
      if (56 <= mouseX && mouseX <= 226 && 143 <= mouseY && mouseY <= 170) {
        rect(56, 143, 170, 27);
        menE[2] = true;
      } else {
        menE[2] = false;
      }
    }
    if (menAc == 6) {
      fill(0);
      rect(250, 80, 160, 115);
      ellipse(225, 97, 2, 2);
      
      //noStroke();
      fill(200, 0, 0, 180);
      ellipse(270, 110, 10, 10);
      fill(0, 0, 200, 160);
      ellipse(270, 160, 10, 10);
      fill(150, 0, 150, 70);
      if (280 <= mouseX && mouseX <= 395 && 95 <= mouseY && mouseY <= 130) {
        rect(280, 95, 115, 35);
        menE[0] = true;
      } else {
        menE[0] = false;
      }
      if (280 <= mouseX && mouseX <= 395 && 145 <= mouseY && mouseY <= 180) {
        rect(280, 145, 115, 35);
        menE[1] = true;
      } else {
        menE[1] = false;
      }
      fill(200);
      textFont(fGabrielle, 28);
      text("Pintura", 285, 120);
      text("Leer", 285, 170);
    }
  }
}

void mouseClicked() {
  if (menAc == 0) {
    if (menE[0]) {
      menAc = 5;
      menE[0] = false;
    } else {
      for (byte b1 = 0; b1 < 8; b1++) {
        for (byte b2 = 0; b2 < y2015[b1].ndays; b2++) {
          if (y2015[b1].bdays[b2]) {
            if (mouseButton == LEFT) {
              menAc = 1;
            } else if (mouseButton == RIGHT) {
              menAc = 2;
            }
          } 
        }
      }
    }
  } else if (menAc == 1) {
    menAc = 0;
    for (byte b1 = 0; b1 < 8; b1++) {
      for(byte b2 = 0; b2 < y2015[b1].ndays; b2++) {
        if (y2015[b1].bdays[b2]) {
          for (byte b3 = 0; b3 < 4; b3++) {
            if (mouseButton == LEFT) if (menE[b3]) y2015[b1].cchain[b2] = (b3+1)%4; 
            menE[b3] = false;
          }
          y2015[b1].bdays[b2] = false;
        }
      }
      dataChain[b1+1] = join(nf(y2015[b1].cchain, 0), ","); 
    }
    dataChain[0] = str(N);
    saveStrings("Data.save", dataChain);
  } else if (menAc == 2) {
    menAc = 0;
    for (byte b1 = 0; b1 < 8; b1++) {
      for(byte b2 = 0; b2 < y2015[b1].ndays; b2++) {
        if (mouseButton == LEFT) {
            if (menE[0]) {
              menAc = 3;
              menE[0] = false;
            }
            iNotes = 0;
        }
      }
    }
  } else if (menAc == 3) {
    if (mouseButton == LEFT) {
      for (byte b1 = 0; b1 < 8; b1++) {
        for(byte b2 = 0; b2 < y2015[b1].ndays; b2++) {
          if (y2015[b1].bdays[b2]) {
            if (menE[0]) {
              menAc = 0;
              menE[0] = false;
              y2015[b1].bdays[b2] = false;
              for(byte b3 = 0; b3 < 8; b3++) {
                String[] dataNotesDay = new String[y2015[b3].ndays];
                for (byte b4 = 0; b4 < y2015[b3].ndays; b4++) dataNotesDay[b4] = join(y2015[b3].notes[b4], "ö");
                dataNotes[b3] = join(dataNotesDay, "ÿ");
              }
              saveStrings("DataNotes.save", dataNotes);
            }
            if (menE[1]) {
              menE[2] = true;
              menE[1] = false;
              menAc = 4;
            }
          }
        }
      }
    }
  } else if (menAc == 4) {
    if (mouseButton == RIGHT) {
      menAc = 3;
      for (byte b = 0; b < 3; b++) menE[b] = false;
    } else if (mouseButton == LEFT) {
      if (menE[0]) {
        menAc = 0;
        menE[0] = false;
        menE[2] = false;
        for (byte b1 = 0; b1 < 8; b1++) {
          for(byte b2 = 0; b2 < y2015[b1].ndays; b2++) {
            if (y2015[b1].bdays[b2]) {
              y2015[b1].bdays[b2] = false;
              for (byte b3 = 0; b3 < 9; b3++) y2015[b1].notes[b2][b3] = " ";
              for(byte b3 = 0; b3 < 8; b3++) {
                String[] dataNotesDay = new String[y2015[b3].ndays];
                for (byte b4 = 0; b4 < y2015[b3].ndays; b4++) dataNotesDay[b4] = join(y2015[b3].notes[b4], "ö");
                dataNotes[b3] = join(dataNotesDay, "ÿ");
              }
              saveStrings("DataNotes.save", dataNotes);
            }
          }
        }
      }
      if (menE[1]) {
        menAc = 3;
        for (byte b = 1; b < 3; b++) menE[b] = false;
      }
    }
    
  } else if (menAc == 5) {
    menAc = 0;
    for (byte b = 0; b < 3; b++) {
      if (menE[b]) {
        if (mouseButton == LEFT) menAc = byte(6+b);
      }
      menE[b] = false;
    }
  } else if (menAc == 6) {
    menAc = 0;
  } else if (menAc == 7) {
    menAc = 0;
  } else if (menAc == 8) {
    menAc = 0;
  }
}

void keyPressed() {
  if (menAc == 3) {
    for (int i2 = 0; i2 < 8; i2++) {
      for (int i0 = 0; i0 < y2015[i2].ndays; i0++) {
        if (y2015[i2].bdays[i0]) {
          if ((key >= 32 && key <= 255) && key != 180 && key != 168) {
            letter = key;
            if (tild) {
              if (key == 65) key = 193;
              if (key == 69) key = 201;
              if (key == 73) key = 205;
              if (key == 79) key = 211;
              if (key == 85) key = 218;
              if (key == 97) key = 225;
              if (key == 101) key = 233;
              if (key == 105) key = 237;
              if (key == 111) key = 243;
              if (key == 117) key = 250;
              tild = false;
            }
            if (umlaut) {
              if (key == 85) key = 220;
               if (key == 117) key = 252;
               umlaut = false;
            }
            if (y2015[i2].notes[i0][iNotes].equals(" ")) {
              y2015[i2].notes[i0][iNotes] = str(key);
            } else {
              if (y2015[i2].wNotes[i0][iNotes] < 370) {
                y2015[i2].notes[i0][iNotes] = y2015[i2].notes[i0][iNotes] + key;
              } else {
                if (iNotes < 8) iNotes++;
              }
            }
          }
          if (key == 168) umlaut = true;
          if (key == 180) tild = true;
          if (keyCode == UP && iNotes > 0) iNotes--; 
          if (keyCode == DOWN && iNotes < 8) iNotes++; 
          if (key == ENTER && iNotes < 8) {
            if(y2015[i2].notes[i0][iNotes].equals("")) y2015[i2].notes[i0][iNotes] = " ";
            iNotes++;
          }
          if (key == BACKSPACE) {
            if (y2015[i2].notes[i0][iNotes].length() > 1) {
              ch1 = new char[y2015[i2].notes[i0][iNotes].length()-1];
              for (int i = 0; i < y2015[i2].notes[i0][iNotes].length()-1; i++) ch1[i] = y2015[i2].notes[i0][iNotes].charAt(i);
              y2015[i2].notes[i0][iNotes] = new String(ch1);
            } else {
              if (y2015[i2].notes[i0][iNotes].equals(" ")) {
                y2015[i2].notes[i0][iNotes] = " ";
                if (iNotes > 0) iNotes--;
              } else {
                y2015[i2].notes[i0][iNotes] = " ";
              }
            }
          }
        }
      }
    }
  }
}

class Month {
  String name;
  byte ndays;
  int iweek;
  int x;
  int y;
  byte alarg = 0;
  boolean[] bdays;
  int[] cdaysx;
  int[] cdaysy;
  int[] cchain;
  String[][] notes;
  float[][] wNotes;
  
  Month(String tname, byte tndays, int tiweek, int tx, int ty) {
    name = tname;
    ndays = tndays;
    iweek = tiweek;
    x = tx;
    y = ty;
    if ((iweek >= 5 && ndays == 31) || (iweek == 6 && ndays == 30)) alarg = 1;
    bdays = new boolean[ndays];
    cdaysx = new int[ndays];
    cdaysy = new int[ndays];
    cchain = new int[ndays];
    notes = new String[ndays][9];
    wNotes = new float[ndays][9];
    for (byte b1 = 0; b1 < ndays; b1++) {
      for (byte b2 = 0; b2 < 9; b2++) notes[b1][b2] = " ";
    }
  }
  
  void display(boolean interact) {
    textAlign(CENTER);
    textFont(fArial, 26);
    fill(200);
    text(name, x, y-10);
    stroke(90);
    fill(0, 0, 0, 200);
    ellipse(x,y, 5, 5);
    fill(180);
    textFont(fAndalus, 20);
    text("L   M   X   J   V   S   D", x, y+25);
    stroke(80);
    for (int i = -1; i < 7; i++) line(x-64+25*i, y+25, x-64+25*i, y+185+30*alarg);
    for (int i = 0; i < 6+alarg; i++) line(x-95, y+30+30*i, x+91, y+30+30*i); 
    textFont(fAndalus, 16);
    byte y1 = 0;
    for (int i = 0; i < ndays; i++) {
      fill(160);
      text(i+1, x-77+((i+iweek)%7)*25, y+48+30*y1);
      cdaysx[i] = x-77+((i+iweek)%7)*25;
      cdaysy[i] = y+48+30*y1;
      boolean conNota = false;
      for (byte b = 0; b < 9; b++) if (!notes[i][b].equals(" ")) conNota = true;
      if (conNota) {
         stroke(140);
         line(cdaysx[i]+7, cdaysy[i]-1, cdaysx[i]+7, cdaysy[i]+3);
         line(cdaysx[i]+5, cdaysy[i]+1, cdaysx[i]+9, cdaysy[i]+1);
      }
      stroke(80);
      if (cchain[i] > 0) {
        if (cchain[i] == 1) fill(200, 0, 0, 200);
        if (cchain[i] == 2) fill(0, 0, 200, 200);
        if (cchain[i] == 3) fill(200, 200, 200, 200);
        ellipse(cdaysx[i], cdaysy[i]+5, 10, 5);
      }
      if (interact) {
        if (cdaysx[i]-9 <= mouseX && mouseX <= cdaysx[i]+10 && cdaysy[i]-15 <= mouseY && mouseY <= cdaysy[i]+9) {
            fill(150, 0, 150, 70);
            rect(cdaysx[i]-9, cdaysy[i]-15,19,24);
            bdays[i] = true;
        } else {
           bdays[i] = false; 
        }
      }
      if (cdaysx[i]-x > 65) {
        y1++;
      }
    }
  }
  
  void menu(int index) {
    fill(150, 0, 150, 60);
    rect(cdaysx[index]-9, cdaysy[index]-15,19,24);
    fill(0, 0, 0, 250);
    int s = 1;
    if(name == "Agosto" || name == "Diciembre") s = -1;
    beginShape();
      vertex(cdaysx[index]+20*s, cdaysy[index]);
      vertex(cdaysx[index]+30*s, cdaysy[index]-40);
      vertex(cdaysx[index]+120*s, cdaysy[index]-40);
      vertex(cdaysx[index]+120*s, cdaysy[index]+40);
      vertex(cdaysx[index]+30*s, cdaysy[index]+40);
    endShape(CLOSE); 
    for (int j = 0; j < 3; j++) {
      if (j == 0) fill(200, 0, 0, 200);
      if (j == 1) fill(0, 0, 200, 200);
      if (j == 2) fill(200, 200, 200, 200);
        ellipse(cdaysx[index]-25+75*s+25*j, cdaysy[index]-20, 10, 5);
        if (cdaysx[index]-35+75*s+25*j <= mouseX && mouseX <= cdaysx[index]-15+75*s+25*j && cdaysy[index]-30 <= mouseY && mouseY <= cdaysy[index]-10) {
          fill(150, 0, 150, 70);
          rect(cdaysx[index]-35+75*s+25*j, cdaysy[index]-30,20,20);
          menE[j] = true;
        } else {
          menE[j] = false; 
        }
    }
    textFont(fAndalus, 16);
    fill(160);
    text("Borrar", cdaysx[index]-(5/2)+s*(70+(5/2)), cdaysy[index]+20);
    if (cdaysx[index]-(5/2)+s*(70+(5/2))-25 <= mouseX && mouseX <= cdaysx[index]-(5/2)+s*(70+(5/2))+25 && cdaysy[index]+4 <= mouseY && mouseY <= cdaysy[index]+24) {
      fill(150, 0, 150, 70);
      rect(cdaysx[index]-(5/2)+s*(70+(5/2))-25, cdaysy[index]+4,52,20);
      menE[3] = true;
    } else {
      menE[3] = false;
    }
  }
  
  void menNotes(int index) {
    fill(150, 0, 150, 60);
    rect(cdaysx[index]-9, cdaysy[index]-15,19,24);
    fill(0, 0, 0, 250);
    int s = 1;
    if(name == "Agosto" || name == "Diciembre") s = -1;
    beginShape();
      vertex(cdaysx[index]+20*s, cdaysy[index]);
      vertex(cdaysx[index]+30*s, cdaysy[index]-20);
      vertex(cdaysx[index]+130*s, cdaysy[index]-20);
      vertex(cdaysx[index]+130*s, cdaysy[index]+20);
      vertex(cdaysx[index]+30*s, cdaysy[index]+20);
    endShape(CLOSE);
    textFont(fAndalus, 16);
    fill(160);
    textAlign(LEFT);
    boolean conNota = false;
    for (byte b = 0; b < 9; b++) if (!notes[index][b].equals(" ")) conNota = true;
    if (!conNota) {
      text("Añadir nota", cdaysx[index]-(77/2)+s*(40+(77/2)), cdaysy[index]+5);
    } else {
      text("Editar nota", cdaysx[index]-(77/2)+s*(40+(77/2)), cdaysy[index]+5);
    }
    if (cdaysx[index]-(77/2)+s*(40+(77/2))-5 <= mouseX && mouseX <= cdaysx[index]-(77/2)+s*(40+(77/2))+80 && cdaysy[index]-11 <= mouseY && mouseY <= cdaysy[index]+10) {
      fill(150, 0, 150, 70);
      rect(cdaysx[index]-(77/2)+s*(40+(77/2))-5, cdaysy[index]-11,85,21);
      menE[0] = true;
    } else {
      menE[0] = false;
    }
  }
  
  void notes(int index, boolean del) {
    fill(150, 0, 150, 60);
    rect(cdaysx[index]-9, cdaysy[index]-15,19,24);
    fill(0, 0, 0, 250);
    int s = 1;
    if (name == "Julio" || name == "Agosto" || name == "Noviembre" || name == "Diciembre") s = -1;
    beginShape();
      vertex(280+240*s, 60);
      vertex(660+240*s, 60);
      vertex(660+240*s, (695/2)+(485/2)*s);
      vertex(470, (695/2)+(485/2)*s);
      vertex(470, (695/2)-(485/2)*s);
      vertex(280+240*s, (695/2)-(485/2)*s);
    endShape(CLOSE);
    textFont(fGabrielle, 28);
    fill(160);
    textAlign(RIGHT);
    if (s == 1) textAlign(LEFT);
    text(str(index+1) + " de " + name.toLowerCase(), width/2+70*s, 90);
    line(width/2+70*s, 105, 470+410*s, 105);
    line(width/2+20*s, height-75, 470+410*s, height-75);
    textAlign(LEFT);
    textFont(fAndalus, 22);
    for (int i = 0; i < 9; i++) text(notes[index][i], 275+215*s, 140+49*i);
    wNotes[index][iNotes] = textWidth(notes[index][iNotes]);
    fill(200);
    if (!del) if (millis()%1500 > 200) ellipse(280+215*s + textWidth(notes[index][iNotes]), 138+49*iNotes, 2, 2);
    if (516+215*s <= mouseX && mouseX <= 593+215*s && height-66 <= mouseY && mouseY <= height-39) {
      fill(150, 0, 150, 60);
      menE[0] = true;
    } else {
      fill(0, 0, 0, 60);
      menE[0] = false;
    }
    rect(516+215*s, height-66, 77, 27);
    if (601+215*s <= mouseX && mouseX <= 675+215*s && height-66 <= mouseY && mouseY <= height-39) {
      fill(150, 0, 150, 60);
      menE[1] = true;
    } else {
      fill(0, 0, 0, 60);
      menE[1] = false;
    }
    rect(601+215*s, height-66, 74, 27);
    textFont(fGabrielle, 20);
    fill(160);
    text("Guardar", 526+215*s, height-47);
    text("Eliminar", 611+215*s, height-46);
    if (del) {
      fill(0);
      rect(width/2-90, height/2-100, 180, 80);
      fill(160);
      textAlign(CENTER);
      textFont(fAndalus, 20);
      text("¿Eliminar nota?", width/2, height/2-70);
      if (width/2-65 <= mouseX && mouseX <= width/2-15 && height/2-55 <= mouseY && mouseY <= height/2-30) {
        fill(150, 0, 150, 60);
        menE[0] = true;
      } else {
        fill(0, 0, 0, 60);
        menE[0] = false;
      }
      rect(width/2-65, height/2-55, 50, 25);
      if (width/2+15 <= mouseX && mouseX <= width/2+65 && height/2-55 <= mouseY && mouseY <= height/2-30) {
        fill(150, 0, 150, 60);
        menE[1] = true;
      } else {
        fill(0, 0, 0, 60);
        menE[1] = false;
      }
      rect(width/2+15, height/2-55, 50, 25);
      fill(130);
      textAlign(LEFT);
      text("Sí", width/2-48, height/2-35);
      textFont(fAndalus, 19);
      fill(140);
      text("No", width/2+29, height/2-35);
    }
  }
}
