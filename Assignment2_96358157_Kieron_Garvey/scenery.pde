/* Scenery Class
 *
 * Summary: Used as a Timer for the Game
 *
 * By: Kieron Garvey
 * Date: 12/Mar/2023
 * Version: 1.0
 */
public class Scenery {
  private float redSceneryRGB; //x position of the player object
  private float greenSceneryRGB; //y position of the player object
  private  float blueSceneryRGB; //size of the player object

  // Background Variables
  private boolean backgroundSetup = false;
  private int backgroundIncreaseX = 0;
  private int backgroundIncreaseY = 0;

  // Default Scenery Constructor
  Scenery() {
    redSceneryRGB = 205;
    greenSceneryRGB = 120;
    blueSceneryRGB = 0;
  }// end Bullet constructor

  //------- Overloaded Scenery Constructor -------
  Scenery(float redRGB, float greenRGB, float blueRGB) {
    redSceneryRGB = redRGB;
    greenSceneryRGB = greenRGB;
    blueSceneryRGB = blueRGB;
  } // end Player object definition

  //------- drawScenery Function -------
  void drawScenery() { //this covers up the entire sketch, no need for background() in draw()
    background(redSceneryRGB, greenSceneryRGB, blueSceneryRGB);
    rectMode(CORNER);
    noStroke();

    for (int i = 0; i < 12; i++) {
      fill(redSceneryRGB +(i*5), greenSceneryRGB+(i*5), blueSceneryRGB+(i*5)); // Original fill(205, 120, 0);
      if (backgroundSetup == false) {
        ellipse((width/2), (height/2), (1500-(i*100)), (1500-(i*100)));
        backgroundIncreaseY = 300;
        backgroundSetup = true;
      } else {
        ellipse((width/2) + backgroundIncreaseX, (height/2) + backgroundIncreaseY, 1500-(i*100), 1500-(i*100));
        // Hides the Top Corners
        if (i == 0) {
          rect(0, 0, 100, 100); // hides the top left top corner
          rect(width-100, 0, 100, 100); // hides the top right top corner
        }// end if
      }// end if
    } // end for
  }// end drawScenery function

  //******* Setter Methods *******
  //------- setRedSceneryRGB Method -------
  public void  setRedSceneryRGB(int redSceneryRGB) {
    this.redSceneryRGB = redSceneryRGB;
  }

  //------- setGreenSceneryRGB Method -------
  public void  setGreenSceneryRGB(int greenSceneryRGB) {
    this.greenSceneryRGB = greenSceneryRGB;
  }

  //------- setBlueSceneryRGB Method -------
  public void  setBlueSceneryRGB(int blueSceneryRGB) {
    this.blueSceneryRGB = blueSceneryRGB;
  }

  //******* Getter Methods *******
  //------- getRedSceneryRGB Method -------
  public float getRedSceneryRGB() {
    return redSceneryRGB;
  }

  //------- getGreenSceneryRGB Method -------
  public float getGreenSceneryRGB() {
    return greenSceneryRGB;
  }

  //------- getBlueSceneryRGB Method -------
  public float getBlueSceneryRGB() {
    return blueSceneryRGB;
  }
}// end Player class
