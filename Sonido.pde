import gifAnimation.*;
import processing.sound.*;
import ddf.minim.*;
import processing.sound.*;

// Variables for GIF files and sounds
Pulse pulso;
Minim minim;
Gif charlieGIF;
Gif lisaGIF;
Gif annieGIF;
Gif spaceGIF;
AudioPlayer EscenaLisa, annie, peanuts, space;
PImage tv;
float x,y;
int a=470;
int j=0;
int s=5;
int k= -250;
/* Variables for buttons on TV*/
int charlieX, charlieY, lisaX,lisaY, annieX, annieY, spaceX, spaceY;
int radio= 5;
int botonX=530, boton1Y=260;
int boton2Y = boton1Y+30, boton3Y=boton2Y+30, boton4Y=boton3Y+30, boton5Y= boton4Y+30;

void setup(){
  size(640,480, P3D);
  tv= loadImage("tv.jpg");
  tv.resize(640,480);
  pulso = new Pulse(this);
/*Load GIF files*/
  charlieGIF = new Gif(this, "charlie.gif");
  charlieGIF.loop();
  lisaGIF = new Gif(this, "lisa.gif");
  lisaGIF.loop();
  annieGIF = new Gif(this, "annie.gif");
  annieGIF.loop();
  spaceGIF = new Gif(this, "space.gif");
  spaceGIF.loop();
  minim= new Minim(this);
/*Load sound-music files*/
  peanuts= minim.loadFile("peanuts.mp3");
  annie= minim.loadFile("annie.wav");
  EscenaLisa= minim.loadFile("lisa.mp3");
  space=minim.loadFile("space.mp3");
}

void draw(){
 image(tv,0,0);
 /*Rectangle base TV's screen */
 noStroke();
 fill(0);
 rect(30,30,460,370,7);
 fill(255);
 text("Presione el número 0 para encender el televisor", 20,50);
 ellipse(botonX,boton1Y,10,10);  
  text("0", botonX+3, boton1Y);
 ellipse(botonX,boton2Y,10,10);  
 text("1", botonX+3, boton2Y); 
 ellipse(botonX,boton3Y,10,10); 
 text("2", botonX+3, boton3Y);
 ellipse(botonX,boton4Y,10,10); 
 text("3", botonX+3, boton4Y);
 ellipse(botonX,boton5Y,10,10);
 text("4", botonX+3, boton5Y);
  
  
    if (key ==  '0'){
       if( peanuts.isPlaying() | EscenaLisa.isPlaying() | annie.isPlaying() | space.isPlaying()){
       peanuts.pause();
       EscenaLisa.pause();
       annie.pause();
       space.pause(); 
       }
      fill(0,250,0);
      ellipse(botonX,boton1Y,10,10); 
      estatica();
    }
     if (key == '1'){
       if( EscenaLisa.isPlaying() | annie.isPlaying() | space.isPlaying()){
       EscenaLisa.pause();
       annie.pause();
       space.pause();
   }
    fill(0,250,0);
    ellipse(botonX,boton2Y,10,10); 
    channel1();
     }
     if (key == '2'){
     if( peanuts.isPlaying() | annie.isPlaying() | space.isPlaying()){
       peanuts.pause();
       annie.pause();
       space.pause(); 
     }
     fill(0,250,0);
     ellipse(botonX,boton3Y,10,10);
     channel2();
     }
     if (key == '3'){
       if( peanuts.isPlaying() | EscenaLisa.isPlaying() | space.isPlaying()){
       peanuts.pause();
       EscenaLisa.pause();
       space.pause();
       }
       fill(0,250,0);
       ellipse(botonX,boton4Y,10,10);
       channel3(); 
     }
     if (key == '4') {
     if( peanuts.isPlaying() | EscenaLisa.isPlaying() | annie.isPlaying() ){
       peanuts.pause();
       EscenaLisa.pause();
       annie.pause();
     }
     fill(0,250,0);
     ellipse(botonX,boton5Y,10,10);
     channel4();
     }
}

/*Code for each channel and static on tv*/ 
void channel1(){
  image(charlieGIF, 28, 30);
  peanuts.play();
}

void channel2(){
  image(lisaGIF, 28, 45);
  EscenaLisa.play();

}

void channel3(){
  image(annieGIF, 35, 70);
   annie.play();
}

void channel4(){
image(spaceGIF, 35, 70);
   space.play();
}

void estatica(){
 frameRate(100);
for (int i=0;i<=0.5*a;i++) {
      stroke(255);
      x = random(30,a+20);
      y = random(30,410);
      line(x,y,x+random(0,s),y);
  }
  stroke(100,100);
  line(30,j,a,j);
  j++;
  if (j>a) {
    j=0;
  }
  stroke(100,100);
  line(30,k,a-30,k);
  k++;
  if (k>a) {
    k=30;
  }
  pulso.play();
}
