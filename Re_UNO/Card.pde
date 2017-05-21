public class Card{

    public static final int NOCOLOR = 0;
    public static final int RED = 1;
    public static final int YELLOW = 2;
    public static final int GREEN = 3;
    public static final int BLUE = 4;

    public static final String[] COLORS = { "Wild", "Blue", "Green",
					    "Red", "Yellow" };

    public static final int NOACTION = 0;
    public static final int SKIP = 1;
    public static final int REVERSE = 2;
    public static final int ADD2 = 3;
    public static final int WILD = 4;
    public static final int WILD4 = 5;

    public static final String[] ACTIONS = { "", "Skip", "Reverse",
					     "Add2", "Wild", "Wild4" };
    int value;
    int c;
    int action;

    /**
     * Card Constructor
     */
    public Card( int newVal, int newColor, int newAction){
       value = newVal;
       c = newColor;
       action = newAction;
    }
    
    public int getValue(){
       return value; 
    }
    
    public int getC(){
       return c; 
    }
    
    public int getAction(){
       return action; 
    }
    
    // will only be used for setting the color of a wild card
    public void setColor( int newColor){
       c = newColor;
    }
    
    /**
     * Checks to see if the Card can be played
     * returns true if the colors or values match, or
     * if the actions match ( for action cards ).
     */
    public boolean playable( Card card ) {
	if ( card.c == c ) {
	    return true;
	}
	else if ( card.value == value ) {
	    return true;
	}
	else if ( card.action == action && card.action != 0 ) {
	    return true;
	}
	else {
	    return false;
	}
    }
    
}
