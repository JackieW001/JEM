import java.util.ArrayList;

public class Deck{

   ArrayList <Card> deck;
   
   public Deck(){
      deck = new ArrayList<Card>();
      
      int value = 0; //For only card types with number/0
      int col = 0; //4 types of colors (red(0), yellow(1), green(2), blue(3))
      int type = 0; //6 types of cards (number(0), reverse(1), skip(2), +2(3), wild(4), wild4(5))
      int TOTAL_NUM_OF_CARDS = 108;
      
      //Adds numbers 0-9
      for (int x = 0; x < 10; x++){
         for (int y = 0; y < 4; y++){
           deck.add(x, new Card( x, col, type));
           deck.add(x, new Card (x, col, type));
           col++;
         }
         col = 0;
      }
      
      // remove first 4 cards
      for (int i = 0; i < 4; i++){
         deck.remove(0); 
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

}