public class Card{

    public static final int NOCOLOR = 0;
    public static final int RED = 1;
    public static final int YELLOW = 2;
    public static final int GREEN = 3;
    public static final int BLUE = 4;

    public static final int NOACTION = 0;
    public static final int SKIP = 1;
    public static final int REVERSE = 2;
    public static final int ADD2 = 3;
    public static final int WILD = 4;
    public static final int WILD4 = 5;

    /************************
      value between -1 - 9
      -1: no value (ie action card)
      0-9: numerical literals
    ************************/
    private int value;
    
    /*********************** 
       value between -1-3
       -1: no color
       0: red
       1: yellow
       2: green
       3: blue
    ************************/
    private int c;
    
    /*********************** 
       value between 0-5
       0: none (ie is a numerical card)
       1: reverse
       2: skip
       3: +2 (draw 2)
       4: wild
       5: wild4 (wild card and draw 4)
    ************************/
    private int action;

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
    public void setColor( int newColor ){
       c = newColor;
    }
    
    /**
      compareTo: Wild < Blue < Green < Red < Yellow 
    */
    public int compareTo( Card other){
        if (this.getC() < other.getC())
          return -1;
        else if (this.getC() > other.getC())
          return 1;
        else if (this.getC() == other.getC()){
           if (this.getValue() < other.getValue())
             return -1;
           else if (this.getValue() > other.getValue())
             return 1;
        }
        return 0; 
    }
    
    /**
     * Checks to see if the Card can be played
     * returns true if the colors or values match, or
     * if the actions match ( for action cards ).
     */
    public boolean isPlayable( Card card ) {
      if ( card.getC() == c ) {
         return true;
      }
      else if ( card.getValue() == value ) {
         return true;
      }
      else if ( card.getAction() == action && card.getAction() != 0 ) {
         return true;
      }
      else if ( card.getAction() == WILD || card.getAction() == WILD4){
         return true; 
      }
      else {
        return false;
      }
    }// close playable
    
    public String toString(){
       return "{ " + "value: " + value + ", color: " + c + ", action: " + action + "}" ;
    }
    
}