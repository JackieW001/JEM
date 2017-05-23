public class ChoiceNode{
  /*
  Each int represents an action:
  0: Draw card
  1: Play Number (And combos)
  2: Play Skip
  3: Play Reverse
  4: Play +2
  5: Play +4 (Wild)
  6: WildCard
  */
  ArrayPriorityQueue choices;
  
  public ChoiceNode(){
     choices = new ArrayPriorityQueue(); 
  }
}