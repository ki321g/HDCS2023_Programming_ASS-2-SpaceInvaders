/* Space Invaders
 *
 * Summary: Main tab of the GAME
 *
 * By: Kieron Garvey
 * Date: 08/Mar/2023
 * Version: 1.0
 */
// Processing Data Types & Datatype
PImage spaceInvaders, gameOver, topFive, enterToPlay, pressEnter, clickPlay, enterToContinue, highScoreAlert;
PFont myFont; //Loads a font

//Declare Objects made from the classes
Player[] player = new Player[2]; // Array of Bullet Objects Each player has 1 million bullets
Bullet[][] bullets = new Bullet[2][10000]; // Array of Bullet Objects Each player has 10000 bullets
Invader[][] invaders = new Invader[15][6]; // Array of Bullet Objects Each player has 10000 million bullets
Bullet[] invadersBullets = new  Bullet[10000];

Scenery sceneryBackground; // declare new object sceneryBackground as Scenery
Timer timePlayedTimer; // declare new object timePlayedTimer as Timer
Text text; // declare new object text as Text

//Global Variables
//Array
int[][] totalBullets = new int[2][1]; // Array counting up the number of bullets fires for each player.
String[] scoreNames = new String[] {"######", "######", "######", "######", "######", "######"};
int[] scorePoints = new int[] {0, 0, 0, 0, 0, 0};

//String
String gameState, p1Name, p2Name, pName;

//boolean
boolean rightPlayer_1 = false, leftPlayer_1 = false, upPlayer_1 = false, downPlayer_1 = false, rightPlayer_2 = false, leftPlayer_2 = false, upPlayer_2 = false, downPlayer_2 = false ;
boolean enterPlayerName = true;
boolean strokeFont;

// float
float leftEdge, rightEdge, topEdge, bottomEdge; // Variables to hold position of each edge of the play button

//int
int widthSketch = 1280;
int heightSketch = 720;
int timePlayed, topScorer, scoreAdded; // used in Timers
int bulletSize, bulletSpeed, bulletColor, playerBulletDistance, p1NumBullets, p2NumBullets, totalInvaders, totalInvadersBullet;
int p1Bullets = 0, p2Bullets = 0, delayP1Bullets = 0, delayP2Bullets = 0, delayInvadersBullets= 0;

//------- setup Method -------
void setup() {
  /* If changing the size also change
   * global variable widthSketch & heightSketch
   */
  size(1280, 720); // Sets the Size of the Sketch

  surface.setTitle("Space Invaders! - Programming Fundamentals Assignment#2"); // Sets Title of Sketch
  surface.setResizable(false); // Stops Sketch being Resized
  surface.setLocation((displayWidth-widthSketch)/2, (displayHeight-heightSketch)/2 - 90); // Sets the position of the sketch to the center of the screen

  spaceInvaders = loadImage("spaceInvaders.png");
  gameOver  = loadImage("gameOver.png");
  topFive  = loadImage("topFive.png");
  enterToPlay  = loadImage("enterToPlay.png");
  pressEnter  = loadImage("pressEnter.png");
  clickPlay  = loadImage("clickPlay.png");
  enterToContinue = loadImage("enterToContinue.png");
  highScoreAlert = loadImage("highScoreAlert.png");

  setupGame(); // Methof Call to Setup the Game   ,
} // end setup Method

//------- draw Method -------
void draw() {
  sceneryBackground.drawScenery(); // used instead of background() to make a coloured background

  /* Calls different Method based on the gameState
   * The Game Starts in the START gamesState */
  if (gameState == "START") {
    // Start of GAME
    startGame();
  } else if (gameState == "PLAY") {
    //Play the GAME
    playGame();
  } else if (gameState == "GAMEOVER") {
    //The GAME is Over
    endGame();
  } else if (gameState == "HIGH_SCORE") {
    //You Got a high Score
    addToHighScores();
  }
} // end draw Method

