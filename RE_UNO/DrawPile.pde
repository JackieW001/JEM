public class DrawPile{
  
  //Variables
   ArrayList<Card> pile; 
   PImage cardImg;
   int cardImgHeight, cardImgWidth;
   
   /***************** CONSTRUCTOR *************************/
   DrawPile(){
      populatePile(); 
      shuffle();
      cardImg = loadImage("./img/99_99_99.jpg");
      cardImg.resize(65,95);
      cardImgHeight = cardImg.height;
      cardImgWidth = cardImg.width;
      
   }
   /********************************************************/
      
   /********************************************************
   * Displays DrawPile
   ********************************************************/
   public void displayPile(){
       if (pile.size() > 0 ) {image(cardImg, 300, height/2 - cardImgHeight/2 -10);}
       else { 
         fill(#62B475);
         strokeWeight(4);
         stroke(255, 150);
         rect( 300, height/2 - cardImgHeight/2, cardImgWidth, cardImgHeight,7);
       }
   }
   
   public int getSize(){
     return pile.size();
   }
   
   public Card getCard(int i){
     return pile.get(i);
   }
   
   /*****************************************************
    * Add a card to the draw pile
    ******************************************************/
   private void populatePile(){
       pile = new ArrayList<Card>();
     
     /*108 total cards in a deck, four different colors.
        Number cards 0-9, each number has two cards of the same color, except 0.
        Action cards, each action card also has a pair for each color, except wild cards and wild4s.
      */
      int col = 1; //5 types of colors (wild/nocolor(0), red(1), yellow(2), green(3), blue(4))      
      
      //Adds numbers 0-9
      for (int x = 0; x < 10; x++){
         for (int y = 0; y < 4; y++){
           pile.add(new Card (x, col, 0)); 
           pile.add(new Card (x, col, 0));
           col++;
         }
         col = 1;
      }
      
      // remove first 4 cards (specifically the extra zeroes)
      for (int i = 0; i < 4; i++){
         pile.remove(i); //removes only one of the zeros for each color)
      }
      
      //Adds the action cards (number(0), skip(1), reverse(2), +2(3), wild(4), wild4(5))
      
      //Adds the skip, reverse, and +2 variations
      for (int c = 1; c < 5; c++){ //Goes through the four different colors for each card
        for (int t = 1; t < 4; t++){  //Goes through three different types (skip, reverse, 2+) for each color
        //Adds a pair of action cards
         pile.add(new Card(99, c, t)); 
         pile.add(new Card(99, c, t));
        }
      }
      
      //Adds the wild and wild4 action cards
      for (int w = 0; w < 4; w++){ //Adds four of each
         pile.add(new Card(99, 99, 4)); //Adds the wild
         pile.add(new Card(99, 99, 5)); //Adds the wild+4 
      } 
   }
   
   /*****************************************************
   * Shuffles deck
   ******************************************************/
   private void shuffle(){
      for ( int i = 0; i < pile.size(); i++ ) {
        int rand = (int)( Math.random()*( i + 1 ) );
         Card temp = pile.get(i);
         pile.set(i, pile.get(rand));
         pile.set(rand, temp);
      }
   }
   
   /*****************************************************
   * Removes last card in pile (like a stack)
   ******************************************************/
   public Card removeCard(){
      if (pile.size() > 0){
         return pile.remove(pile.size()-1);
       }
      text("No more cards", width/2-70, height/2-50);
      noLoop();
      return null;
      
   }
   
   /*****************************************************
   * Checks to see if mouse is in range of draw pile
   ******************************************************/
   public boolean isInRange(){
       if ( mouseX > 300 && mouseX < 300 + cardImgWidth &&
            mouseY > height/2 - cardImgHeight/2 && mouseY < height/2 - cardImgHeight/2 + cardImgHeight){
               return true; 
            }
            
        return false;
   }
      
      
   //addCard(Card card) - used to add the param (card) at the top of the pile   
   public void addCard(Card card){
     pile.add(0, card);
   }
  
}