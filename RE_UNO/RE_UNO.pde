
//Variables

DrawPile _drawPile;
PlacePile _placePile;
UserPlayer _user;
AIPlayer AI1,AI2,AI3;
Group group;


//Setups the interface

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

//Based on what the mouse clicked on, does a certain action
public void mouseClicked(){
  if (group.currentPlayer.equals(_user)){
    for (int i = 0; i < _user.hand.size(); i++){
      
      if(_user.hand.get(i).isMouseInRange()){
         Card chosenCard = _user.hand.remove(i);
         if ( _user.numOfCardsPlaced >= 1 && _placePile.peek().playableInCombo(chosenCard)){
           _placePile.add(chosenCard);
           _user.numOfCardsPlaced++;
           _user.noAction = false;
         }
         
         else if ( _user.numOfCardsPlaced == 0 && _placePile.peek().playable(chosenCard)){
           System.out.println("action?:" + chosenCard.action);
           if (chosenCard.action != 0) { System.out.println("in action"); _user.giveAction(chosenCard); }
           _placePile.add(chosenCard); 
           _user.numOfCardsPlaced++;
           _user.noAction = false;
         }
         
         else { 
          _user.hand.add(i, chosenCard); 
         }
       }
     }
     
     if(_user.isInRangeOfEndButton()){
         if (_user.noAction){ _user.drawCard(); }
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
}