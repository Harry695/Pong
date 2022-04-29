void pause() {
  fill(brown);
  textSize(50);
  text("PAUSED", 450, 340);
  textSize(20);
  text("CLICK ANYWHERE TO RESUME GAME", 450, 450);
}

void pauseClicks() {
  mode = GAME;
}
