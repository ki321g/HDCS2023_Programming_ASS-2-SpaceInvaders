/* Player Class
 *
 * Summary: Used as a Timer for the Game
 *
 * By: Kieron Garvey
 * Date: 7/Mar/2023
 * Version: 1.0
 */
public class Player {
  private int xCoord; //x position of the player object
  private int yCoord; //y position of the player object
  private int playerWidth; //size of the player object
  private int playerHeight; //size of the player object
  private int playerColor;
  private int speedX; //used for movement
  private int playerDirection; //sets the player direction  // might delete
  private String playersName;
  private int playerKills, playerScore, playerHealth, movePlayerOnScreen;
  private boolean playerDied, playerAllowedShoot;

  // Default Player Constructor
  Player() {
  }// end Bullet constructor

  //------- Overloaded Player Constructor -------
  Player(String playerName, int xPosition, int yPosition, int sizeOfPlayer, int setColor) {
    playersName = playerName;
    xCoord = xPosition;
    yCoord = yPosition;
    playerColor = setColor;
    setPlayerWidth(sizeOfPlayer);
    setPlayerHeigth(sizeOfPlayer);
    playerDirection = 0;
    speedX = 0;
    playerScore = 0;
    playerKills = 0;
    playerHealth = 5;

    playerDied  = false;
    playerAllowedShoot = false;
  } // end Player object definition

  //------- createPlayer Method -------
  void createPlayer() { //is put into "draw()" to constantly update

    // rectMode(CENTER); //set rectMode
    translate(xCoord, yCoord); // sets the 0,0 to be inside player, used for rotating correctly

    // creates the player
    strokeWeight(2);
    setColor("STROKE", 1);
    setColor("FILL", 1);

    rect(0, 0, playerWidth, playerHeight, 6);
    noStroke();

    // sets player colour with a gradient of colours
    int i = 0;
    while (i < 5) {
      //for (int i = 0; i < 5; i++) {
      if (playerColor == 1) {
        fill(10 + (i * 3), 208 + (i * 3), 78 + (i * 3));
      } else if (playerColor == 2) {
        fill(239 + (i * 3), 48 + (i * 3), 56 + (i * 3));
      }
      ellipse(this.playerWidth/2, this.playerHeight/2, playerWidth * (0.9 - (i/10)), playerHeight * (0.9 - (i/10)));
      i++;
    }// end for

    strokeWeight(2);
    setColor("STROKE", 1);
    rect(this.playerWidth/2 - this.playerWidth/4, this.playerHeight/2 -26, 20, 6);//GUN


    setColor("FILL", 2);
    ellipse(this.playerWidth/2 + 0, this.playerHeight/2 + 8, 12, 16);

    strokeWeight(6);
    setColor("STROKE", 1);
    line(this.playerWidth/2-15, this.playerHeight/2 -8, this.playerWidth/2 -5, this.playerHeight/2 -8); // Left eye
    line(this.playerWidth/2+15, this.playerHeight/2 -8, this.playerWidth/2 +5, this.playerHeight/2 -8); // right eye
    line(this.playerWidth/2-8, this.playerHeight/2 +8, this.playerWidth/2 +8, this.playerHeight/2 +8); // mouth

    translate(-xCoord, -yCoord);
  }// end createPlayer Method

  //------- update Method -------
  public void update() {

    //checkPlayerOnScreen();

    if (rightPlayer_1) {
      player[0].speedX = 6;
      this.moveXCoord(this.speedX);
    } else if (leftPlayer_1) {
      player[0].speedX = -6;
      this.moveXCoord(this.speedX);
    } else if (rightPlayer_1 == false || leftPlayer_1 == false) {
      player[0].speedX = 0;
    }

    if (rightPlayer_2) {
      player[1].speedX = 6;
      this.moveXCoord(this.speedX);
    } else if (leftPlayer_2) {
      player[1].speedX = -6;
      this.moveXCoord(this.speedX);
    } else if (rightPlayer_2 == false || leftPlayer_2 == false) {
      player[1].speedX = 0;
    }
  }

  //------- setColor Method -------
  private void setColor(String setType, int setColor) {
    if (setType == "STROKE") {
      if (playerColor == 1) {
        if (setColor == 1) {
          stroke(35, 133, 49);
        }
      } else if (playerColor == 2) {
        stroke(169, 32, 62);
      }
    } else if (setType == "FILL") {
      if (playerColor == 1) {
        if (setColor == 1) {
          fill(10, 208, 78);
        } else if (setColor == 2) {
          fill(35, 133, 49);
        }
      } else if (playerColor == 2) {
        if (setColor == 1) {
          fill(239, 48, 56);
        } else if (setColor == 2) {
          fill(169, 32, 62);
        }
      }
    }
  }// end setColor Method

  boolean checkPlayerOnScreen() {
    if (this.xCoord - (this.playerWidth/2 - 20) < 0) {
      this.setMovePlayerOnScreen(0);
      return false;
    } else if (this.xCoord + (this.playerWidth/2 + 20) > widthSketch) {
      this.setMovePlayerOnScreen(1);
      return false;
    } else {
      return true;
    }
  }

