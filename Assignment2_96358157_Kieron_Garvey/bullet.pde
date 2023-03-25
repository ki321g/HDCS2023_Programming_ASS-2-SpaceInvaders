/* Bullet Class
 *
 * Summary: Used as a Timer for the Game
 *
 * By: Kieron Garvey
 * Date: 12/Mar/2023
 * Version: 1.0
 */
public class Bullet {
  private int xCoord; //x position of the bullet object
  private int yCoord; //y position of the bullet object
  private int bulletSize; //size of  bullet radius
  private int bulletSpeed; // speed of bullet
  private int bulletColor;
  private boolean bulletLeftScreen; //bullet left teh screen
  
  // Default Bullet Constructor
  Bullet() { }// end Bullet constructor
  
  // Overloaded Bullet Constructor
  Bullet(int xPosition, int yPosition, int size, int speed, int setColor) {
    xCoord = xPosition;
    yCoord = yPosition;
    bulletSize = size;
    bulletSpeed = speed;
    bulletColor= setColor;
    bulletLeftScreen = false;
  } // end Bullet constructor definition
  
  // Overloaded Bullet Constructor
   Bullet(int xPosition, int yPosition, int size, int speed) {
    xCoord = xPosition;
    yCoord = yPosition;
    bulletSize = size;
    bulletSpeed = speed;
    bulletColor= 3;
    bulletLeftScreen = false;
  } // end Bullet constructor definition

  //------- displayBullet Method -------
  public void display() {
    if (this.bulletColor == 3) {
      changeBulletStroke(3);
      // stroke(0);
      //strokeWeight(1);
    } else {
     // noStroke();
     changeBulletStroke();
    }
    setBulletColor(this.bulletColor);                                        // Sets the Color of the Bullet
    ellipse(this.xCoord, this.yCoord, this.bulletSize, this.bulletSize);     // Creates the Bullet
  }// end displayBullet method

  //------- updateBullet Method -------
  public void update() {
    this.yCoord -= this.bulletSpeed;   // Sets the Speed of the Bullet

    if (this.yCoord < -100 || this.yCoord > heightSketch + 100) {
      this.bulletLeftScreen = true;   // Sets if the Bullet has left the screen.
    }
  }// end updateBullet method

  //------- removeBullet Method -------
  public void removeBullet() {
    this.xCoord = this.bulletSize;//check
    this.yCoord = this.bulletSize - 1000;
    this.bulletSpeed = 0;
  }// end removeBullet method

  //------- stopBullet Method -------
  public void stopBullet() {
    this.bulletSpeed = 0;
  }// end stopBullet method
  
  private void changeBulletStroke() {
   int enableStroke = 0;

    if (enableStroke == 3) {
      stroke(0);
      strokeWeight(1);
    } else {
      noStroke();
    } 
  }
  
  private void changeBulletStroke(int enable) {
    int enableStroke = 0;
    if(enable == 3){
      enableStroke = enable;
    }
    if (enableStroke == 3) {
      stroke(0);
      strokeWeight(1);
    } else {
      noStroke();
    } 
  }


  /************** Setter Methods **************
   * Sets the current values of the bullet */
  //------- setXCoord Method -------
  public void  setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }

  //------- setYCoord Method -------
  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }

  //------- setBulletSize Method -------
  public void setBulletSize(int bulletSize) {
    this.bulletSize = bulletSize;
  }

  //------- setBulletSpeed Method -------
  public void setBulletSpeed(int bulletSpeed)
  {
    this.bulletSpeed = bulletSpeed;
  }

  //------- setBulletColor Method -------
  public void setBulletColor(int bulletColor) {
    if (bulletColor == 1) {
      // fill(10, 208, 78);
      fill(35, 133, 49);
    } else if (bulletColor == 2) {
      fill(239, 48, 56);
    } else if (bulletColor == 3) {
      //fill(255, 255, 255);
      fill(255);
    }
  }

  //------- setBulletLeftScreen Method -------
  public void setBulletLeftScreen(boolean bulletLeftScreen) {
    this.bulletLeftScreen = bulletLeftScreen;
  }

  /************** Getter Methods **************
   * Gets the current values of the bullet */
  //------- getXCoord Method -------
  public int  getXCoord() {
    return xCoord;
  }

  //------- getYCoord Method -------
  public int getYCoord() {
    return yCoord;
  }

  //------- getBulletSize Method -------
  public int getBulletSize() {
    return bulletSize;
  }

  //------- bulletSpeed Method -------
  public int getBulletSpeed() {
    return bulletSpeed;
  }

  //------- getBulletColor Method -------
  public int getBulletColor() {
    return bulletColor;
  }

  //------- getBulletLeftScreen Method -------
  public boolean getBulletLeftScreen() {
    return bulletLeftScreen;
  }
}// end Bullet class
