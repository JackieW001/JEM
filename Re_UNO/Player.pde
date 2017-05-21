import java.util.ArrayList;

public class Player
{
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
    
}
