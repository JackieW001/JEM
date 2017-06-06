public class PlacePile{
    
   ArrayList<Card> pile;
   
   /***************** CONSTRUCTOR *************************/
   PlacePile(){
     pile = new ArrayList<Card>();
     pile.add(initCard());
   }
   /********************************************************/
   
   public Card initCard(){
     Card _drawPileCard = _drawPile.removeCard();
     while (_drawPileCard.getAction() != 0 ){
        _drawPileCard = _drawPile.removeCard();
     }
     return _drawPileCard;
   }
   
   /********************************************************
   * Display PlacePile
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
   public void add(Card card){
      pile.add(card);
      displayPile();
   }
   public int size(){
     return pile.size();
   }
   public Card peek(){
     return pile.get(pile.size()-1); 
   }
   public Card getCard(int i){
     return pile.get(i);
   }
   
}