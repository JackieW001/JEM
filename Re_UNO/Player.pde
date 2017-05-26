import java.util.ArrayList;

public class Player{
    String name;
    ArrayList<Card> hand; // max 35 cards
    Player _next;
    Player _prev;

    ArrayList<Card> hand;
    int handSize;
    //Player _next;
    //Player _prev;

     
    /******************* CONSTRUCTORS *****************/ 
    /**
     * Player constructor
     */ 
    public Player() {
       name = "Autobot";
       hand = new ArrayList<Card>(); 
       //_next = null;
       //_prev = null;
    }
    
    public Player(Player newNext, Player newPrev) {
       name = "Autobot";
       hand = new ArrayList<Card>(); 
       //_next = newNext;
       //_prev = newPrev;
    }
    
    /**
     * Player constructor with name
     */
    public Player( String s ) {
        name = s;
        hand = new ArrayList<Card>();  
        //_next = null;
        //_prev = null;
    }
    
    public Player( String s, Player newNext, Player newPrev ) {
        name = s;
        hand = new ArrayList<Card>(); 
        //_next = newNext;
        //_prev = newPrev;
    }
    /***********************************************************/
    
    public String getName() {
        return name;
    }
    
    public ArrayList<Card> getHand() {
        return hand;
    }
    
    public int getHandSize(){
       return hand.size(); 
    }
    
/*   public Player getNext() {
      return _next;
    }
    
    public Player getPrev() {
      return _prev;
    }
    
    public void setNext( Player p ) {
      _next = p;
    }
    
    public void setPrev( Player p ) {
      _prev = p;
    }

    
    public void displayHand(){
     
     // spacing between cards
     int space = 70; //= (width-200)/getHandSize();
      if (getHandSize() > 16)
          space = 25;
       else if (getHandSize() > 8)
          space = 50;
          
     // position of left most card
     int offset = (width/2) - (space*((getHandSize() - 1)/2)) - 30;
     
     //System.out.println("offset: " +offset);
     //System.out.println("display width: " + width);
     //System.out.println("hand Size: "+ getHandSize());
     
     
     for (int i = 0; i < hand.size(); i++){
        hand.get(i).display(offset, height-hand.get(i).cardHeight-20);
        offset += space; 
     }
     
   }
   
=======
*/    

    /**
     * Add a card to the player's hand
     */
    public void drawCard( Card card ) {
      // hand.add(DrawPile.removeCard());
        hand.add(card);
    }
    
    /**
     * playCard(Card): Choose a card to play.
     * for AI players (Simple)
     */
    public void playCard( Card placedCard ) {
        
        // For AI default: play the first playable card we can find
        for ( Card c : hand ) {
            if (c.isPlayable(placedCard)) {
                PlacedPile.add(c);
                hand.remove(c);
            }
            
        }        
        // if no playable card endTurn
        
    }
   
    /**
     * autoSort(): sort hand using heap sort
     */
     public void autoSort(){
        for (int x = hand.size() / 2 - 1; x >= 0; x -= 1)
            heapify(hand, hand.size(), x);
 
        for (int x = hand.size() - 1; x >= 0; x -= 1){
            Card temp = hand.get(0);
            hand.set(0, hand.get(x));
            hand.set(x, temp);
 
            heapify(hand, x, 0);
        }
     }// close autoSort
     
     /**
     * heapify (ArrayList, int, int): autoSort helper method
     */
     private void heapify(ArrayList<Card> arr, int a, int b){
        int largest = b;
        int l = 2 * b + 1;  //left
        int r = 2 * b + 2;  //right
        
        if (l < a && arr.get(l).compareTo(arr.get(largest)) > 0 )
            largest = l;
 
        if (r < a && arr.get(r).compareTo(arr.get(largest)) > 0)
            largest = r;
 
        if (largest != b){
            Card swap = arr.get(b);
            arr.set(b, arr.get(largest));
            arr.set(largest, swap);
 
            heapify(arr, a, largest);
        }
     }// close heapify
     
/*     int receiveAction( Card c ) {
       int x = c.getAction();
       if ( x == 0 ) {//noAction
         return 0;
       }
       if ( x == 1 ) {//skip
         Player temp = _next.getNext().getNext();
         _next = temp;
         return 0;
       }
       if ( x == 2 ) {//reverse
       Player temp1 = _prev;
       Player temp2 = _next;
       setNext( temp1 );
       setPrev( temp2 );
       return 0;
       }
       if ( x ==3 ) {//add2
         drawCard(new Card(0,0,0));
         return 2;
       }
       if ( x == 4 ) {//wild
       return 0;
       }
       if ( x == 5 ){ //wild4
       return 4;
       }
       
       return 0;
     }
     */
}