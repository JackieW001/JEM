public class Card {
  
  //Final Variables
  //Represents the colors/actions it can be
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
      value between 0 - 9, 99
      99: no value (ie action card)
      0-9: numerical literals
    ************************/
    private int value;
    
    /*********************** 
       value between -1-3
       99: no color (wild)
       1: red
       2: yellow
       3: green
       4: blue
    ************************/
    private int c;
    
    /*********************** 
       value between 0-5
       99: none (ie is a numerical card)
       1: reverse
       2: skip
       3: +2 (draw 2)
       4: wild
       5: wild4 (wild card and draw 4)
    ************************/
    private int action;
    
    // cardImage to load and display
    PImage cardImg;
    int cardHeight;
    int cardWidth;
    int cardX = 0;
    int cardY = 0;
    
    /***************** CONSTRUCTOR *************************/
    Card(int newVal, int newColor, int newAction){
        value = newVal;
        c = newColor;
        action = newAction;
        
        //get path to card image located in img folder
        String fileName = "./img/" + value + "_" + c + "_" + action + ".jpg";
        
        // load card image and resize
        cardImg = loadImage(fileName);
        cardImg.resize(60,90);
        cardHeight = cardImg.height;
        cardWidth = cardImg.width;
    }
    /****************************
    toString() - returns each
    card's information
    ****************************/
    
    public String toString(){
      int colour = getC();
      int value = getValue();
      
      String colorValue = "";
      String cardValue = "";
      if (colour == 1){
        colorValue = "Red";
      }else if (colour == 2){
        colorValue = "Yellow";
      }else if (colour == 3){
        colorValue = "Green";
      }else if (colour == 4){
        colorValue = "Blue";
      }else{
        colorValue = "Wild";
      }
      if (value == 99){
        cardValue = "Action";
      }else{
        cardValue = "" + value;
      }
      return colorValue + " " + cardValue;
    }
    
    //Displays the card at the x/y value
    public void display(int x, int y){
       cardX = x;
       cardY = y;
       image(cardImg, x, y);
    }
    
    //Displays the card at the x/y value face up or down
    public void display(int x, int y, String choice){
       if (choice.equals("faceDown")){
          cardImg = loadImage("./img/99_99_99.jpg");
          cardImg.resize(70,100);
          image(cardImg, x, y); 
       }
       image(cardImg, x, y);
    }
    
    //Accessor Methods
    public int getValue(){
       return value; 
    }
    public int getC(){
       return c; 
    }  
    public int getAction(){
       return action; 
    }
    
    //Mutator Methods
    public void setColor(int x){
       c = x; 
    }
    
    /*****************************************************
    * Checks to see if mouse is in range of card
    ******************************************************/
    public boolean isMouseInRange(){
       if (mouseX > this.cardX && mouseX <  this.cardX + _user.space && 
           mouseY > this.cardY ){
             return true;
           }
       else {
          return false; 
       }
             
    }
    
    // only called when you place first card
    public boolean playable(Card card){
     // variable card should always _placePile.peek()
      
     // match color
     if (card.getC() == this.c){
       System.out.println("playable color");
       return true;
     }
     
     // match value
     else if (this.action == 0 && card.getAction() == 0 && card.getValue() == this.value){
       System.out.println("playable value");
       return true;
     }
     
     // match action
     else if (this.action != 0 && card.getAction() != 0 && card.getAction() == this.action){
         System.out.println("playable action"); 
         return true;
     }
     
     // place wild card anytime 
     else if ( this.action == 4 || this.action == 5 ){//wild cards
       System.out.println("playable wild");
       return true;
     }
     
     // if there wild or wild4 card on top of place pile, can place any numerical card
     if ( this.action == 0 && (card.getAction() == 4 || card.getAction() == 5) ){
        System.out.println("wild card place pile can place number card");
        return true; 
     }

     return false;
   }
   
   /*********************************
   playableInCombo() - method to check
   if the card placed can also be
   placed with a combo 
   *********************************/
   
   public boolean playableInCombo(Card card){
      // card should always be _placePile.peek()
      
      // match value
      if (card.getAction() == 0 && card.getValue() == this.value){
         return true; 
      }
      
      // after you place a wild card, you can place another card
      if ( (card.getAction() == 4 || card.getAction() == 5) && this.action == 0){
         return true; 
      }
      
      return false;
   }
   
   /*******************************
   compareTo(Card other) - compares
   this() card with other, returns int
   that is used in UserPlayer class
   for heapifying/sorting their hand
   *******************************/
   
   public int compareTo( Card other){
       if (this.getValue() < other.getValue()){
          return -1; 
       }
       if (this.getValue() > other.getValue()){
          return 1; 
       }
       if (this.getValue() == other.getValue()){
           if (this.getC() < other.getC()){
              return -1; 
           }
           if (this.getC() > other.getC()){
              return 1;
           }
           if (this.getC() == other.getC()){
              if (this.getAction() < other.getAction()){
                 return -1; 
              }
              if (this.getAction() > other.getAction()){
                 return 1; 
              }
              if (this.getAction() == other.getAction()){
                return 0;
              }
           }
       }
       return 0;
   } // compareTo
   
   /*****************************************
     isStarter() - Checks if the card can be 
     the starting card (for _placePile, we 
     want only the first card to be number 
     cards, no action cards).
   *****************************************/
   public boolean isStarter(){
     if (this.getAction() == 0){
       return true;
     }
     else {
       return false;
     }
   }
   
}