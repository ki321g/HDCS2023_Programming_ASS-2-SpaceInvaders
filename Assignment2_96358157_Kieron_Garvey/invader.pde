/* Invader Class
 *
 * Summary: Used as a Timer for the Game
 *
 * By: Kieron Garvey
 * Date: 8/Mar/2023
 * Version: 1.0
 */
public class Invader {
  private int xCoord; //x position of the bullet object
  private int yCoord; //y position of the bullet object
  private int invaderSize; //size of  bullet radius
  private float invaderSpeed; // speed of bullet
  private int invaderPointValue;
  private int invaderDirection;
  private boolean invaderLeftScreen; //bullet left teh screen

  // Default Invader Constructor
  Invader() { }// end Bullet constructor
  
  //------- Overloaded Invader Constructor -------
  Invader(int xPosition, int yPosition, int size, float speed, int pointValue) {
    xCoord = xPosition;
    yCoord = yPosition;
    invaderSize = size;
    invaderSpeed = speed;
    invaderPointValue = pointValue;
    invaderDirection = 1;

  } // end Invader object
  
  //------- Invader Overloaded Constructor -------
  Invader(int xPosition, int yPosition, int pointValue) {
    xCoord = xPosition;
    yCoord = yPosition;
    invaderSize = 50;
    invaderSpeed = 1.5;
    invaderPointValue = pointValue;
    invaderDirection = 1;

  } // end Invader object

  //------- displayInvader Method -------
  public void display() {
    stroke(0);
    strokeWeight(2);
    fill(255);
    ellipse(this.xCoord, this.yCoord, this.invaderSize, this.invaderSize);
  }// end displayInvader method

  //------- updateInvader Method -------
  public void update() {
    this.xCoord += int(this.invaderSpeed * this.invaderDirection);
  }// end updateInvader method

  //------- removeInvader Method -------
  public void removeInvader() {
    this.xCoord = this.invaderSize;//check
    this.yCoord = this.invaderSize - 1000;
    this.invaderSpeed = 0;
  }// end removeInvader method

  //------- increaseXCoord Method -------
  public void  increaseXCoord(int xCoord) {
    this.xCoord = this.xCoord  + xCoord;
  }

  //------- increaseYCoord Method -------
  public void increaseYCoord(int yCoord) {
    this.yCoord = this.yCoord  + yCoord;
  }

  //------- changeDirection Method -------
  public void changeDirection(int invaderDirection) {
    this.invaderDirection *= invaderDirection;
  }
  
  /************** Setter Methods **************
   * Sets the current values of the bullet
   */
  //------- setXCoord Method -------
  public void  setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }

  //------- setYCoord Method -------
  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }

  //------- setInvaderSize Method -------
  public void setInvaderSize(int invaderSize) {
    this.invaderSize = invaderSize;
  }

  //------- setInvaderSpeed Method -------
  public void setInvaderSpeed(float invaderSpeed) {
    this.invaderSpeed = invaderSpeed;
  }

  //------- setPointValue Method -------
  public void setPointValue(int invaderPointValue) {
    this.invaderPointValue = invaderPointValue;
  }

  //------- setDirection Method -------
  public void setDirection(int invaderDirection) {
    this.invaderDirection = invaderDirection;
  }

  //------- setInvaderLeftScreen Method -------
  public void setInvaderLeftScreen(boolean invaderLeftScreen) {
    this.invaderLeftScreen = invaderLeftScreen;
  }

  /************** Getter Methods **************
   * Gets the current values of the bullet
   */
  //------- getXCoord Method -------
  public int  getXCoord() {
    return xCoord;
  }

  //------- getYCoord Method -------
  public int getYCoord() {
    return yCoord;
  }

  //------- getInvaderSize Method -------
  public int getInvaderSize() {
    return invaderSize;
  }

  //------- getInvaderSpeed Method -------
  public float getInvaderSpeed() {
    return invaderSpeed;
  }

  //------- getBulletColor Method -------
  public int getPointValue() {
    return invaderPointValue;
  }

  //------- getBulletColor Method -------
  public int getDirection() {
    return invaderDirection;
  }

  //------- getInvaderLeftScreen Method -------
  public boolean getInvaderLeftScreen() {
    return invaderLeftScreen;
  }
}// end Invader class
