//Variables

//DrawPile - uses ArrayList to hold all cards, basically the deck for drawing cards for players
DrawPile _drawPile;
//PlacePile - like DrawPile. but rather uses a pile algorithm
PlacePile _placePile;
//UserPlayer - The user (which is you!)
UserPlayer _user;
//AIPlayer(s) - the 3 AIs the user faces against, use algo to determine their actions
AIPlayer AI1,AI2,AI3;
//Group - Puts all players in a group, makes it easier for pass()ing and functionality
Group group;
//Buttons 
int buttonW, buttonH, buttonX, buttonY;
//Checks if a button has been pressed or not, specifically the one's that are above this comment
boolean buttonPressed;


/***************************************************
  setup() - Sets up the window size, instantiates
  the players and piles, drawsCards, prepares
  the game
***************************************************/

public void setup(){
    size(1000,700);
    buttonPressed = false;
    buttonW = 450;
    buttonH = 550;
    textSize(buttonH);
    buttonX = (width-450)/2;
    buttonY = (height-550)/2;
    _drawPile = new DrawPile();
    _placePile = new PlacePile();
    _user = new UserPlayer();
    AI1 = new AIPlayer(1, "Edward");
    AI2 = new AIPlayer(2, "Maggie");
    AI3 = new AIPlayer(3, "Jackie");
    group = new Group();
    group.setRoundRobin(); //sets up the ordering of the players, turn wise
    

    // init player hand
    for (int i = 0; i < 8; i++){
       _user.drawCard();
       AI1.drawCard();
       AI2.drawCard();
       AI3.drawCard();
       delay(500);
    }
}

/***************************************************
  mouseClicked() - does a certain action based on
  whether a mouse clicked on a button or not, and if
  the currentPlayer is the _user.
***************************************************/
public void mouseClicked(){
  //checks if the mouse clicked on a button, if so, set buttonPressed to true
  if (mouseX > buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH)
      buttonPressed = true;
      
  //checks if the currentPlayer is the _user
  if (group.currentPlayer.equals(_user)){
    //For each card in the user's hand
    for (int i = 0; i < _user.hand.size(); i++){ 
      
      //checks if the card is within the mouse's range
      if(_user.hand.get(i).isMouseInRange()){ 
         Card chosenCard = _user.hand.get(i); 
         
         System.out.println("number of cards placed: " + _user.numOfCardsPlaced);
         
         //Checks if a combo can be playable (cards with same number value)
         if ( chosenCard.playableInCombo(_placePile.peek()) && _user.numOfCardsPlaced >= 1){ 
           _placePile.add(_user.hand.remove(i));
           _user.numOfCardsPlaced++;
         }
         
         else if ( chosenCard.playable(_placePile.peek()) && _user.numOfCardsPlaced == 0){
           System.out.println("action?:" + chosenCard.action);
           if (chosenCard.action != 0) { System.out.println("in action"); _user.giveAction(chosenCard); }
           _placePile.add(_user.hand.remove(i)); 
           _user.numOfCardsPlaced++;
         }
         
       }
     }
     
     if(_user.isInRangeOfEndButton()){
         if (_user.numOfCardsPlaced == 0){ _user.drawCard(); }
         _user.endTurn();
         _user.numOfCardsPlaced = 0;
     }
     
     if (_drawPile.isInRange())
        _user.drawCard();
       
  }
   
}

/***************************************************
  draw() - Loops 60 times each second
***************************************************/
public void draw(){
  //sets background
    background(#62B475);  
    //Group play() loop, goes to each player
    group.play();
    group.pass();
    /*
    //Nothing happens if buttonPressed, else do this
    if (buttonPressed) {
    } 
    else {
    //Start Screen
    // Show the button
    background(0);
      //Text to click on for playing
      fill(45, 139,206);
      rect(buttonX, buttonY, buttonW, buttonH);
      fill(0);
      String s = "Click right here to start the game! Have Fun :)";
      fill(255,255,255);
      textSize(28);
      text(s, buttonX+24, buttonY+buttonH-80, 380, 445);
      textSize(50);
      fill(255,204,0);
      
      //Text used to show instructions
      text("RE UNO!", buttonX+125, buttonY+60);
      s = "Rules:";
      textSize(22);
      fill(50, 55, 100);
      text(s, buttonX+18, buttonY+90);
      fill(0, 102, 153);
      
      s = "(1) This game is set up for one user player and 3 AI players.";
      textSize(11.5);
      fill(50);
      text(s, buttonX+16, buttonY+100, 380, 445);  // Text wraps within text box
      s = "(2) Each player is dealt 8 cards and the rest of the cards in the deck are in a face down draw pile.";
      
      text(s, buttonX+16, buttonY+120, 380, 445);  // Text wraps within text box
      s = "(3) Next to the draw pile is a face up place pile. The first card is drawn from the draw pile and then the game begins!";
      
      text(s, buttonX+16, buttonY+156, 380, 445);  // Text wraps within text box
      s = "(4) Each player places cards that match the top card in the place pile. To match, the cards must have the same number, color, or action symbol, and wild cards/wild4 cards can always be placed! For example: if the topmost card in the place pile is a yellow seven, then any yellow card or any card numbered \"7\" can be placed, as well as any wild or wild4 cards.";
      
      text(s, buttonX+16, buttonY+192, 380, 445);  // Text wraps within text box
      s = "(5) If a player has no playable cards, then they may either skip their turn (pressing the End Turn button), or draw a card (pressing the draw pile). If the player draws a card and it is not playable, then the player's turn is ended. If it is playable, the player may play the card.";
      
      text(s, buttonX+16, buttonY+297, 380, 445);  // Text wraps within text box
      s = "(6) If any player has only one card left in their hand, they must press the \"UNO!\" button within 45 seconds, or they will have to draw four cards.";
      
      text(s, buttonX+16, buttonY+368, 380, 445);  // Text wraps within text box
      s = "(7) When any player is left with no cards in their hand, they win!";
      
      text(s, buttonX+16, buttonY+421, 380, 445);  // Text wraps within text box
      s = "ENJOY OUR GAME!";
      
      textSize(26);
      text(s, buttonX+90, buttonY+462);
    }
    */
}