//------- setupGame method -------
void setupGame() {
  gameState = "START"; //Setting the game state

  // The font must be located in the sketch's
  // "data" directory to load successfully
  myFont = loadFont("TheBombSoundRegular-48.vlw");

  // Setting up the Scenery (aka the Background)
  sceneryBackground = new Scenery(); // setting up background Scenery   //sceneryBackground = new Scenery(205, 120, 0); // setting up background Scenery

  //Setting up the Timers
  timePlayedTimer = new Timer(1000); // setting up timer
  timePlayed = 0;

  // Setting up Variables
  bulletSize = 8;
  bulletSpeed = 8;
  totalInvaders = 90;
  totalInvadersBullet = 0;
  playerBulletDistance = 350;
  p1Bullets = 0;
  p2Bullets = 0;
  p1NumBullets = 0;
  p2NumBullets = 0;
  delayP1Bullets = millis();
  delayP2Bullets = millis();
  delayInvadersBullets = millis();
  p1Name = "PLAYER1";
  p2Name = "PLAYER2";
  pName = "";
  topScorer = 0;
  scoreAdded = 0;

  /* Setting up totalBullets sets Two-Dimensional Array total to 0 */
  for (int i = 0; i<=1; i++) {
    for (int j = 0; j <1; j++) {
      totalBullets[i][j] = 0;
    }
  }

  // used for clicking the Play button
  leftEdge = widthSketch/2 -120;
  rightEdge = widthSketch/2 + 120;
  topEdge = heightSketch/2;
  bottomEdge = heightSketch/2 + 60;
} // end setupGame method

//------- startGame Method -------
void startGame() {
  // startGame code
  imageMode(CENTER);
  image(spaceInvaders, width/2, height/2 - 180);
  image(clickPlay, width/2, height/2 - 30);
  image(pressEnter, width/2, height/2 + 115);
  playButton(); // Show Replay Screen
}// end startGame Method

