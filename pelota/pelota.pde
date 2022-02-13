import processing.sound.*;

int jugx = 350;
int jugy = 160;

int jug2x = 35;
int jug2y = 160;

float cir_x = 200;
float cir_y = 200;

float mov_x = 1;
float mov_y = -1;

int ancho=20;
int alto=50;
int D = 20;

int goles1 = 0;
int goles2 = 0;

boolean fin = false;
boolean inicio = false;

SoundFile  rebote;
SoundFile  punto;
SoundFile ganador;

void setup(){
  size(400,400);  
  rebote = new SoundFile(this,"sonidos/mixkit-magic-bubbles-spell-2999.wav");
  punto = new SoundFile(this,"sonidos/mixkit-failure-arcade-alert-notification-240.wav");
  ganador = new SoundFile(this,"sonidos/mixkit-video-game-win-2016.wav");
}

void draw(){ 
  background(128);
  
  if(jugy>=350){
    jugy=350;
  }else if(jugy<=0){
    jugy=0;
  }
  
  if(jug2y>=350){
    jug2y=350;
  }else if(jug2y<=0){
    jug2y=0;
  }
  
  if (key == CODED){
    if(keyCode == UP){
      jugy -= 1;
    } else if(keyCode == DOWN){
      jugy += 1;      
    }        
  }
  
  if(key == 'w'){
    jug2y -=1;
  } else if(key == 's'){
    jug2y +=1;
  }
    
  background(0);    
  

  if(cir_x > width) {
    cir_x = width;
    mov_x = -mov_x;
    goles1+=1;
    punto.play();
  }
  
  if(cir_y > height) {
    cir_y = height;
    mov_y = -mov_y;    
  }
  
  if(cir_x < 0) {
    cir_x = 0;
    mov_x = -mov_x;
    goles2+=1;
    punto.play();
  }
  
  if(cir_y < 0) {
    cir_y = 0;
    mov_y = -mov_y;
  }
  
    
  //Si choca con el jugador de la derecha
  if (mov_x>0 && jugy<=cir_y+D/2 && cir_y-D/2<=jugy+alto && jugx<=cir_x+D/2 && cir_x-D/2<=jugx+ancho){
    mov_x=-mov_x;
    rebote.play();
  }
  
  //Si choca con el jugador de la izquierda
  if (mov_x<0 && jug2y<=cir_y+D/2 && cir_y-D/2<=jug2y+alto && jug2x+ancho>=cir_x-D/2 && cir_x-D/2<=jug2x+ancho){
    mov_x=-mov_x;
    rebote.play();
  }
  
  if(inicio == true){
    cir_x = cir_x + mov_x;
    cir_y = cir_y + mov_y;
  
    ellipse(cir_x, cir_y, D, D);
  
    rect(jugx,jugy,ancho,alto);
    rect(jug2x,jug2y,ancho,alto);
    
    text("Goles jugador 1:  "+goles1, 40, 20);
    text("Goles jugador 2:  "+goles2, 240, 20);
    
    if(goles1 == 1){
      ganador.play();
      goles1=0;
      fin = true;
    }

    if(goles2 == 1){
      ganador.play();    
      goles2=0;
      fin = true;
    }
  }
  
  if(inicio == false){
     fill(0, 408, 612, 204);
     rect(100,100,200,200);   
     fill(255);
     textSize(16);
     text("Pulse la tecla enter", 125, 180);
     text("para empezar", 150, 210);     
     textSize(12);
     text("Help(h)", 180, 280);  
     
    if (key == ENTER){
        inicio=true;           
    }
    
    if(key == 'h'){
      fill(255);
      rect(75,75,250,250); 
    
    } 
    
  
  }
  
  if(fin == true){
      cir_x=200;
      cir_y=200;
      inicio = false;
    }
  
  
  
  
  
  

 

}
