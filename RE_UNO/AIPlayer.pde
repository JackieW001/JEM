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
   * AI
   ******************************************************/

  /*
   * Early Challenge AI (third round)
   *
   * Iterate through the hand and create a list of all playable combos involving cards with numerical values.  First, 
   * check to see if the next player is about to win (1-2 cards left).  If true, try to play one of the following: 
   * skip, draw 2, wild4, or reverse (if previous player isn't about to win).  Avoid wild card at all cost!!  Otherwise,
   * Add any playable action cards separately (don't chain them; you usually only want to chain them only if you can 
   * play them all <also there are rules against chaining draw 4s I think>).  If the longest combo means playing reverse
   * when the previous player is about to win, draw a card and end the turn instead.  Otherwise, find and play the longest
   * combo (one can theoretically rule that you should play single cards first and leave the combos for later... <in which 
   * case simply look for the shortest possibleMove combo>).  If no card can be played, then draw a card.
   *
   * Future ToDos
   * ------------
   * Improvement for round 4 AI (probably won't get to it)
   * Modify the round 2 algorithm to get rid of lonely strays first, saving combos (particulary those composed of multiple
   * colors for later).  This decreases the chance of the need to draw cards in the future.  Also modify the round 3 heuristic
   * to take into account the players coming after (ie if you have two skip cards and the next two players are both about to win,
   * play both cards if possible instead of just one).
   */

  private ArrayList<Card> getBestMoveToThwartWin(){
    Player prevPlayer = getPrev();
    Card lastPlayedCard = _placePile.peek();

    for (int handIndex = 0; handIndex < hand.size(); handIndex++) {
      Card cardAtHandIndex = hand.get(handIndex);
      if (cardAtHandIndex.getAction() != 99 && cardAtHandIndex.getAction() != 4 && cardAtHandIndex.playable(lastPlayedCard)) {
        if (cardAtHandIndex.getAction() == 1 && prevPlayer.getHandSize() < 3) {
          continue;
        }
        ArrayList<Card> bestMove = new ArrayList<Card>();
        bestMove.add(cardAtHandIndex);
        return bestMove;
      }
    }
    return new ArrayList<Card>();
  }

  private ArrayList<ArrayList<Card>> getPossibleMoves() {
    Card lastCardPlayed = _placePile.peek();
    ArrayList<ArrayList<Card>> possibleMovesList = new ArrayList<ArrayList<Card>>();

    for (int cardIndex = 0; cardIndex < hand.size(); cardIndex++) {
      Card currentCard = hand.get(cardIndex);

      boolean addedToList = false;
      for (int possibleMovesListIndex = 0; possibleMovesListIndex < possibleMovesList.size(); possibleMovesListIndex++) {
        ArrayList<Card> possibleMove = possibleMovesList.get(possibleMovesListIndex);
        Card firstCardInPossibleMove = possibleMove.get(0);
        if (currentCard.getValue() != 99 && firstCardInPossibleMove.getValue() == currentCard.getValue()) {
          possibleMove.add(currentCard);
          addedToList = true;
          break;
        }
      }

      if (!addedToList && currentCard.playable(lastCardPlayed)) {
        ArrayList<Card> possibleMove = new ArrayList<Card>();
        possibleMove.add(currentCard);
        possibleMovesList.add(possibleMove);
      }
    }
    return possibleMovesList;
  }

  private ArrayList<Card> getBestMove() {
    Player nextPlayer = getNext();

    if (nextPlayer.getHandSize() < 3) {
      ArrayList<Card> bestMove = getBestMoveToThwartWin();
      if (bestMove.size() > 0) {
        return bestMove;
      }
    }

    ArrayList<ArrayList<Card>> possibleMovesList = getPossibleMoves();
    ArrayList<Card> bestMove = new ArrayList<Card>();
    for (int possibleMovesListIndex = 0; possibleMovesListIndex < possibleMovesList.size(); possibleMovesListIndex++) {
      ArrayList<Card> possibleMove = possibleMovesList.get(possibleMovesListIndex);
      if (possibleMove.size() > bestMove.size()) {
        bestMove = possibleMove;
      }
    }
    return bestMove;
  }

  public void play() {
    if (this.isSkipped) { 
      this.isSkipped = false;
      super.endTurn();
      return;
    }

    ArrayList<Card> bestMove = getBestMove();

    println(hand);
    println(bestMove);

    for (int bestMoveIndex = 0; bestMoveIndex < bestMove.size(); bestMoveIndex++) {
      Card bestMoveCardAtIndex = bestMove.get(bestMoveIndex);  
      if (bestMoveCardAtIndex.action != 0) {
        this.giveAction(bestMoveCardAtIndex);
      }
      hand.remove(bestMoveCardAtIndex);
      _placePile.add(bestMoveCardAtIndex);
    }

    Player prevPlayer = getPrev();
    boolean playingReverseWhenPreviousPlayerIsAboutToWin = false;

    boolean noPossibleMove = bestMove.size() == 0;
    if (!noPossibleMove) {
      Card firstCardInBestMove = bestMove.get(0);
      playingReverseWhenPreviousPlayerIsAboutToWin = (bestMove.size() == 1 && firstCardInBestMove.getAction() == 1 && prevPlayer.getHandSize() < 3);
    }

    if (noPossibleMove || playingReverseWhenPreviousPlayerIsAboutToWin) {
      this.drawCard();
    }
    super.endTurn();
  }
}