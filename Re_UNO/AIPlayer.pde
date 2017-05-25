public class AIPlayer extends Player{
   int difficulty;
   /*
   I'm thinking that we should create a tree for the AI, to specifically ask questions based on the scenario.
   Or even a priorityQueue, with a tree for each of it's objects, priority based on how much cards it has, making the AI
   even more complex, and more interesting
   Of course, the priorityqueue would probably not be used for the easier difficulties, but it seems like a fun idea, so
   I want your opinions on it. (Sorry for not coding it, I want to hear you guys out first).
   */
   
   public AIPlayer(){
       super();
   }
   
   boolean hasPlayable(){
     ArrayList<Card> temp = hand;
     for (int x = 0; x < temp.size(); x++){
        if (temp.get(x).isPlayable(PlacedPile.get(PlacedPile.size()-1)))
          return true;
     }
     return false;
   }
   
  
   
   void askItself(){
      if (hasPlayable()){
         
      }        
      else drawCard(DrawPile.remove());
   }
}