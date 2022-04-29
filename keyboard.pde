void keyPressed() {
  //left paddle
  if (key == 'w' || key == 'W') isWPressed = true;
  if (key == 's' || key == 'S') isSPressed = true;
  if (keyCode == UP) isUpPressed = true;
  if (keyCode == DOWN) isDownPressed = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') isWPressed = false;
  if (key == 's' || key == 'S') isSPressed = false;
  if (keyCode == UP) isUpPressed = false;
  if (keyCode == DOWN) isDownPressed = false;
}
