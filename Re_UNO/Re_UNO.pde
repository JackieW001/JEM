/********* INSTANTIATE VARIABLES ********/
Deck DrawPile;
Card card;
ArrayList<Card> PlacedPile;
Player player,AI1,AI2,AI3;
/****************************************/
//Starts up the game
public void setup(){
    size(1000, 650); //creates the size of the window
  
    card = new Card (0,1,0);
  
    DrawPile = new Deck(); //instantiates a new Deck
    PlacedPile = new ArrayList<Card>(); //instantiates an empty placedpile


    //instantiates the player and AI
    player = new UserPlayer(); 
    AI1 = new AIPlayer();
    AI2 = new AIPlayer();
    AI3 = new AIPlayer();
  
    System.out.println(DrawPile.toString());
    shuffle(DrawPile);
  


    System.out.println(DrawPile.toString()); //depicts the deck
    shuffle(DrawPile); //shuffles the deck
  
    //gives each player their card; initalize hand
    for ( int i = 0; i < 8; i ++) {
        if ( DrawPile.removeCard(0) != null ) {
      player.drawCard();
      AI1.drawCard();
      AI2.drawCard();
      AI3.drawCard();
        }
    }

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
}
   
public void mouseClicked() {
    player.drawCard();
}

