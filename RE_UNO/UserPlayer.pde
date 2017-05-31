public class UserPlayer extends Player{
   //New variable
   int space;
   
   /***************** CONSTRUCTOR *************************/
   UserPlayer(){
     name = "You";
     hand = new  ArrayList<Card>();
   }
   
   UserPlayer( String s ){
     name = s;
     hand = new  ArrayList<Card>();
   }
   /********************************************************/
   
   /*******************************************************
     * Displays user player's hand with cards face up on the
     * bottom of the display window
     ******************************************************/
   public void displayHand(){
     
     // spacing between cards
      space = 70; //= (width-200)/getHandSize();
      if (getHandSize() > 10)
          space = 25;
       else if (getHandSize() > 8)
          space = 50;
          
     // position of left most card
     int offset = (width/2) - (space*((getHandSize() - 1)/2)) - 30;
      
     for (int i = 0; i < hand.size(); i++){
        hand.get(i).display(offset, height-hand.get(i).cardHeight-20);
        offset += space; 
     }
   }
     
   public void displayChosenCard(){
     for (Card card: hand){
          if (card.isMouseInRange()){
             card.cardY -= 30;
             card.display(card.cardX,card.cardY);
          }
       }
   }
    /*****************************************************
     * Add a card to the player's hand
     ******************************************************/
    public void drawCard() {
      if ( hand.size() < 21){
        hand.add(_drawPile.removeCard());
      }
    }
    
    //Displays the endTurn Button on the interface
    public void displayEndTurnButton(){
      if(group.currentPlayer.name.equals("You")){
      fill(#6FCFEA);
      stroke(#2A819B);
      rect(width/2-100,height/2+90,200,90,45);
      textSize(32);
      fill(255);
      text("End Turn", width/2-75,height/2+150); 
      }
    }
    
    //Hides it while it's not the player's turn
    public void hideEndButton(){
      fill(0);
      stroke(0);
      rect(width/2-100,height/2+90,200,90.45);
      fill(0);
    }
    
    //Ends turn if the end button is pressed
    public void endTurn(){
      if (group.isClockwise)
        group.currentPlayer = group.currentPlayer.getNext(); 
      else
        group.currentPlayer = group.currentPlayer.getPrev();
      
      hideEndButton();
        
    }
    
    //Checks if the mouse is in range
    public boolean isInRangeOfEndButton(){
      if (mouseX > width/2-100 && mouseX < width/2 + 100 &&
          mouseY > height/2 && mouseY < height/2 + 180){
             return true; 
          }
       else {
         return false;
       }
    }
    
    //Loop for the player
    public void play() {
       displayChosenCard();
       displayEndTurnButton();
    }
    
    
     
   
}