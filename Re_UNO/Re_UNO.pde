/********* INSTANTIATE VARIABLES ********/
Deck DrawPile;
<<<<<<< HEAD
Card card;
ArrayList<Card> PlacedPile;
=======
ArrayList<Card> PlacedPile; 
>>>>>>> f8e252232af81dab993c49c90477c492e1adaaec

Player player,AI1,AI2,AI3;
/****************************************/
//Starts up the game
public void setup(){
  size(1000, 650); //creates the size of the window
  
<<<<<<< HEAD
  card = new Card (0,1,0);
  
  DrawPile = new Deck();
  PlacedPile = new ArrayList<Card>();
=======
  DrawPile = new Deck(); //instantiates a new Deck
  PlacedPile = new ArrayList<Card>(); //instantiates an empty placedpile
>>>>>>> f8e252232af81dab993c49c90477c492e1adaaec

  //instantiates the player and AI
  player = new UserPlayer(); 
  AI1 = new AIPlayer();
  AI2 = new AIPlayer();
  AI3 = new AIPlayer();
  
<<<<<<< HEAD
  System.out.println(DrawPile.toString());
  shuffle(DrawPile);
  
  for (int i = 0; i < 10; i++)
    player.drawCard(new Card(99,0,4));

=======
  System.out.println(DrawPile.toString()); //depicts the deck
  shuffle(DrawPile); //shuffles the deck
  
  //gives each player their card
  for ( int i = 0; i < 8; i ++) {
    if ( DrawPile.removeCard(0) != null ) {
    player.drawCard(DrawPile.removeCard(0));
    AI1.drawCard(DrawPile.removeCard(0));
    AI2.drawCard(DrawPile.removeCard(0));
    AI3.drawCard(DrawPile.removeCard(0));
    }
    }
>>>>>>> f8e252232af81dab993c49c90477c492e1adaaec
}

/**
* shuffle method: mixes up the cards in the deck, randomizes the order
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