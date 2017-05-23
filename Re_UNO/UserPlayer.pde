public class UserPlayer extends Player{
  /*
  Do we really need anything new for UserPlayer that's
  different from Player .-.
  */
  
  int rectX, rectY;      // Position of square button
  int rectSize = 40;     // Diameter of rect
  color rectColor;
  color rectHighlight;
  
  public UserPlayer(){
    

} 

public void displayEndTurnButton() {
      /********* EndTurn button ********/
    rectColor = color(0);
    rectHighlight = color(51);
    rectX = width - 20;
    rectY = height - 20;
    //ellipseMode(CENTER
    /*********************************/
    
    rect( 10, 10, rectX, rectY );
  
}
void mousePressed() {
}
}