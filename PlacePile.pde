public class PlacePile{
    
   ArrayList<Card> pile;
   
   /***************** CONSTRUCTOR *************************/
   PlacePile(){
     pile = new ArrayList<Card>();
     pile.add(_drawPile.removeCard());
   }
   /********************************************************/
   
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
        pile.get(pile.size()-1).display(width/2, height/2 - 55);
      }
   }
   public void add(Card card){
      pile.add(card); 
   }
   public int getSize(){
     return pile.size();
   }
   public Card getCard(int i){
     return pile.get(i);
   }
   
}