//------- playGame Method -------
void playGame() {
  // playGame code

  //// DELETE FROM HERE
  //// if mouse goes off the left of the screen WIN
  //// if mouse goes off the right of the screen LOSE
  //if (mouseX < 50) {
  //  // WIN
  //  gameState = "GAMEOVER";
  //  checkPlayerScores();
  //}
  //if (mouseX >width - 50) {
  //  // Lose
  //  gameState = "HIGH_SCORE";
  //}
  //// TO  FROM HERE

  // If statement checks to see the distance between the two players. Here it is used to change the background
  if (dist(player[0].getXCoord(), player[0].getYCoord(), player[1].getXCoord(), player[1].getYCoord()) >= playerBulletDistance ||
    dist(player[0].getXCoord(), player[0].getYCoord(), player[1].getXCoord(), player[1].getYCoord()) <= - playerBulletDistance  ) {
    if (player[0].getYCoord() == -200 || player[1].getYCoord() == -200) {
      sceneryBackground = new Scenery(38, 162, 234);
      for (int i = 0; i <=1; i++) {
        if (!player[i].getPlayerDied()) {
          player[i].setPlayerAllowedShoot(true);
        }
      }
    } else {
      sceneryBackground = new Scenery(205, 120, 0);
      for (int i = 0; i <=1; i++) {
        if (!player[i].getPlayerDied()) {
          player[i].setPlayerAllowedShoot(false);
        }
      }
    }
  } else {
    sceneryBackground = new Scenery(38, 162, 234);
    for (int i = 0; i <=1; i++) {
      player[i].setPlayerAllowedShoot(true);
    }
  }
  //ADD in check to check high scores and add the player with the higher score to the leader board

  //if all invaders are dead resset game over
  if (totalInvaders == 0) {
    checkPlayerScores(); //pass in total invaders & maybe playerhealth
  } else if (player[0].getPlayerHealth() == 0 && player[1].getPlayerHealth() == 0) {
    checkPlayerScores();
  }

  // Timers
  if (timePlayedTimer.complete() == true) {
    timePlayed++;  // Plus one from timePlayed
    timePlayedTimer.start(); // Restart the Timer
  }

  //**************** start of game play code ****************//
  //************ Start Working with Players ************//
  for (int i = 0; i<=1; i++) {
    boolean isPlayerOnScreen = player[i].checkPlayerOnScreen();  //checks if player is leaving teh screen

    if (!isPlayerOnScreen) {
      player[i].movePlayerBackOnScreen(player[i].getMovePlayerOnScreen()); // moves player back on screen
    }

    player[i].createPlayer(); // create the player
    player[i].update(); // update the player
  }
  //************ End Working with PLayers ************//

  //************ Start Working with Bullets ************//
  // Update invaders Bullets
  for (int i = 0; i < totalInvadersBullet; i++ ) {
    invadersBullets[i].update();
    invadersBullets[i].display();

    if (invadersBullets[i].getBulletLeftScreen()) { //If Bullet leaves the screen, satop it moving
      invadersBullets[i].stopBullet();
    }
  }
  //invader bullets
  if (millis() - delayInvadersBullets > 500) {

    int invaderBulletI = int(random(0, 14));
    int invaderBulletJ = int(random(0, 5));

    invadersBullets[totalInvadersBullet].setXCoord(invaders[invaderBulletI][invaderBulletJ].getXCoord());
    invadersBullets[totalInvadersBullet].setYCoord(invaders[invaderBulletI][invaderBulletJ].getYCoord());

    totalInvadersBullet++;
    delayInvadersBullets = millis();
  } else if (invadersBullets[totalInvadersBullet].getYCoord() > -90 && invadersBullets[totalInvadersBullet].getYCoord() < -10 ) {
    invadersBullets[totalInvadersBullet].setBulletSpeed(0);
    totalInvadersBullet--;
  }

  // end invader bullets

  // Updates Bullets for both Players
  for (int i = 0; i<=1; i++) {
    for (int j = 0; j < totalBullets[i][0]; j++) {
      bullets[i][j].update();  // update bullet
      bullets[i][j].display(); // display bullet

      if (bullets[i][j].getBulletLeftScreen()) { //If Bullet leaves the screen, stop it moving
        bullets[i][j].stopBullet();
      }
    }
  }

  //Used to count the total numberof bullets and set variables
  // Player bullets
  for (int i = 0; i<=1; i++) {
    for (int j = 0; j<1; j++) {
      fill(0);
      p1NumBullets = totalBullets[0][j];
      p2NumBullets = totalBullets[1][j];
    }
  }
  // end Player bullets
  //************ End Working with Bullets ************//


  //************************ Start Collision ************************//
  //--------- collisionInvaderBullet ---------//
  for (int i = 0; i<=1; i++) {
    for (int j = 0; j < totalBullets[i][0]; j++) {
      for (int x = 0; x <= 14; x++) {
        for (int y = 0; y <= 5; y++) {
          boolean collisionInvBull = collisionInvaderBullet(invaders[x][y], bullets[i][j]);
          if (collisionInvBull) {
            invaders[x][y].removeInvader(); // Removes invader
            bullets[i][j].removeBullet();  // Removes bullet
            player[i].addToPlayerScore(invaders[x][y].getPointValue() * 10); // adds to players score
            player[i].playerKills += 1;  // adds to players number of kills
            totalInvaders--; // reduces the number of invaders
          }
        }
      }
    }
  }
  //--------- collisionInvaderBullet End ---------//

  //--------- collisionPlayerBullet ---------//
  // ADD CODE TO CHECK IF INVADERS BULLETS HIT PLAYER
  int removePlayerHealth = 0;

  for (int i = 0; i<=1; i++) {
    for (int j = 0; j < totalInvadersBullet; j++ ) {
      boolean collisionPlayerBull = collisionPlayerBullet(player[i], invadersBullets[j]);
      if (collisionPlayerBull) {
        invadersBullets[j].removeBullet(); // removes invaders bullet
        if (removePlayerHealth == 0) {
          player[i].removePlayerHealth(1); // reduces players health
          removePlayerHealth++;
        }
      }
    }
  }
  removePlayerHealth = 0;
  //collisionPlayerBullet();


  //--------- collisionPlayerInvader ---------//
  for (int i = 0; i<=1; i++) {
    for (int x = 0; x <= 14; x++) {
      for (int y = 0; y <= 5; y++) {
        boolean collisionPlayInv = collisionPlayerInvader(player[i], invaders[x][y]);
        if (collisionPlayInv) {
          if (removePlayerHealth == 0) {
            player[i].removePlayerHealth(1); // reduces players health
            invaders[x][y].removeInvader();
            removePlayerHealth++;
          }
        }
      }
    }
  }
  //--------- collisionPlayerInvader End ---------//

  // Move player with no health off screen
  for (int i = 0; i<=1; i++) {
    if (player[i].getPlayerHealth() == 0) {
      player[i].setYCoord(-200);
      player[i].setPlayerDied(true);
    }
  }
  //--------- checkInvaderLeavesScreen ---------//
  checkInvaderLeavesScreen(); // Invader/Screen Sides & Bottom Collision
  //--------- checkInvaderLeavesScreen End ---------//

  //************************  End Collision ************************//

  //************ Start Working with Invaders ************//
  for (int i = 0; i <= 14; i++) {
    for (int j = 0; j <= 5; j++) {
      invaders[i][j].update();
      invaders[i][j].display();
    }
  }
  //************ End Working with Invaders ************//


  //************ Start Working with Scores ************//
  showScore();
  //************ End Working with Invaders ************//
  //**************** end of gameplay code ****************//
}// end playGame Method


