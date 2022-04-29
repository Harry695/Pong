void gameover() {
  scoreboard();
  if (leftScore > rightScore) {
    textSize(50);
    fill(blue);
    text("BLUE WINS!", 450, 340);
  } else {
    textSize(50);
    fill(red);
    text("RED WINS!", 450, 340);
  }
   textSize(20);
   text("CLICK ANYWHERE TO RETURN TO MENU", 450, 450);

}

void gameoverClicks() {
  mode = INTRO;
  gameInit();
  paddlesInit();
}
