/********* INSTANTIATE VARIABLES ********/
Deck DrawPile;
Card card;
ArrayList<Card> PlacedPile;

Player player,AI1,AI2,AI3;
/****************************************/

public void setup(){
  size(1000, 650);
  
  card = new Card (0,1,0);
  
  DrawPile = new Deck();
  PlacedPile = new ArrayList<Card>();

  player = new UserPlayer();
  AI1 = new AIPlayer();
  AI2 = new AIPlayer();
  AI3 = new AIPlayer();
  
  System.out.println(DrawPile.toString());
  shuffle(DrawPile);
  
  for (int i = 0; i < 10; i++)
    player.drawCard(new Card(99,0,4));

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
   background(#62B475);
   player.displayHand();
   //System.out.println("x, y: " + mouseX +","+ mouseY);
   if (mousePressed   && player.getHandSize()<36){
      player.drawCard(card); 
   }
   

 }