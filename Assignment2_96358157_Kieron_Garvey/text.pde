/* Text Class
 *
 * Summary: This Class is used to display text on the screen.
 *    all teh paramenters needed to write the text are passed in
 *    durign the function call.
 *
 * Parameters passed in and function they are used in
 *
 * text(Text2Display, xPositionText, yPositionText);
 *   Text2Display - Acutal Text to be displayed
 *   xPositionText - xPosition of Text
 *   yPositionText - xPosition of Text
 *
 * textSize(sizeText); - Sets the size of the text
 * textAlign(alignText); - Aligns the Text, LEFT, CENTER or RIGHT
 *
 * fill(rFillColour, gFillColour, bFillColour); - uses RGB Values
 *   rFillColour - for RED
 *   gFillColour - For GREEN
 *   bFillColour - for BROWN
 *
 * By: Kieron Garvey
 * Date: 13/Mar/2023
 * Version: 1.0
 */
public class Text {
  private String Text2Display;
  private int xCoord;
  private int yCoord;
  private int sizeText;
  private int alignText;
  private float redSceneryRGB; //x position of the player object
  private float greenSceneryRGB; //y position of the player object
  private float blueSceneryRGB; //size of the player object
  
  // Default Invader Constructor
  Text() { }// end Bullet constructor
  
  //------- Overloaded Text Constructor -------
  Text (String displayText, int x_Position, int y_Position, int textSze, int textAlign, int rFillColour, int gFillColour, int bFillColour ) {
    Text2Display = displayText;
    xCoord = x_Position;
    yCoord = y_Position;
    sizeText = textSze;
    alignText = textAlign;
    redSceneryRGB = rFillColour;
    greenSceneryRGB = gFillColour;
    blueSceneryRGB = bFillColour;
  } // end Player object definition

 //------- Overloaded Text Constructor -------
 Text (String displayText, int x_Position, int y_Position, int textSze, int textAlign) {
    Text2Display = displayText;
    xCoord = x_Position;
    yCoord = y_Position;
    sizeText = textSze;
    alignText = textAlign;
    redSceneryRGB = 234;
    greenSceneryRGB = 17;
    blueSceneryRGB = 39;
  } // end Player object definition
  
  //------- Text Overloaded Constructor -------
 Text (String displayText, int x_Position, int y_Position, int textSze) {
    Text2Display = displayText;
    xCoord = x_Position;
    yCoord = y_Position;
    sizeText = textSze;
    alignText = LEFT;
    redSceneryRGB = 234;
    greenSceneryRGB = 17;
    blueSceneryRGB = 39;
  } // end Player object definition

  //------- Text Overloaded Constructor -------
 Text (String displayText, int x_Position, int y_Position) {
    Text2Display = displayText;
    xCoord = x_Position;
    yCoord = y_Position;
    sizeText = 56;
    alignText = LEFT;
    redSceneryRGB = 234;
    greenSceneryRGB = 17;
    blueSceneryRGB = 39;
  } // end Player object definition
  
  //------- displayText Function -------
  void displayText() {
    //Adding Text to the Screen
    textAlign(alignText);
    textFont(myFont, 128);
    textSize(sizeText);
    if(gameState == "HIGH_SCORE" && strokeFont ||
       gameState == "GAMEOVER"  && strokeFont) {
    fill(255);
    for (int i = -1; i < 2; i++) {
      text(Text2Display, xCoord + (i*2), yCoord);
      text(Text2Display, xCoord, yCoord + (i*2));
    }
    }
    fill(redSceneryRGB, greenSceneryRGB, blueSceneryRGB);
    text(Text2Display, xCoord, yCoord);
  }// end displayText function

  //******* Setter Methods *******
  //------- setXCoord Method -------
  public void  setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }

  //------- setYCoord Method -------
  public void setYCoord(int yCoord) {
    this.yCoord = this.yCoord  + yCoord;
  }

  //------- setSizeText Method -------
  public void setSizeText(int sizeText) {
    this.sizeText = sizeText;
  }

  //------- setAlignText Method -------
  public void setAlignText(int alignText) {
    this.alignText = alignText;
  }

  //------- setRedSceneryRGB Method -------
  public void setRedSceneryRGB(int redSceneryRGB) {
    this.redSceneryRGB = redSceneryRGB;
  }

  //------- setGreenSceneryRGB Method -------
  public void setGreenSceneryRGB(int greenSceneryRGB) {
    this.greenSceneryRGB = greenSceneryRGB;
  }

  //------- setBlueSceneryRGB Method -------
  public void setBlueSceneryRGB(int blueSceneryRGB) {
    this.blueSceneryRGB = blueSceneryRGB;
  }

  //************** Getter Methods **************
  //------- getXCoord Method -------
  public int  getXCoord() {
    return xCoord;
  }

  //------- getYCoord Method -------
  public int getYCoord() {
    return yCoord;
  }

  //------- getSizeText Method -------
  public int getSizeText(int sizeText) {
    return sizeText;
  }

  //------- getAlignText Method -------
  public int getAlignText(int alignText) {
    return alignText;
  }

  //------- getRedSceneryRGB Method -------
  public int getRedSceneryRGB(int redSceneryRGB) {
    return redSceneryRGB;
  }

  //------- getGreenSceneryRGB Method -------
  public int getGreenSceneryRGB(int greenSceneryRGB) {
    return greenSceneryRGB;
  }

  //------- getBlueSceneryRGB Method -------
  public int getBlueSceneryRGB(int blueSceneryRGB) {
    return blueSceneryRGB;
  }
}// end Player class
