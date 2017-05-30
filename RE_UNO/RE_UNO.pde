DrawPile _drawPile;
PlacePile _placePile;
UserPlayer _user;
AIPlayer AI1,AI2,AI3;
Group group;

public void setup(){
    size(1000,700);
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
    }
}

public void mouseClicked(){
  for (int i = 0; i < _user.hand.size(); i++){
    if(_user.hand.get(i).isMouseInRange()){
       Card chosenCard = _user.hand.remove(i);
       if (_placePile.getCard(_placePile.getSize()-1).playable(chosenCard))
       _placePile.add(chosenCard);
     }
   }
   if(_user.isInRangeOfEndButton()){
       _user.endTurn();
   }
   if (_drawPile.isInRange())
      _user.drawCard();
      
   
}
   

public void draw(){
    delay(100);
    
    background(#62B475);
    _user.displayHand();
    _drawPile.displayPile();
    _placePile.displayPile();
    AI1.displayHand();
    AI2.displayHand();
    AI3.displayHand();
    
    fill(0);
    textSize(25);
    text(group.currentPlayer.name, 40,40);
    if (group.isClockwise)
      text("true", 60,60);
    else
       text("false", 60,60);
    _user.play();
    
    group.pass();
}
