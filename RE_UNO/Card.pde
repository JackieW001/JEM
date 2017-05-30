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
       0: no color
       1: red
       2: yellow
       3: green
       4: blue
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
    
    
    /********************************************************
     * displays card at x, y coordinate
     ********************************************************/
    public void display(int x, int y){
       cardX = x;
       cardY = y;
       image(cardImg, x, y);
    }
    
    /********************************************************
     * displays card at x, y coordinate face down
     ********************************************************/
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
    
    public int getAction(){
       return action; 
    }
    
    /********************************************************
     * determines if Mouse is in range of card
     * allows a specific card to be chosen
     ********************************************************/
    public boolean isMouseInRange(){
       if (mouseX > cardX && mouseX <  cardX + _user.space && 
           mouseY > cardY && mouseY < cardY + cardHeight){
             return true;
           }
       else {
          return false; 
       }
             
    }
}
