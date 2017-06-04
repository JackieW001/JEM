//Superclass, no real methods, only variables and accessors/mutators, along with mandatory methods
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
   
   public void receiveAction(Card card){
     if (card.getAction() == 5){//wild4
       drawCard();
       drawCard();
       drawCard();
       drawCard();
       return;
     }
     if (card.getAction() == 4){//wild
       return;
     }
     if (card.getAction() == 3){//+2
       drawCard();
       drawCard();
       return;
     }
     if (card.getAction() == 2){//skip
       group.currentPlayer.endTurn();
       return;
     }
     if (card.getAction() == 1){//reverse
       group.isClockwise = !group.isClockwise;
     }
     else {
       return;
     }
   }
   
   public void endTurn(){
    if (group.isClockwise)
      group.currentPlayer = group.currentPlayer.getNext(); 
    else
      group.currentPlayer = group.currentPlayer.getPrev();   
   }  
   public abstract void displayHand();
   public abstract void drawCard();
   public abstract void play();
   
}