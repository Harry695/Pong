//Harry Ouyang
//blk 3
//Created 2022-04-08
//Finished 2022-04-27

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

//MODE FRAMEWORK
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//entity variables
float leftPaddleX, leftPaddleY, leftPaddleD, rightPaddleX, rightPaddleY, rightPaddleD, paddleSpeed; //paddles
float ballX, ballY, ballD; //ball

//game variables
float ballVX, ballVY, speedFactor;
int leftScore, rightScore, ballTimer;
boolean isAIOn = false;

//keyboard variables
boolean isWPressed, isSPressed, isUpPressed, isDownPressed;

//color variables
color blue = #1368aa;
color red = #f00c18;
color black = #000000;
color white = #FFFFFF;
color lightBlue = #9fc9f3;
color brown = #764c24;
color ballColour;

//font
PFont titleFont, textFont;

//image
PImage background;

//sound
AudioPlayer win, bounce, score, backgroundMusic;

void setup() {
  size(900, 680, P2D);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  minim = new Minim(this);
  
  //sound init
  bounce = minim.loadFile("bounce.wav");
  win = minim.loadFile("win.wav");
  score = minim.loadFile("score.wav");
  backgroundMusic = minim.loadFile("background.mp3");
  
  //fonts init
  titleFont = createFont("titleFont.otf", 200);
  textFont = createFont("textFont.ttf", 20);
  
  //image init
  background = loadImage("background.jpg");
  
  //paddles init
  leftPaddleX = 0;
  leftPaddleY = height/2;
  leftPaddleD = 200;
  
  rightPaddleX = width;
  rightPaddleY = height/2;
  rightPaddleD = 200;
  
  paddleSpeed = 7;
  
  //ball init
  ballX = width/2;
  ballY = height/2;
  ballD = 100;
  ballVX = random(-3, 3);
  ballVY = random(-3, 3);
  ballTimer = 100;
  
  //keyboard init
  isWPressed = isSPressed = isUpPressed = isDownPressed = false;
  
  gameInit();
} 

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}

void gameInit() {
  leftScore = 0;
  rightScore = 0;
  ballVX = random(2, 3) * floor(random(2)) * 2 - 1;
  ballInit();
} 

void ballInit() {
  ballX = width/2;
  ballY = height/2;
  ballTimer = 100;
  ballVY = 0;  
  speedFactor = 10;
}

void paddlesInit() {
  leftPaddleY = height/2;
  rightPaddleY = height/2;
}

void tactileRect(int x, int y, int wdt, int hgt) {
  if (mouseX >= x && mouseX <= x + wdt && mouseY >= y && mouseY <= y + hgt) {
    stroke(black);
  } else {
    stroke(white);
  }
}

void tactileCircle(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(black);
  } else {
    stroke(white);
  }
}
