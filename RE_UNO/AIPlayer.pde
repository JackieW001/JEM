public class AIPlayer extends Player{
  

  // index determines AI1, AI2, AI3
  int index;
  PImage cardImg;
  
  /****************** CONSTRUCTOR *******************/
  AIPlayer(int newIndex, String newName){
      name = newName;
      hand = new ArrayList<Card>();
      index = newIndex;
      cardImg = loadImage("./img/99_99_99.jpg");
  }
  /**************************************************/
  
  /*******************************************************
   * Displays user player's hand with cards face up on the
   * bottom of the display window
   ******************************************************/
  public void displayHand(){
        // spacing between cards
        int space = 70; 
        if (getHandSize() > 10)
            space = 25;
        else if (getHandSize() > 8)
            space = 50;
            
        switch (index){
        case 1: // AI1: on left side
            // position of top most card
            int offset = (height/2) - (space*((getHandSize() - 1)/2)) - 30;
            for (int i = 0; i < hand.size(); i++){
                
                // rotate cards
                pushMatrix();
                translate(hand.get(i).cardHeight+20, offset);
                rotate(PI/2);
                image(cardImg, 0, 0);
                cardImg.resize(65,100);
                popMatrix();
                
                offset += space; 
             }
            break;
            //end case 1
         case 2: //AI2 on tope
            offset = (width/2) - (space*((getHandSize() - 1)/2)) + 30;
            for (int i = 0; i < hand.size(); i++){
    
                // rotate cards
                pushMatrix();
                translate(offset, hand.get(i).cardHeight+20);
                rotate(PI);
                image(cardImg, 0, 0);
                cardImg.resize(65,100);
                popMatrix();
                
                offset += space; 
             }
             break;
            //end case 2
         case 3: //AI3 on right side
           // position of top most card
            offset = (height/2) - (space*((getHandSize() - 1)/2)) + 30;
            for (int i = 0; i < hand.size(); i++){
                
                // rotate cards
                pushMatrix();
                //hand.get(i).display(width-hand.get(i).cardHeight-20, offset);
                translate(width-hand.get(i).cardHeight-20, offset);
                rotate(3*PI/2);
                image(cardImg, 0, 0);
                cardImg.resize(65,100);
                popMatrix();
                
                offset += space; 
             }
            break;
            //end case 3
      }// close switch
  } 
  
   
   /*****************************************************
    * Add a card to the player's hand
    ******************************************************/
    public void drawCard() {
      if ( hand.size() < 26){
        hand.add(_drawPile.removeCard());
      }
    }
  
    /*****************************************************
    * To be changed with real AI (Ed and Maggie)
    ******************************************************/
    public void play(){
      for ( int i = 0; i < hand.size()-1; i++ ){
         if ( hand.get(i).playable(_placePile.peek()) ){
             _placePile.add(hand.remove(i));
         }
         else { this.drawCard(); break;}
      }
      super.endTurn();
    }

    
    
}