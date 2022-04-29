void game() {
  stroke(black);
  strokeWeight(5);
  fill(white);
  rect(1, 1, 899, 719);
  line(450, 0, 450, 720);
  scoreboard();
  
  
  //paddles
  strokeWeight(3);
  stroke(black);
  fill(blue);
  circle(leftPaddleX, leftPaddleY, leftPaddleD);
  fill(red);
  circle(rightPaddleX, rightPaddleY, rightPaddleD);

  //paddle control
  //left
  if (isWPressed == true) leftPaddleY = leftPaddleY - paddleSpeed;
  if (isSPressed == true) leftPaddleY = leftPaddleY + paddleSpeed;
  //right
  if (isAIOn == true) {
    AI1();
  } else {
    if (isUpPressed == true) rightPaddleY = rightPaddleY - paddleSpeed;
    if (isDownPressed == true) rightPaddleY = rightPaddleY + paddleSpeed;
  }
  paddleLimit();

  //ball
  stroke(black);
  fill(ballColour);
  circle(ballX, ballY, ballD);
  if (ballTimer < 0) {
    ballX = ballX + ballVX;
    ballY = ballY + ballVY;
  }

  if (ballX > 450) {
    ballColour = red;
  } else {
    ballColour = blue;
  }

  ballCollision(leftPaddleX, leftPaddleY, leftPaddleD/2);
  ballCollision(rightPaddleX, rightPaddleY, rightPaddleD/2);
  ballWallCollision();
  ballTimer--;

  //gameover check
  if (leftScore >= 3 || rightScore >= 3) {
    mode = GAMEOVER;
    backgroundMusic.pause();
    win.rewind();
    win.play();
  }
  
}

void gameClicks() {
  mode = PAUSE;
}

void ballCollision(float x, float y, float r) {
  if (dist(ballX, ballY, x, y) <= ballD/2+r) {
    ballVX = (ballX - x)/speedFactor;
    ballVY = (ballY - y)/speedFactor;
    bounce.rewind();
    bounce.play();
  }
}

void ballWallCollision() {
  if (ballX + ballD/2 >= width) {
    leftScore++;
    ballInit();
    ballVX = 3;
    score.rewind();
    score.play();
  }
  if (ballX - ballD/2 <= 0) {
    rightScore++;
    ballInit();
    ballVX = -3;
    score.rewind();
    score.play();
  }
  if (ballY + ballD/2 >= height || ballY - ballD/2 <= 0) {
    ballVY = ballVY * -1;
    bounce.rewind();
    bounce.play();
  }
}

void paddleLimit () {
  if (leftPaddleY <= 100) leftPaddleY = 100;
  if (leftPaddleY >= 580) leftPaddleY = 580;
  if (rightPaddleY <= 100) rightPaddleY = 100;
  if (rightPaddleY >= 580) rightPaddleY = 580;
}

void ballLimit () {
  if (ballY < ballD/2) ballY = ballD/2;
  if (ballY > height-ballD/2) ballY = height-ballD/2;
}


void AI1() {
  if (isAIOn = true) {
    if (ballX > width/2) {
      if (rightPaddleY > ballY) {
        rightPaddleY = rightPaddleY - paddleSpeed;
      }
      if (rightPaddleY < ballY) {
        rightPaddleY = rightPaddleY + paddleSpeed;
      }
    }
  }
}

void scoreboard() {
  stroke(black);
  fill(black);
  rect(375, 0, 150, 75);
  textSize(50);
  fill(white);
  textFont(textFont);
  text(leftScore+":"+rightScore, width/2, 37);
}
