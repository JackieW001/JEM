public class Card {
  
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
    int cardX,cardY;
    
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
    /********************************************************/
    
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
    
    public void display(int x, int y){
       cardX = x;
       cardY = y;
       image(cardImg, x, y);
    }
    
    public void display(int x, int y, String choice){
       if (choice.equals("faceDown")){
          cardImg = loadImage("./img/99_99_99.jpg");
          cardImg.resize(70,100);
          image(cardImg, x, y); 
       }
       image(cardImg, x, y);
    }
    
    public int getValue(){
       return value; 
    }
    
    public int getC(){
       return c; 
    }
    
    public void setC( int newC){
       c = newC; 
    }
    public int getAction(){
       return action; 
    }
    public void setColor(int x){
       c = x; 
    }
    
    /*****************************************************
    * Checks to see if mouse is in range of card
    ******************************************************/
    public boolean isMouseInRange(){
       if (mouseX > this.cardX && mouseX <  this.cardX + _user.space && 
           mouseY > this.cardY && mouseY < this.cardY + this.cardHeight){
             return true;
           }
       else {
          return false; 
       }
             
    }
    
    public boolean playable(Card card){
      
      // after you place a wild card, you can place another card
      if (card.getAction() == 4 || card.getAction() == 5){
         return true; 
      }
      
     // match color
     if (card.getC() == c){
       System.out.println("playable color");
       return true;
     }
     
     // match value
     if (action == 0 && card.getValue() == value){
       System.out.println("playable value");
       return true;
     }
     
     // match action
     if (card.getAction() != 0 && action != 0 && card.getAction() == action){
         System.out.println("playable action"); 
         return true;
     }
     
     // place wild card anytime
     if (card.getC() == 99 || c == 99){//wild cards
       System.out.println("playable wild");
       return true;
     }
     return false;
   }
   

   public boolean playableInCombo(Card card){
       if (card.getValue() == value){
          return true; 
       }
       return false;
   }
   
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
   
   public boolean isStarter(){
     if (this.getAction() == 99){
       return true;
     }
     else {
       return false;
     }
   }
   
}