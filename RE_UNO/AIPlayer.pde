public class AIPlayer extends Player{
  //TODO: (Edward)
  /*
  Finish working on AI decision-making skills
  and conceptualizations.
  Make flowcharts and visuals for concepts.
  */

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
      if ( hand.size() < 21){
        hand.add(_drawPile.removeCard());
      }
    }

//AI Algo 
   
   //Checks if the AI has any playable cards to begin with
   boolean hasPlayable(){
     ArrayList<Card> temp = hand;
     for (int x = 0; x < temp.size(); x++){
        if (temp.get(x).playable(_placePile.getCard(_placePile.getSize()-1)))
          return true;
     }
     return false;
   }
   
  
/*
method used as a way for the AI to "ask itself"
Returns an int that represents a different card being placed.
0: Places a number
1: Places a reverse
2: Places a skip
3: Places a +2
4: Places a +4
5: Places a wild
6: Draws a card (nothing)
*/
   int askItself(){
      if (hasPlayable()){
        if (hand.size() == 1){
            return 5; //Using 5, since it'll automatically attempt to lose whatever card it has in it's hand anyways
        }
        else if (hasPlayable(3)){ //Checks if the top is +2
            return 3;
        }
        else if (hasPlayable(4)){
           return 4; 
        }
        else if (hasPlayable(2)){
            return 2;
        }
        else if (hasPlayable(1)){
           return 1; 
        }
        else return 0;
      }        
      return 6;
   }
   
   //Helper method
   public void play(){
       playH(askItself()); 
       group.pass();
   }
   
   //Overwritten playCard() method
   //plays based on decision made in askItself()
   void playH(int x){
       if (x == 6){
         drawCard();
       }
       else if (x == 5){
         placeCard(5);
       }
       else if (x == 4){     
         placeCard(4);
       }
       else if (x == 3){
         placeCard(3);
       }
       else if (x == 2){
         placeCard(2);
       }
       else if (x == 1){
         placeCard(1);
       }
       else placeCard(0);
   }
   
   //Places a card that matches it's action with the param 'a'
   void placeCard(int a){
     ArrayList<Card> temp = hand; 
     
     if (temp.size() == 1){
        playCard(temp.get(0));
        return;      
     }
     
     for(int x = 0; x < temp.size(); x++){
        if (temp.get(x).getAction() == a && playCard(temp.get(x))){
          return;
        }     
     }
   }
   
   //Plays the card
   public boolean playCard(Card c) {    
      if (_placePile.getCard(_placePile.getSize()-1).playable(c)){
         _placePile.add(c);
         hand.remove(c);
         return true;
      }
      return false;
    }
    
    //Mainly for checking if it has skip or reverse cards that ARE playable
    public boolean hasPlayable(int a){
<<<<<<< HEAD
      for (int x = 0; x < hand.size()-1; x++){
        System.out.println(x);
          if (hand.get(x).getAction() == a){  
             if (hand.get(x).playable(_placePile.getCard(_placePile.getSize()-1))){ //checks if card is playable
=======
      for (int x = 0; x < hand.size(); x++){
          if (hand.get(x).getAction() == a){
             if (hand.get(x).playable(_placePile.getCard(_placePile.getSize()))){
>>>>>>> 4f61dd615b6af0ea0cd27ca51cf3a1b29a918c8d
                return true; 
             }
          }
      }
      return false;
    }
    
    //Ends turn
    public void endTurn(){
      if (group.isClockwise)
        group.currentPlayer = group.currentPlayer.getNext(); 
      else
        group.currentPlayer = group.currentPlayer.getPrev();
        
    }
   
}
    