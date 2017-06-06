
//Variables
DrawPile _drawPile;
PlacePile _placePile;
UserPlayer _user;
AIPlayer AI1,AI2,AI3;
Group group;
int buttonW, buttonH, buttonX, buttonY;
boolean buttonPressed;


//Setups the interface

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
    group.setRoundRobin();
    

    // init player hand
    for (int i = 0; i < 8; i++){
       _user.drawCard();
       AI1.drawCard();
       AI2.drawCard();
       AI3.drawCard();
       delay(500);
    }
}

//Based on what the mouse clicked on, does a certain action
public void mouseClicked(){
  if (mouseX > buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH)
      buttonPressed = true;
  if (group.currentPlayer.equals(_user)){
    for (int i = 0; i < _user.hand.size(); i++){
      if(_user.hand.get(i).isMouseInRange()){
         Card chosenCard = _user.hand.remove(i);
         if ( _user.numOfCardsPlaced >= 1 && chosenCard.playableInCombo(_placePile.peek())){
           _placePile.add(chosenCard);
           _user.numOfCardsPlaced++;
         }
         else if ( _user.numOfCardsPlaced == 0 && chosenCard.playable(_placePile.peek())){
           System.out.println("action?:" + chosenCard.action);
           if (chosenCard.action != 0) { System.out.println("in action"); _user.giveAction(chosenCard); }
           _placePile.add(chosenCard); 
           _user.numOfCardsPlaced++;
         }
         else { 
           /* DISPLAY SOME KIND OF ERROR MESSAGE */
         _user.hand.add(i, chosenCard); 
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

//Loop
public void draw(){
    background(#62B475);    
    group.play();
    group.pass();
    if (buttonPressed) {
    } else {
    // Show the button
    background(0);
      fill(45, 139,206);
      rect(buttonX, buttonY, buttonW, buttonH);
      fill(0);
      String s = "Click right here to start the game! Have Fun :)";
      fill(255,0,0);
      textSize(28);
      text(s, buttonX+24, buttonY+buttonH-80, 380, 445);
      textSize(50);
      fill(255,204,0);
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
}