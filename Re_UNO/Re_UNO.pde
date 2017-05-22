/********* INSTANTIATE VARIABLES ********/
Deck DrawPile;
ArrayList<Card> PlacedPile;

Player player,AI1,AI2,AI3;
/****************************************/

public void setup(){
  size(1000, 650);
  
  DrawPile = new Deck();
  PlacedPile = new ArrayList<Card>();

  player = new Player();
  AI1 = new Player();
  AI2 = new Player();
  AI3 = new Player();
  
  shuffle(DrawPile);
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