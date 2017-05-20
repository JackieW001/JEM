public class Card{
  
    int value;
    int c;
    int action;
    
    Card( int newVal, int newColor, int newAction){
       value = newVal;
       c = newColor;
       action = newAction;
    }
    
    public int getVal(){
       return value; 
    }
    
    public int getColor(){
       return c; 
    }
    
    public int getAction(){
       return action; 
    }
    
    // will only be used for setting the color of a wild card
    public void setColor( int newColor){
       c = newColor;
    }
    
}