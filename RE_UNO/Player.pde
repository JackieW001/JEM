//Superclass, no real methods, only variables and accessors/mutators, along with mandatory methods
public abstract class Player{
  
   ArrayList<Card> hand; // max 20 cards 
   String name;
   Player next, prev;
   boolean isSkipped;
   
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
   
   public void giveAction( Card card){
     Player nextPlayer;
     if (group.isClockwise)
      nextPlayer = group.currentPlayer.getNext(); 
     else
      nextPlayer = group.currentPlayer.getPrev(); 
      
     if (card.getAction() == 5){//wild4
       for (int i = 0; i < 4; i++)
         nextPlayer.drawCard();
       card.setC(1);
       System.out.println("in draw 4");
       return;
     }
     if (card.getAction() == 4){//wild
       card.setC(1); //set color to red
       System.out.println("in wild red");
       return;
     }
     if (card.getAction() == 3){//+2
       nextPlayer.drawCard();
       nextPlayer.drawCard();
       System.out.println("in draw 2");
       return;
     }
     if (card.getAction() == 2){//skip
       nextPlayer.isSkipped = true;;
       System.out.println("in skip");
       return;
     }
     if (card.getAction() == 1){//reverse
       group.isClockwise = !group.isClockwise;
       return;
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