public class Group {

  //Variables
  Player currentPlayer;
  boolean isClockwise; //Checks if it's going clockwise or counter-clockwise, used for reverse action cards

  //Constructor
  Group() {
    currentPlayer = null;
    isClockwise = true;
  }

  //Setup the table and order
  public void setRoundRobin() {
    AI1.setNext(AI2); 
    AI1.setPrev(_user);

    AI2.setNext(AI3); 
    AI2.setPrev(AI1);

    AI3.setNext(_user); 
    AI3.setPrev(AI2);

    _user.setNext(AI1); 
    _user.setPrev(AI3);

    currentPlayer = _user;
  }

  //Passes to the next player
  public void pass() {
    if (keyPressed) {
      if (key == 'p') // goes on to next player
        currentPlayer.endTurn();
      if (key == 'r') // reverses order
        isClockwise = !isClockwise;
    }
  }
  
  //play method as a loop
  public void play() {
    //Sets the background to this color
    background(#62B475);
    //Checks if any of the players have won or not
    if (AI1.getHandSize() > 0 && AI2.getHandSize() > 0 && AI3.getHandSize() > 0 && _user.getHandSize() > 0) {
      if (!this.currentPlayer.equals(_user)) {
        delay(1500);
      } 
      
      //Starts with the current player playing
      textSize(15);
      fill(0);
      //Displays the current player on top left side of the screen
      text("Current Player: " + currentPlayer.name, 20, 40);
      
      this.currentPlayer.play();

      //endTurn button
      if (currentPlayer.equals(_user)) { 
        _user.displayEndTurnButton();
      } else { 
        _user.hideEndButton();
      }
    }
    
    textSize(32);
    fill(0);
    
    //Displays the hands of the players and the piles
    _user.displayHand();
    _drawPile.displayPile();
    _placePile.displayPile();
    AI1.displayHand();
    AI2.displayHand();
    AI3.displayHand();
    
    println(_user.getHandSize());
    println(AI1.getHandSize());
    println(AI2.getHandSize());
    println(AI3.getHandSize());
    println("__________________________________");
    
    //If user manages to place all their cards
    if (_user.getHandSize() == 0 ) { 
      text("YOU WON!!", width/2-30, height/2+70); 
      noLoop();
    } 
    //Else if an AI manages to do it before player
    else if ( AI1.getHandSize() == 0 || AI2.getHandSize() == 0 || AI3.getHandSize() == 0 ) {
      text("YOU LOST!!", width/2-30, height/2+70);
      noLoop();
    }
  }
}