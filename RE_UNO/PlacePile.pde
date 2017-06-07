public class PlacePile{
    
   ArrayList<Card> pile; //Uses an arraylist for the pile
   
   /***************** CONSTRUCTOR *************************/
   PlacePile(){
     pile = new ArrayList<Card>();
     pile.add(initCard());
   }
   /********************************************************/
   
  /***************************************
  initCard() - used for putting the init
  card at the beginning of the game.
  Makes sure that the card is a number,
  and not an action card. 
  (used in constructor)
  ***************************************/
   public Card initCard(){
     Card _drawPileCard = _drawPile.removeCard();
     while (_drawPileCard.getAction() != 0 ){
        _drawPileCard = _drawPile.removeCard();
     }
     return _drawPileCard;
   }
   
   /********************************************************
   * Display PlacePile 
   * Used for displaying the pile
   * Method is used in group.play()
   ********************************************************/
   public void displayPile(){
      if (pile.size() <= 0){
         fill(#62B475);
         strokeWeight(4);
         stroke(255, 150);
         rect( width/2, height/2 - 55, 70, 105,7);
      }  
      else {
        peek().display(width/2, height/2 - 55);
      }
   }
   
   //add(Card card) - adds the card to the pile, than displaying it
   public void add(Card card){
      pile.add(card);
      displayPile();
   }
   
   //size() - returns the size of the pile
   public int size(){
     return pile.size();
   }
   
   //peek() - returns the card on top of the pile
   public Card peek(){
     return pile.get(pile.size()-1); 
   }
   
   //getCard(int i) - returns the card in the pile at that index
   public Card getCard(int i){
     return pile.get(i);
   }
   
}