  private void movePlayerBackOnScreen(int moveBackOnScreen) {
    if (moveBackOnScreen == 0) {
      this.xCoord = this.playerWidth/2 - 20;
    } else if (moveBackOnScreen == 1) {
      this.xCoord= widthSketch - (this.playerWidth/2 + 20);
    }
  }

  //------- moveXCoord Method -------
  public void moveXCoord(int xCoord) {
    this.xCoord = this.xCoord  + xCoord;
  }

  //------- addToPlayerScore Method -------
  public void addToPlayerScore(int playerScore)
  {
    this.playerScore += playerScore;
  }

  //------- removePlayerHealth Method -------
  public void removePlayerHealth(int playerHealth)
  {
    this.playerHealth -= playerHealth;
  }
  
  //------- playerScoreHigher Method -------
  boolean playerScoreHigher(Player player) {
    if (this.getPlayerScore() > player.getPlayerScore()) {
      return true;
    } else {
      return false;
    }
  }
  //------- playerScoreLower Method -------
  boolean playerScoreLower(Player player) {
    if (this.getPlayerScore() < player.getPlayerScore()) {
      return true;
    } else {
      return false;
    }
  }

  //******* Setter Methods *******
  //------- setPlayerWidth Method -------
  public void setPlayerWidth(int playerWidth) {
    //The paddle width must be between 10 and width/2 (inclusive)
    if ((playerWidth >= 40) && (playerWidth <= width/10)) {
      this.playerWidth = playerWidth;
    } else {
      this.playerWidth = 40;
    }
  }

  //------- setPlayerHeigth Method -------
  public void  setPlayerHeigth(int playerHeight) {
    //The paddle height must be between 50 and height/2 (inclusive)
    if ((playerHeight >= 40) && (playerHeight <= width/10)) {
      this.playerHeight = playerHeight;
    } else {
      this.playerHeight = 40;
    }
  }

  //------- setplayerName Method -------
  public void  setPlayersName(String playersName) {
    this.playersName = playersName;
  }

  //------- setYCoord Method -------
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }

  //------- setYCoord Method -------
  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }


  //------- setPlayerColor Method -------
  public void setPlayerColor(int playerColor)
  {
    this.playerColor = playerColor;
  }

  //------- setSpeedX Method -------
  public void setSpeedX(int speedX)
  {
    this.speedX = speedX;
  }

  //------- setplayerDirection Method -------
  public void setplayerDirection(int playerDirection)
  {
    this.playerDirection = playerDirection;
  }

  //------- setPlayerKills Method -------
  public void setPlayerKills(int playerKills)
  {
    this.playerKills = playerKills;
  }

  //------- setPlayerScore Method -------
  public void setPlayerScore(int playerScore)
  {
    this.playerScore = playerScore;
  }

  //------- setPlayerHealth Method -------
  public void setPlayerHealth(int playerHealth)
  {
    this.playerHealth = playerHealth;
  }

  //------- setPlayerDied Method -------
  public void setPlayerDied(boolean playerDied)
  {
    this.playerDied = playerDied;
  }

  //------- setPlayerAllowedShoot Method -------
  public void setPlayerAllowedShoot(boolean playerAllowedShoot)
  {
    this.playerAllowedShoot = playerAllowedShoot;
  }

  //------- setMovePlayerOnScreen Method -------
  private void setMovePlayerOnScreen(int movePlayerOnScreen)
  {
    this.movePlayerOnScreen = movePlayerOnScreen;
  }

  //******* Getter Methods *******
  //------- getPlayerName Method -------
  public String  getPlayersName() {
    return playersName;
  }

  //------- getXCoord Method -------
  public int getXCoord() {
    return xCoord;
  }

  //------- getYCoord Method -------
  public int getYCoord() {
    return yCoord;
  }

  //------- getPlayerWidth Method -------
  public int getPlayerWidth() {
    return playerWidth;
  }

  //------- getPlayerHeight Method -------
  public int getPlayerHeight()
  {
    return playerHeight;
  }

  //------- getPlayerColor Method -------
  public int getPlayerColor()
  {
    return playerColor;
  }

  //------- getSpeedX Method -------
  public int getSpeedX()
  {
    return speedX;
  }

  //------- getplayerDirection Method -------
  public int getplayerDirection()
  {
    return playerDirection;
  }

  //------- getPlayerKills Method -------
  public int getPlayerKills()
  {
    return playerKills;
  }

  //------- getPlayerScore Method -------
  public int getPlayerScore()
  {
    return playerScore;
  }

  //------- getPlayerHealth Method -------
  public int getPlayerHealth()
  {
    return playerHealth;
  }

  //------- getPlayerDied Method -------
  public boolean getPlayerDied()
  {
    return playerDied;
  }

  //------- setPlayerAllowedShoot Method -------
  public boolean getPlayerAllowedShoot()
  {
    return playerAllowedShoot;
  }

  public int getMovePlayerOnScreen()
  {
    return movePlayerOnScreen;
  }
}// end Player class
