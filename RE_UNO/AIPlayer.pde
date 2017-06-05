public class AIPlayer extends Player {


  // index determines AI1, AI2, AI3
  int index;
  PImage cardImg;

  /****************** CONSTRUCTOR *******************/
  AIPlayer(int newIndex, String newName) {
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
  public void displayHand() {
    // spacing between cards
    int space = 70; 
    if (getHandSize() > 10)
      space = 25;
    else if (getHandSize() > 8)
      space = 50;

    switch (index) {
    case 1: // AI1: on left side
      // position of top most card
      int offset = (height/2) - (space*((getHandSize() - 1)/2)) - 30;
      for (int i = 0; i < hand.size(); i++) {

        // rotate cards
        pushMatrix();
        translate(hand.get(i).cardHeight+20, offset);
        rotate(PI/2);
        image(cardImg, 0, 0);
        cardImg.resize(65, 100);
        popMatrix();

        offset += space;
      }
      break;
      //end case 1
    case 2: //AI2 on tope
      offset = (width/2) - (space*((getHandSize() - 1)/2)) + 30;
      for (int i = 0; i < hand.size(); i++) {

        // rotate cards
        pushMatrix();
        translate(offset, hand.get(i).cardHeight+20);
        rotate(PI);
        image(cardImg, 0, 0);
        cardImg.resize(65, 100);
        popMatrix();

        offset += space;
      }
      break;
      //end case 2
    case 3: //AI3 on right side
      // position of top most card
      offset = (height/2) - (space*((getHandSize() - 1)/2)) + 30;
      for (int i = 0; i < hand.size(); i++) {

        // rotate cards
        pushMatrix();
        //hand.get(i).display(width-hand.get(i).cardHeight-20, offset);
        translate(width-hand.get(i).cardHeight-20, offset);
        rotate(3*PI/2);
        image(cardImg, 0, 0);
        cardImg.resize(65, 100);
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
    if ( hand.size() < 26) {
      hand.add(_drawPile.removeCard());
    }
  }

  /*****************************************************
   * Basic AI
   * Iterate through the hand and check to see if there is a playable card; if so
   * play the card.  If there is no playable card, draw a card.
   *
   * Note bug: The loop doesn't break after a card is played; would be adding the
   * possibility of combos next.
   ******************************************************/

  public void play() {
    if (this.isSkipped) { 
      this.isSkipped = false;
      super.endTurn();
      return;
    }

    ArrayList<ArrayList<Card>> possibleMovesList = new ArrayList<ArrayList<Card>>();

    for (int i = 0; i < hand.size(); i++) {
      Card currentCard = hand.get(i);

      boolean addToList = false;
      for (int possibleMovesListIndex = 0; possibleMovesListIndex < possibleMovesList.size(); possibleMovesListIndex++) {
        if (currentCard.getValue() != 99 && possibleMovesList.get(possibleMovesListIndex).get(0).getValue() == currentCard.getValue()) {
          possibleMovesList.get(possibleMovesListIndex).add(currentCard);
          addToList = true;
          break;
        }
      }

      if (!addToList && currentCard.playable(_placePile.peek())) {
        ArrayList<Card> possibleMove = new ArrayList<Card>();
        possibleMove.add(currentCard);
        possibleMovesList.add(possibleMove);
      }
    }

    ArrayList<Card> bestMove = new ArrayList<Card>();
    for (int possibleMovesListIndex = 0; possibleMovesListIndex < possibleMovesList.size(); possibleMovesListIndex++) {
      ArrayList<Card> possibleMove = possibleMovesList.get(possibleMovesListIndex);
      if (possibleMove.size() > bestMove.size()) {
        bestMove = possibleMove;
      }
    }

    //println(hand);
    //println(bestMove);

    for (int i = 0; i < bestMove.size(); i++) {
      if (bestMove.get(i).action != 0) {
        this.giveAction(bestMove.get(i));
      }
      hand.remove(bestMove.get(i));
      _placePile.add(bestMove.get(i));
    }

    if (bestMove.size() == 0) {
      this.drawCard();
    }
    super.endTurn();
  }
}