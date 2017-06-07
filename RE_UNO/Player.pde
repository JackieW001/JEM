//Superclass, no real methods, only variables and accessors/mutators, along with mandatory methods
public abstract class Player {

  ArrayList<Card> hand; // max 20 cards 
  String name; 
  Player next, prev; //Used in Group
  boolean isSkipped; //Checks if the Player have been skipped or not
  boolean wait;
  boolean input;
  int wild;
  
  //Constructor 
  Player() {
    hand = new ArrayList<Card>();
    wait = false;
    input = false;
    wild = 0;
  }

  /**************** ACCESSORS AND MUTATORS ****************/
  public ArrayList<Card> getHand() {
    return hand;
  }

  public int getHandSize() {
    return hand.size();
  }

  public Player getPrev() { 
    return prev;
  }
  public Player getNext() { 
    return next;
  }
  public void setPrev(Player newPrev) { 
    prev = newPrev;
  }
  public void setNext(Player newNext) { 
    next = newNext;
  }
  public String toString(){
   return name; 
  }
  public void placeCard(int i) { 
    _placePile.add(hand.remove(i));
  }
  /********************************************************/

  /*********************************************************
  giveAction(Card card) - Used to give the nextPlayer a 
  certain action, depending on what action card the
  current player has placed.
  ********************************************************/
  public void giveAction( Card card) {
    Player nextPlayer;
    if (group.isClockwise)
      nextPlayer = group.currentPlayer.getNext(); 
    else
      nextPlayer = group.currentPlayer.getPrev(); 

    if (card.getAction() == 5) {//wild4
      group.currentPlayer.endTurn();
      addBattle(4);
      return;
    }

    if (card.getAction() == 3) {//+2
      group.currentPlayer.endTurn();
      addBattle(2);
      System.out.println("in draw 2");
      return;
    }
    
    if (card.getAction() == 2) {//skip
      nextPlayer.isSkipped = true;
      System.out.println("in skip");
      return;
    }
    
    if (card.getAction() == 1) {//reverse
      group.isClockwise = !group.isClockwise;
      return;
    } 
    
    else {
      return;
    }
  }

 /*===================================
   addBattle() - for +2 and +4
   Starts an addBattle of +2 or +4
   between the players after a +2/+4
   action card has been placed.
   If not able to fight, will be forced
   to get the cards.
   ===================================*/
  void addBattle(int x) {

    System.out.println("AddBattle: " + x);
    delay(250);
    if ( hasToF(group.currentPlayer.getHand(), 3) > -1) {
      if (group.currentPlayer.equals(_user)){_user.placeCard( hasToF (group.currentPlayer.getHand(), 3) );}
      else group.currentPlayer.placeCard( hasToF(group.currentPlayer.getHand(), 3) );
      group.currentPlayer.endTurn();
      System.out.println("AddBattle goes to" + group.currentPlayer);
      delay(500);
      addBattle(x + 2);
      return;
      } 
      
    else if ( hasToF(group.currentPlayer.getHand(), 5) > -1) {
      if (group.currentPlayer.equals(_user)){_user.placeCard( hasToF (group.currentPlayer.getHand(), 5) );}
      else group.currentPlayer.placeCard( hasToF(group.currentPlayer.getHand(), 5) );
      group.currentPlayer.endTurn();
      System.out.println("AddBattle goes to" + group.currentPlayer);
      delay(500);
      addBattle(x + 4);
      return;
      } 
      
    for (int y = 0; y < x; y++) {
        group.currentPlayer.drawCard();
      }
      
      System.out.println(group.currentPlayer + " is drawing cards");
  }


  /*************************************
  hasToF (a.k.a. hasTwoOrFour) -
  helperMethod to addBattle(int x),
  used to check if any card is playable
  with the action card, and if so, returns
  the int of the index of the card that
  is playable
  *************************************/
  int hasToF(ArrayList<Card> c, int a) {
    for (int x = 0; x < c.size(); x++) {
      if (c.get(x).getAction() == a) {//Checks if the action is +2 or +4wild
        if (c.get(x).playable( _placePile.peek())) { //Checks if it's playable
            return x;
        }
      }
    }
    return -1;
  }

//endTurn() - ends the turn of the player, goes to next player
//checks if it's clockwise or counterclockwise, and goes that direction
  public void endTurn() {
    if (group.isClockwise)
      group.currentPlayer = group.currentPlayer.getNext(); 
    else
      group.currentPlayer = group.currentPlayer.getPrev();
  }
  
  public abstract void displayHand();
  public abstract void drawCard();
  public abstract void play();
}