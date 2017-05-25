public class UserPlayer extends Player{
  /*
  Do we really need anything new for UserPlayer that's
  different from Player .-.
  */
  
  int rectX, rectY;      // Position of square button
  int rectSize = 40;     // Diameter of rect
  color rectColor;
  color rectHighlight;
  
  UserPlayer(){
    super();
  } 
  
  void displayEndTurnButton() {
   /********* EndTurn button ********/
    rectColor = color(0);
    rectHighlight = color(51);
    rectX = width - 20;
    rectY = height - 20;
    /*********************************/
    
    rect( 10, 10, rectX, rectY );
  
  }
  
  public void playCard (Card card){
     
  }

}