//------- endGame Method -------
void endGame() {
  // endGame code
  String scoreRank = "";
  sceneryBackground = new Scenery(205, 120, 0);

  if (scoreAdded == 0) {
    addNewScore(pName, player[topScorer].getPlayerScore());
    scoreAdded++;
  }

  imageMode(CENTER);
  image(gameOver, width/2, height/2 - 210);
  image(topFive, width/2, height/2 - 120);
  image(enterToPlay, width/2, height/2 +200);

  for (int i = 0; i <= 4; i++) {
    if (i==0) {
      scoreRank = "TOP";
    } else if (i==1) {
      scoreRank = "2ND";
    } else if (i==2) {
      scoreRank = "3RD";
    } else if (i==3) {
      scoreRank = "4TH";
    } else if (i==4) {
      scoreRank = "5TH";
    }

    //Adding Text to the Screen
    // the next two lines are used to display text on the screen
    text = new Text(scoreRank, width/2 - 220, height/2 - 40 + (i*50), 56, LEFT);  //text = new Text(scoreRank, width/2 - 220, height/2 - 40 + (i*50), 56, LEFT, 234, 17, 39);
    text.displayText();
    text = new Text(scoreNames[i], width/2 -80, height/2 - 40 + (i*50), 56, LEFT); //text = new Text(scoreNames[i], width/2 -80, height/2 - 40 + (i*50), 56, LEFT, 234, 17, 39);
    text.displayText();
    text = new Text("" + scorePoints[i], width/2  + 160, height/2 - 40 + (i*50), 56, LEFT, 234, 17, 39);
    text.displayText();
  }

  // Shows the high score
  showScore();
}// end endGame Method

//------- addToHighScores Method -------
void addToHighScores() {
  // addToHighScores code
  sceneryBackground = new Scenery(205, 120, 0);
  imageMode(CENTER);
  image(gameOver, width/2, height/2 - 210);
  image(highScoreAlert, width/2, height/2 -120);
  image(enterToContinue, width/2, height/2 + 200);

  text = new Text(pName, width/2, height/2 + 20, 72, CENTER, 5, 58, 220);
  text.displayText();

  text = new Text("Type in Player" + (topScorer + 1) + "'s Name You Can \n enter up to six characters", width/2, height/2 +120, 56, CENTER, 234, 17, 39);
  text.displayText();

  showScore();
}// end addToHighScores Method

void playButton() {
  // playButton code

  // Create an button that needs to be clicked to play
  // Draw Button on screen
  strokeWeight(2);
  stroke(35, 133, 49);
  fill(10, 208, 78);
  rect(width/2 -120, height/2, 240, 60, 6);

  // Add Text to button
  // the next two lines are used to display text on the screen
  text = new Text("Play!", width/2, height/2 +52, 60, CENTER, 35, 133, 49);
  text.displayText();

  playButtonPressed(); // looking for the mouse click on play button
}// end playButton Method

//------- startGame Method -------
void playButtonPressed() {
  // playButtonPressed code
  //Looking for the Mouse Click
  if (mousePressed == true &&
    mouseX > leftEdge &&
    mouseX < rightEdge &&
    mouseY > topEdge &&
    mouseY < bottomEdge
    ) {
    gameState = "PLAY";
    resetGame();
  }
}// end playButtonPressed Method

//------- checkPlayerScores Method -------
void checkPlayerScores() {
  float drawCalcP1 = p1NumBullets;
  float drawCalcP2 = p2NumBullets;

  for (int i =0; i <=1; i++) {
    if (player[0].playerScoreHigher(player[1])) {            //if (player[0].getPlayerScore() > player[1].getPlayerScore()) {
      topScorer = 0;
    } else if (player[0].playerScoreLower(player[1])) {     // } else if (player[0].getPlayerScore() < player[1].getPlayerScore()) { 
      topScorer = 1;
    } else {
      if (drawCalcP1 < drawCalcP2) {
        topScorer = 0;
      } else {
        topScorer = 1;
      }
    }
  }

  if (player[topScorer].getPlayerScore() > scorePoints[scorePoints.length-2]) {
    gameState = "HIGH_SCORE";
  } else {
    gameState = "GAMEOVER";
  }
}// end checkPlayerScores Method

