import java.util.ArrayList;

public class Deck{

   ArrayList <Card> deck;
   
   public Deck(){
      deck = new ArrayList<Card>();
      
      /*108 total cards in a deck, four different colors.
        Number cards 0-9, each number has two cards of the same color, except 0.
        Action cards, each action card also has a pair for each color, except wild cards and wild4s.
      */
      int col = 1; //5 types of colors (wild/nocolor(0), red(1), yellow(2), green(3), blue(4))
      int type = 0; //6 types of cards (number(0), skip(1), reverse(2), +2(3), wild(4), wild4(5))     
      
      //Adds numbers 0-9
      for (int x = 0; x < 10; x++){
         for (int y = 0; y < 4; y++){
           deck.add(new Card (x, col, type)); 
           deck.add(new Card (x, col, type));
           col++;
         }
         col = 1;
      }
      
      // remove first 4 cards (specifically the extra zeroes)
      for (int i = 0; i < 4; i++){
         deck.remove(i); //removes only one of the zeros for each color)
      }
      
      //Adds the action cards
      
      //Adds the skip, reverse, and +2 variations
      for (int c = 1; c < 5; c++){ //Goes through the four different colors for each card
        for (int t = 1; t < 4; t++){  //Goes through three different types (skip, reverse, 2+) for each color
        //Adds a pair of action cards
         deck.add(new Card(99, c, t)); 
         deck.add(new Card(99, c, t));
        }
      }

      //Adds the wild and wild4 action cards
      for (int w = 0; w < 4; w++){ //Adds four of each
         deck.add(new Card(99, 0, 4)); //Adds the wild
         deck.add(new Card(99, 0, 5)); //Adds the wild+4 
      }
   }
   
   public Card get( int i ){
     return deck.get(i);
   }
   
   public void set (int i, Card c){
     deck.set(i, c);
   }
   
   public int size(){
     return deck.size();
   }
   
   public String toString(){
     return deck.toString();
   }

}