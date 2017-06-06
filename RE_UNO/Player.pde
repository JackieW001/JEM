//Superclass, no real methods, only variables and accessors/mutators, along with mandatory methods
public abstract class Player {

  ArrayList<Card> hand; // max 20 cards 
  String name;
  Player next, prev;
  boolean isSkipped;

  Player() {
    hand = new ArrayList<Card>();
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
  public void placeCard(int i) { 
    _placePile.add(hand.remove(i));
  }
  /********************************************************/

  public void giveAction( Card card) {
    Player nextPlayer;
    if (group.isClockwise)
      nextPlayer = group.currentPlayer.getNext(); 
    else
      nextPlayer = group.currentPlayer.getPrev(); 

    if (card.getAction() == 5) {//wild4
      System.out.println("In wild4");
      if (group.currentPlayer == _user) {     
        while (keyPressed) {
          if (key == 1)
            _placePile.getCard(_placePile.size()-1).setColor(1);
          else if (key == 2)
            _placePile.getCard(_placePile.size()-1).setColor(2);
          else if (key == 3)
            _placePile.getCard(_placePile.size()-1).setColor(3);
          else if (key == 4)
            _placePile.getCard(_placePile.size()-1).setColor(4);
        }
      } else {
        int x = (int)(Math.random() * 4) + 1;
        _placePile.getCard(_placePile.size()-1).setColor(x);
      }

      addBattle(4);
      return;
    }
    
    if (card.getAction() == 4) {//wild
      System.out.println("In wild");
      // choose color
      if (group.currentPlayer == _user) {     
        if (keyPressed) {
          if (key == 1){
            System.out.println("change color to red");
            _placePile.getCard(_placePile.size()-1).setColor(1);
          }
          else if (key == 2)
            _placePile.getCard(_placePile.size()-1).setColor(2);
          else if (key == 3)
            _placePile.getCard(_placePile.size()-1).setColor(3);
          else if (key == 4)
            _placePile.getCard(_placePile.size()-1).setColor(4);
        }
      } else {
        int x = (int)(Math.random() * 4) + 1;
        _placePile.getCard(_placePile.size()-1).setColor(x);
      }

      System.out.println("in wild");
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
    } else {
      return;
    }
  }

  /*===================================
   addBattle() - for +2 and +4
   ===================================*/
  void addBattle(int x) {
    if ( hasToF(group.currentPlayer.getHand(), 2) >=  0 ) {
      group.currentPlayer.placeCard( hasToF(group.currentPlayer.getHand(), 2) );
      group.currentPlayer.endTurn();
      addBattle(x + 2);
      return;
    } else if ( hasToF(group.currentPlayer.getHand(), 4) >= 0) {
      group.currentPlayer.placeCard( hasToF(group.currentPlayer.getHand(), 4) );
      group.currentPlayer.endTurn();
      addBattle(x + 4);
      return;
    } else {
      for (int y = 0; y < x; y++) {
        group.currentPlayer.drawCard();
      }
    }
  }

  int hasToF(ArrayList<Card> c, int a) {
    for (int x = 0; x < c.size(); x++) {
      if (c.get(x).getAction() == a) {
        if (c.get(x).playable( _placePile.getCard( _placePile.size()-1 )) ) {
          return x;
        }
      }
    }
    return -1;
  }

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