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
<<<<<<< HEAD
  for (int i = 0; i < _user.hand.size(); i++){
    if(_user.hand.get(i).isMouseInRange()){
       Card chosenCard = _user.hand.remove(i);
       if (_placePile.getCard(_placePile.getSize()-1).playable(chosenCard))
       _placePile.add(chosenCard);
       else { 
         /* DISPLAY SOME KIND OF ERROR MESSAGE */
       _user.hand.add(i, chosenCard); 
       }
     }
   }
   if(_user.isInRangeOfEndButton()){
       _user.endTurn();
   }
   if (_drawPile.isInRange())
      _user.drawCard();
      
=======
  if (group.currentPlayer.equals(_user)){
    for (int i = 0; i < _user.hand.size(); i++){
      if(_user.hand.get(i).isMouseInRange()){
         Card chosenCard = _user.hand.remove(i);
         if (_placePile.getCard(_placePile.getSize()-1).playable(chosenCard))
         _placePile.add(chosenCard);
         else { 
           /* DISPLAY SOME KIND OF ERROR MESSAGE */
         _user.hand.add(i, chosenCard); 
         }
       }
     }
     if(_user.isInRangeOfEndButton()){
         _user.endTurn();
     }
     if (_drawPile.isInRange())
        _user.drawCard();
       
  }
>>>>>>> 4f61dd615b6af0ea0cd27ca51cf3a1b29a918c8d
   
}
   
//Loop
public void draw(){
<<<<<<< HEAD
    delay(100);
    
=======
>>>>>>> 4f61dd615b6af0ea0cd27ca51cf3a1b29a918c8d
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
<<<<<<< HEAD
    group.play();
=======
    //_user.play();
    group.play();
    //group.pass();
>>>>>>> 4f61dd615b6af0ea0cd27ca51cf3a1b29a918c8d
}