//------- addNewScore Method -------
void addNewScore(String name, int score) {
  int indexArray= -1;

  scoreNames[scoreNames.length-1] = name;
  scorePoints[scorePoints.length-1] = score;

  for (int i = 0; i <scorePoints.length; i++) {
    indexArray = i;
    for (int j = i; j <= scorePoints.length-1; j++) {
      if (scorePoints[j] > scorePoints[indexArray]) {
        indexArray = j;
      }
    }
    int temp = scorePoints[i];
    String tempNames = scoreNames[i];

    scorePoints[i] = scorePoints[indexArray];
    scoreNames[i] = scoreNames[indexArray];

    scorePoints[indexArray] = temp;
    scoreNames[indexArray] = tempNames;
  }
}// end addNewScore Method

//------- showScore Method -------
void showScore() {
  // showScore code

  strokeWeight(2);
  stroke(0);
  int player_1 = 1;
  int player_2 = 1;
  int timePosition = 0;
  int[] numKillsPosition = new int[2];
  int[] scorePosition = new int[2];


  strokeFont = false;
  // used to place the timePlayed Text as the numbers grow the xPos is changed
  if (timePlayed < 10) {
    timePosition = width/2;
  } else if (timePlayed >= 10 && timePlayed < 100) {
    timePosition = width/2 - 5;
  } else if (timePlayed >= 100) {
    timePosition = width/2 - 10;
  }

  for (int i = 0; i <= 1; i++) {
    if (player[i].getPlayerKills() >= 100) { // Player 1: used to place the NumKillsPosition Text as the numbers grow the xPos is changed
      numKillsPosition[i] = 7;
    } else if (player[i].getPlayerKills() >= 10) {
      numKillsPosition[i]  = 3;
    }

    if (player[i].getPlayerScore() >= 1000) { // Player 1: used to place the ScorePosition Text as the numbers grow the xPos is changed
      scorePosition[i] = 13;
    } else if (player[i].getPlayerScore() >= 100) {
      scorePosition[i] = 7;
    }
  }

  text = new Text("Time", width/2 - 30, 36, 36, LEFT, 0, 0, 0); // Display the Time
  text.displayText();
  text = new Text(str(timePlayed), timePosition, 60, 28, LEFT, 0, 0, 0); // Display the timePlayed
  text.displayText();

  //********** Player 1 :- Information Display **********//
  text = new Text("Player1", 10, 36, 36, LEFT, 0, 0, 0); // Display Player1
  text.displayText();

  text = new Text("Bullets: " + str(p1NumBullets), 6, 74, 20, LEFT, 0, 0, 0); // Display the Bullets & p1NumBullets
  text.displayText();

  text = new Text("Kills", 145, 26, 24, LEFT, 0, 0, 0); // Display Number of Invaders Killed
  text.displayText();

  fill(255);
  ellipse(170, 52, 45, 45);
  text = new Text(str(player[0].getPlayerKills()), 164 - numKillsPosition[0], 59, 20, LEFT, 0, 0, 0); // Display Number of Invaders Killed
  text.displayText();

  text = new Text("Score", 210, 34, 24, LEFT, 0, 0, 0); // Display Score
  text.displayText();

  text = new Text(str(player[0].getPlayerScore()), (230 - scorePosition[0]), 58, 24, LEFT, 0, 0, 0); // Display the Score
  text.displayText();
  //********** End Player 1 :- Information Display **********//

  //********** Player 2 :- Information Display **********//
  text = new Text("Player2", width - 140, 36, 36, LEFT, 0, 0, 0); // Display Player2
  text.displayText();
  // Player 2 :- Bullets Fired
  text = new Text("Bullets: " + str(p2NumBullets), width - 140, 74, 20, LEFT, 0, 0, 0);// Display the Bullets & p1NumBullets
  text.displayText();

  text = new Text("Kills", width - 200, 26, 24, LEFT, 0, 0, 0);  // Display Number of Invaders Killed
  text.displayText();

  fill(255);
  ellipse(width - 170, 52, 45, 45);
  text = new Text(str(player[1].getPlayerKills()), (width - 175) - numKillsPosition[1], 58, 20, LEFT, 0, 0, 0); // Display Number of Invaders Killed
  text.displayText();

  text = new Text("Score", width - 270, 34, 24, LEFT, 0, 0, 0); // Display Score
  text.displayText();

  text = new Text(str(player[1].getPlayerScore()), ((width - 245) - scorePosition[1]), 58, 24, LEFT, 0, 0, 0); // Display the Score
  text.displayText();
  //********** End Player 1 :- Information Display **********//

  for (int i = 1; i <=5; i++) {
    // Player 1 :- Health Bar
    if (player_1 == 1 ) {
      if (i <= player[0].getPlayerHealth()) {
        fill(#4FAF44);
      } else {
        fill(#EF4423);
      }
      rect(-19 +(i*26), 40, 26, 15);
    }
    // Player 2 :- Health Bar
    if (player_2 == 1 ) {
      if (i <= player[1].getPlayerHealth()) {
        fill(#4FAF44);
      } else {
        fill(#EF4423);
      }
      rect(width-((164) - (i*26)), 40, 26, 15);
    }
  }

  strokeFont = true;
}// end showScore Method

//------- createPlayers method -------
void createNewPlayers() {
  // Creating the PLayers
  for (int i = 0; i<=1; i++) {
    // Initializing Players
    if (i < 1) {
      player[i] = new Player(p1Name, width/2 - width/4, height - 52 + 10, 40, 1); // setting up player
    } else {
      player[i] = new Player(p2Name, width/2 + width/4, height - 52 + 10, 40, 2); // setting up player
    }
  }
} // end createPlayers method

//------- createInvaders method -------
void createNewInvaders() {
  // Creating the Invaders
  for (int i = 0; i <= 14; i++) {
    for (int j = 0; j <= 5; j++) {
      invaders[i][j] = new Invader(30, 103, 50, 1.75, (6 - j));  //this when finished testing
      invaders[i][j].increaseXCoord(i*60);
      invaders[i][j].increaseYCoord(j*60);
    }
  }
} // end createInvaders method

//------- createBullets method -------
void createNewBullets() {
  // Creating the Bullets
  // sets Two-Dimensional Array bulletsPlayer_1
  for (int i = 0; i<=1; i++) {
    for (int j = 0; j < bullets[i].length; j++) {
      if (i < 1) {
        bulletColor = 1;
        bullets[i][j] = new Bullet(player[0].getXCoord() + player[0].getPlayerWidth()/2, player[0].getYCoord(), bulletSize, bulletSpeed, bulletColor);
      } else {
        bulletColor = 2; // Setting bulletColor
        bullets[i][j] = new Bullet(player[1].getXCoord() + player[1].getPlayerWidth()/2, player[1].getYCoord(), bulletSize, bulletSpeed, bulletColor);
      }
    }
  }
} // end createBullets method

//------- createInvadersBullets method -------
void createInvadersBullets() {
  // Creating the Bullets
  int i = 0;
  //for (int i = 0; i < invadersBullets.length; i++) {
  while (i < invadersBullets.length) {
    bulletColor = 3;
    invadersBullets[i] = new Bullet(100, -100, bulletSize, -4);
    i++;
  }
} // end createInvadersBullets method

//------- resetGame Method -------
void resetGame() {
  // Resetting the Game
  enterPlayerName = true;

  scoreAdded = 0;
  timePlayed = 0;
  timePlayedTimer.start(); // ReStarting the Timer
  pName = "";
  p1Bullets = 0;
  p2Bullets = 0;
  p1NumBullets = 0;
  p2NumBullets = 0;
  totalInvadersBullet = 0;
  totalInvaders = 90;

  for (int i = 0; i<=1; i++) { // Resetting bullets
    for (int j = 0; j <1; j++) {
      totalBullets[i][j] = 0;
    }
  }

  // Creating teh objects Players, Invaders & Bullets
  createNewPlayers();
  createNewBullets();
  createNewInvaders();
  createInvadersBullets();

  for (int i = 0; i <= 1; i++) {
    player[i].setPlayerKills(0);
    player[i].setPlayerScore(0);
    player[i].setPlayerHealth(5);
    player[i].setPlayerDied(false);
    player[i].setPlayerAllowedShoot(false);
  }

  //Hides all the bullets
  for (int i = 0; i<=1; i++) {
    for (int j = 0; j < totalBullets[i][0]; j++) {
      bullets[i][j].removeBullet();
    }
  }
}// end resetGame Method

//------- keyPressed Method -------
void keyPressed() {
  /* When the gamesState changes the keyboard does different things.
   *  When gameState = "HIGH_SCORE" you cna typoe in your name
   *  When anythingt else your playing the game
   */
  if (gameState == "HIGH_SCORE") {
    switch(keyCode) {
    case BACKSPACE:
      if (pName.length() >0) {
        pName = pName.substring( 0, pName.length()-1 );
      }
      break;
    //case SHIFT:
    //  println("SHIFT");
    //  break;
    case ENTER:
      gameState = "GAMEOVER";
      break;
    default:
      if (pName.length() <= 5) {
        pName = pName + key;
      }
      break;
    }
  } else {
    switch(keyCode) {
    case 68: // D
      rightPlayer_1 = true;
      break;
    case 65: // A
      leftPlayer_1 = true;
      break;
    case 87: // W
      upPlayer_1 = true;
      break;
    //case 83: // S
    //  downPlayer_1 = true;
    //  break;
    case UP:
      upPlayer_2 = true;
      break;
    //case DOWN:
    //  downPlayer_2 = true;
    //  //totalInvadersBullet++;
    //  break;
    case LEFT:
      leftPlayer_2 = true;
      break;
    case RIGHT:
      rightPlayer_2 = true;
      break;
    case ENTER:
      if (gameState != "PLAY") {
        gameState = "PLAY";
        resetGame();
      }
      break;
    }
  }
}
//------- end keyPressed Method -------

//------- keyReleased Method -------
void keyReleased() {
  switch(keyCode) {
  case RIGHT:
    rightPlayer_2 = false;
    break;
  case LEFT:
    leftPlayer_2 = false;
    break;
  case UP:
    upPlayer_2 = false;

    if (!player[1].getPlayerDied() && player[1].getPlayerAllowedShoot()) {
      if (millis() - delayP1Bullets > 10) {
        if (totalBullets[1][0] < 100000) {
          totalBullets[1][0] = totalBullets[1][0] + 1;
        }
        bullets[1][(p2Bullets)].setXCoord(player[1].getXCoord() + player[1].getPlayerWidth()/2);   // bullets[1][(p2Bullets)].xCoord = player[1].getXCoord() + player[1].getPlayerWidth()/2;
        p2Bullets++;
        delayP1Bullets = millis();
      }
    }
    break;
  //case DOWN:
  //  downPlayer_2 = false;
  //  break;
  case 68: // D
    rightPlayer_1 = false;
    break;
  case 65: // A
    leftPlayer_1 = false;
    break;
  case 87: // W
    upPlayer_1 = false;

    if (!player[0].getPlayerDied() && player[0].getPlayerAllowedShoot()) {
      if (millis() - delayP1Bullets > 10) {
        if (totalBullets[0][0] < 100000) {
          totalBullets[0][0] = totalBullets[0][0] + 1;
        }
        bullets[0][(p1Bullets)].setXCoord(player[0].getXCoord() + player[0].getPlayerWidth()/2);    //bullets[0][(p1Bullets)].xCoord = player[0].getXCoord() + player[0].getPlayerWidth()/2;
        p1Bullets++;
        delayP1Bullets = millis();
      }
    }
    break;
  //case 83: // S
  //  downPlayer_1 = false;
  //  break;
  }
} // end keyReleased Method


//------- checkInvaderLeavesScreen Method -------
void checkInvaderLeavesScreen() {
  boolean invaderHitEdge = false, invaderHitBottom = false;

  for (int i = 0; i <= 14; i++) {
    for (int j = 0; j <= 5; j++) {
      if (invaders[i][j].getXCoord() > width - invaders[i][j].getInvaderSize()/2 ||
        invaders[i][j].getXCoord()  < invaders[i][j].getInvaderSize()/2 - 1) {
        invaderHitEdge = true;
      } else if (invaders[i][j].getYCoord()  > height - invaders[i][j].getInvaderSize()/2) {
        invaderHitBottom = true;
      }
    }
  }

  if (invaderHitEdge && invaderHitBottom == false) {
    for (int i = 0; i <= 14; i++) {
      for (int j = 0; j <= 5; j++) {
        invaders[i][j].changeDirection(-1);

        if (invaders[i][j].getInvaderSpeed() * 1.1 < 12) {
          invaders[i][j].setInvaderSpeed(invaders[i][j].getInvaderSpeed()  * 1.2);
        }
        invaders[i][j].increaseYCoord(invaders[i][j].getInvaderSize()/2);    // invaders[i][j].yCoord += invaders[i][j].invaderSize/2;
      }
    }
  }
  if (invaderHitBottom) {
    for (int i = 0; i <= 14; i++) {
      for (int j = 0; j <= 5; j++) {
        invaders[i][j].setInvaderSpeed(0);
        invaders[i][j].setYCoord(-200);
        checkPlayerScores();
      }
    }
  }
}// end checkInvaderLeavesScreen method


//------- collisionInvaderBullet Method -------
boolean collisionInvaderBullet(Invader invaders, Bullet bullets)
{
  float invadersX = invaders.getXCoord();
  float invadersY = invaders.getYCoord();

  // which edge is closest?
  if (invaders.getXCoord() < bullets.getXCoord()) {
    invadersX = bullets.getXCoord();      // test left edge
  } else if (invaders.getXCoord() > bullets.getXCoord() +  bullets.getBulletSize()) {
    invadersX = bullets.getXCoord() +  bullets.getBulletSize();   // right edge
  }

  if (invaders.getYCoord() < bullets.getYCoord()) {
    invadersY = bullets.getYCoord();      // top edge
  } else if (invaders.getYCoord() > bullets.getYCoord() + bullets.getBulletSize()) {
    invadersY = bullets.getYCoord() + bullets.getBulletSize();
  }  // bottom edge


  // get distance from closest edges
  float distanceX = invaders.getXCoord() - invadersX;
  float distanceY = invaders.getYCoord() - invadersY;
  float distance = sqrt( (distanceX*distanceX) + (distanceY*distanceY) );

  // if the distance is less than the radius, collision!
  if (distance <= invaders.getInvaderSize()/2) {
    return true;
  } else {
    return false;
  }
} // end collisionInvaderBullet method

//------- collisionPlayerBullet Method -------
boolean collisionPlayerBullet(Player player, Bullet invadersBullets)
{
  //These variables measure the magnitude of the gap between the paddle and the ball.
  float invadersBulletsX = abs(invadersBullets.getXCoord() - player.getXCoord() - player.getPlayerWidth()/2);
  float invadersBulletsY = abs(invadersBullets.getYCoord() - player.getYCoord() - player.getPlayerHeight()/2);

  if (invadersBulletsX > (player.getPlayerWidth()/2  + invadersBullets.getBulletSize()/2)) {
    return false;
  }
  if (invadersBulletsY > (player.getPlayerHeight()/2 + invadersBullets.getBulletSize()/2)) {
    return false;
  }

  if (invadersBulletsX <= (player.getPlayerWidth()/2)) {
    return true;
  }
  if (invadersBulletsY <= (player.getPlayerHeight()/2)) {
    return true;
  }

  float cornerDistance = pow(invadersBulletsX - player.getPlayerWidth()/2, 2) + pow(invadersBulletsY - player.getPlayerHeight()/2, 2);

  if (cornerDistance <= pow(invadersBullets.getBulletSize()/2, 2)) {
    return true;
  } else {
    return false;
  }
}// end collisionPlayerBullet method


//------- collisionPlayerInvader Method -------
boolean collisionPlayerInvader(Player player, Invader invaders)
{
  //These variables measure the magnitude of the gap between the paddle and the ball.
  float invadersX = abs(invaders.getXCoord() - player.getXCoord() - player.getPlayerWidth()/2);
  float invadersY = abs(invaders.getYCoord() - player.getYCoord() - player.getPlayerHeight()/2);

  if (invadersX > (player.getPlayerWidth()/2  + invaders.getInvaderSize()/2)) {
    return false;
  }
  if (invadersY > (player.getPlayerHeight()/2 + invaders.getInvaderSize()/2)) {
    return false;
  }

  if (invadersX <= (player.getPlayerWidth()/2)) {
    return true;
  }
  if (invadersY <= (player.getPlayerHeight()/2)) {
    return true;
  }

  float cornerDistance = pow(invadersX - player.getPlayerWidth()/2, 2) + pow(invadersY - player.getPlayerHeight()/2, 2);

  if (cornerDistance <= pow(invaders.getInvaderSize()/2, 2)) {
    return true;
  } else {
    return false;
  }
} // end collisionPlayerInvader method



//------- ***************************************************** -------
// Copy and paster below for Method template

//------- startGame method -------
void other() {
  // startGame code
}// end startGame method
