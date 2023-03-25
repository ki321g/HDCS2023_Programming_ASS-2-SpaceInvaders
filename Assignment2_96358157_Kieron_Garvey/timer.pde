/* Timer Class
 *
 * Summary: Used as a Timer for the Game
 *
 * By: Kieron Garvey
 * Date: 13/Mar/2023
 * Version: 1.0
 */
public class Timer {
  private int startTime;
  private int interval;
  
  // Default Invader Constructor
  Timer() {
    interval = 1000;
  }// end Bullet constructor
  
  //------- Timer Constructor -------
  Timer(int timeInterval) {
    interval = timeInterval;
  }
 
  void start() {
    startTime = millis();
  }

  boolean complete() {
    int elapsedTime = millis() - startTime;
    if (elapsedTime > interval) {
      return true;
    } else {
      return false;
    }
  }

  //******* Setter Methods *******
  //------- setTimeInterval Method -------
  public void  setTimeInterval(int timeInterval) {
    this.interval = timeInterval;
  }
  
  //------- setStartTime Method -------
  public void  setStartTime(int startTime) {
    this.startTime = startTime;
  }

  //******* Getter Methods *******
  //------- getTimeInterval Method -------
  public int  getTimeInterval() {
    return this.interval;
  }
   //------- getStartTime Method -------
  public int  getStartTime() {
    return this.startTime;
  }
}// end Timer class
