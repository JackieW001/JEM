public class Re_UNO {

    private Deck DrawPile;
    private ArrayList<Card> PlacedPile = { };

    private Player player;
    private Player AI1;
    private Player AI2;
    private Player AI3;

    public Re_UNO() {
    }

    /**
     * shuffle method
     */
    public void shuffle( Deck d ) {
        for ( int i = 0; i < d.length; i++ ) {
            int rand = (int)( Math.random()*( i + 1 ) );
            Card temp = d[i];
            deck[i] = d[rand];
            deck[rand] = temp;
        }
    }


    
}//end class Re_UNO
