public abstract class Player{
  
   ArrayList<Card> hand; // max 20 cards 
   String name;
   Player next, prev;
   
   Player(){
       hand = new ArrayList<Card>(); 
   }
   
   /**************** ACCESSORS AND MUTATORS ****************/
   public ArrayList<Card> getHand() {
        return hand;
   }
    
   public int getHandSize(){
       return hand.size(); 
   }
   
   public Player getPrev() { return prev; }
   public Player getNext() { return next; }
   public void setPrev(Player newPrev) { prev = newPrev; }
   public void setNext(Player newNext) { next = newNext; }
   /********************************************************/
   
   public abstract void endTurn();    
   public abstract void displayHand();
   public abstract void drawCard();
   public abstract void play();
   
}