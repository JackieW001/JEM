import java.util.ArrayList;

public class Player{
    private String name;
    private ArrayList<Card> hand;
        
    /**
     * Player constructor
     */
    public Player( String s ) {
        name = s;
        hand = new ArrayList<Card>();            
    }

    public String getName() {
        return name;
    }
    
    public ArrayList<Card> getHand() {
        return hand;
    }
    
    /**
     * Add a card to the player's hand
     */
    public void draw( Card card ) {
        hand.add(card);
    }
    
    /**
     * Choose a card to play.
     * for AI players
     */
    public Card playCard( Card placedCard ) {
        
        // play the first playable card we can find
        for ( Card c : hand ) {
            if (c.playable(placedCard)) {
                hand.remove(c);
                return c;
            }
        }        
        // no playable card
        return null;//skip turn
        
    }
   
  
 /****** ADD COMPARE TO ****************
    /**
     * autoSort hand using heap sort
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
     }
    private void heapify(ArrayList<Card> arr, int a, int b){
        int largest = b;
        int l = 2 * b + 1;  //left
        int r = 2 * b + 2;  //right
 
        if (l < a && arr.get(l) > arr.get(largest))
            largest = l;
 
        if (r < a && arr.get(r) > arr.get(largest))
            largest = r;
 
        if (largest != b){
            Card swap = arr.get(b);
            arr.set(b, arr.get(largest));
            arr.set(largest, swap);
 
            heapify(arr, a, largest);
        }
    }
*******************************************/    
}