//AI class

public class AIPlayer extends Player{
   int difficulty;
   /*
   I'm thinking that we should create a tree for the AI, to specifically ask questions based on the scenario.
   Or even a priorityQueue, with a tree for each of it's objects, priority based on how much cards it has, making the AI
   even more complex, and more interesting
   Of course, the priorityqueue would probably not be used for the easier difficulties, but it seems like a fun idea, so
   I want your opinions on it. (Sorry for not coding it, I want to hear you guys out first).
   */
   
   //Constructor
   public AIPlayer(){
       super();
   }
   
   //Checks if the AI has any playable cards to begin with
   boolean hasPlayable(){
     ArrayList<Card> temp = hand;
     for (int x = 0; x < temp.size(); x++){
        if (temp.get(x).isPlayable(PlacedPile.get(PlacedPile.size()-1)))
          return true;
     }
     return false;
   }
   
  
/*
method used as a way for the AI to "ask itself"
Returns an int that represents a different card being placed.
0: Places a number
1: Places a reverse
2: Places a skip
3: Places a +2
4: Places a +4
5: Places a wild
6: Draws a card (nothing)
*/
   int askItself(){
      if (hasPlayable()){
        if (hand.size() == 1){
            return 1;
        }
      }        
      return 6;
   }
   
   //Helper method
   void play(){
       playCard(askItself()); 
   }
   
   //plays based on decision made in askItself()
   void playCard(int x){
       if (x == 6){
         drawCard(DrawPile.remove());
         return;
       }
       else if (x == 5){
         
       }
       else if (x == 4){
         
       }
       else if (x == 3){
         
       }
       else if (x == 2){
         
       }
       else if (x == 1){
         
       }
       else if (x == 0){
         
       }
   }
   
}