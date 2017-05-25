/********* INSTANTIATE VARIABLES ********/
Deck DrawPile;
ArrayList<Card> PlacedPile;

Player player,AI1,AI2,AI3;
/****************************************/

public void setup(){
  size(1000, 650);
  
  DrawPile = new Deck();
  PlacedPile = new ArrayList<Card>();

  player = new UserPlayer();
  AI1 = new AIPlayer();
  AI2 = new AIPlayer();
  AI3 = new AIPlayer();
  
  System.out.println(DrawPile.toString());
  shuffle(DrawPile);
  
  for ( int i = 0; i < 8; i ++) {
    if ( DrawPile.removeCard(0) != null ) {
    player.drawCard(DrawPile.removeCard(0));
    AI1.drawCard(DrawPile.removeCard(0));
    AI2.drawCard(DrawPile.removeCard(0));
    AI3.drawCard(DrawPile.removeCard(0));
    }
    }
}

/**
* shuffle method
*/
  public void shuffle( Deck d ) {
     for ( int i = 0; i < d.size(); i++ ) {
        int rand = (int)( Math.random()*( i + 1 ) );
         Card temp = d.get(i);
         d.set(i, d.get(rand));
         d.set(rand, temp);
      }
  } 

public void draw(){
   background(#70C984);

 }