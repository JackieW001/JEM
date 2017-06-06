public class UserPlayer extends Player {
  //New variable
  int space;
  // used to allow to place combos
  int numOfCardsPlaced;
  boolean noAction;

  /***************** CONSTRUCTOR *************************/
  UserPlayer() {
    name = "You";
    hand = new  ArrayList<Card>();
  }

  UserPlayer( String s ) {
    name = s;
    hand = new  ArrayList<Card>();
  }
  /********************************************************/

  /*******************************************************
   * Displays user player's hand with cards face up on the
   * bottom of the display window
   ******************************************************/
  public void displayHand() {
    sort();
    // spacing between cards
    space = 70; //= (width-200)/getHandSize();
    if (getHandSize() > 10)
      space = 25;
    else if (getHandSize() > 8)
      space = 50;

    // position of left most card
    int offset = (width/2) - (space*((getHandSize() - 1)/2)) - 30;

    for (int i = 0; i < hand.size(); i++) {
      int ypos = height-hand.get(i).cardHeight-20;
      if (hand.get(i).isMouseInRange()) {
        ypos -= 30;
      }
      hand.get(i).display(offset, ypos);
      offset += space;
    }
  }

  /*****************************************************
   * Add a card to the player's hand
   ******************************************************/
  public void drawCard() {
    if ( hand.size() < 26) {
      hand.add(_drawPile.removeCard());
    }
  }

  public void noAction() {
    if (noAction) {
      _user.drawCard();
    }
  }

  //Displays the endTurn Button on the interface
  public void displayEndTurnButton() {
    if (group.currentPlayer.name.equals("You")) {
      fill(#6FCFEA);
      stroke(#2A819B);
      rect(width/2-100, height/2+90, 200, 90, 45);
      textSize(32);
      fill(255);
      text("End Turn", width/2-75, height/2+150);
    }
  }

  //Hides it while it's not the player's turn
  public void hideEndButton() {
    fill(#62B475);
    noStroke();
    rect(width/2-100, height/2+90, 201, 91);
    fill(#62B475);
  }


  //Checks if the mouse is in range
  public boolean isInRangeOfEndButton() {
    if (mouseX > width/2-100 && mouseX < width/2 + 100 &&
      mouseY > height/2 && mouseY < height/2 + 180) {
      return true;
    } else {
      return false;
    }
  }

  /*****************************************************
   * Autosort player hand using heapsort
   ******************************************************/
  public void sort() {
    for (int x = hand.size() / 2 -1; x >= 0; x--) {
      heapify(hand.size(), x);
    }

    for (int x = hand.size() - 1; x >= 0; x--) {
      Card temp = hand.get(0);
      hand.set(0, hand.get(x));
      hand.set(x, temp);

      heapify( x, 0);
    }
  }

  /*****************************************************
   * Helper function for sort
   ******************************************************/
  private void heapify(int a, int b) {
    int largest = b;
    int l = 2 * b + 1;  //left
    int r = 2 * b + 2;  //right

    if (l < a && hand.get(l).compareTo(hand.get(largest)) > 0) {
      largest = l;
    }
    if (r < a && hand.get(r).compareTo(hand.get(largest)) > 0) {
      largest = r;
    }
    if (largest != b) {
      Card swap = hand.get(b);
      hand.set(b, hand.get(largest));
      hand.set(largest, swap);

      heapify(a, largest);
    }
  }

  public void endTurn() {
    super.endTurn();
    hideEndButton();
  }
  //Loop for the player
  public void play() {
    if (this.isSkipped) {
      this.isSkipped = false; 
      super.endTurn();
      return;
    }
    displayEndTurnButton();
  }
}