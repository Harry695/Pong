void intro() {
  image(background, 0, 0, 900, 800);
  strokeWeight(3);
  fill(black);
  textFont(titleFont);
  text("Pong!", 450, 250);
  textSize(40);
  fill(lightBlue);
  tactileRect(150, 450, 190, 100);
  rect(150, 450, 190, 100, 20);
  fill(blue);
  textFont(textFont);
  text("1 PLAYER", 245, 500);
  fill(lightBlue);
  tactileRect(560, 450, 190, 100);
  rect(560, 450, 190, 100, 20);
  fill(red);
  text("2 PLAYERS", 655, 500);
}

void introClicks() {
  if (mouseX > 150 && mouseX < 340 && mouseY > 450 && mouseY < 550) {
    isAIOn = true;
    backgroundMusic.rewind();
    backgroundMusic.play();
    mode = GAME;
  }
  if (mouseX > 560 && mouseX < 750 && mouseY > 450 && mouseY < 550) {
    isAIOn = false;
    backgroundMusic.rewind();
    backgroundMusic.play();
    mode = GAME;
  }
}
