public class Group{
   
   Player currentPlayer;
   boolean isClockwise;
   
   Group(){
      currentPlayer = null;
      isClockwise = true;
   }
   
   public void setRoundRobin(){
      AI1.setNext(AI2); 
      AI1.setPrev(_user);
      
      AI2.setNext(AI3); 
      AI2.setPrev(AI1);
      
      AI3.setNext(_user); 
      AI3.setPrev(AI2);
      
      _user.setNext(AI1); 
      _user.setPrev(AI3);
      
      currentPlayer = _user;
      
   }
   
   public void pass(){
      if (keyPressed){
        if (key == 'p') // goes on to next player
          currentPlayer.endTurn();
        if (key == 'r') // reverses order
           isClockwise = !isClockwise; 
        
      }
      
   }
   public void play(){
       while (AI1.getHandSize() > 0 && AI2.getHandSize() > 0 && AI3.getHandSize() > 0 && _user.getHandSize() > 0){
          this.currentPlayer.play();
       }

   }
}