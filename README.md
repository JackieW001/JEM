# JEM
### Jackie Woo, Edward Ro, Maggie Xia

# RE: UNO!
Welcome to RE: UNO!, a recreation of a game of UNO! using Processing and Java. This game of UNO! allows for one human player to play up against three non-human (AI) players. 
Forewarning: As this utilizes many rotations and translations to display the AI player hands, starting up this game takes a bit. We would really appreciate if you would be willing to wait a few seconds for it to load!

## The Gameflow of RE: UNO!
Here lies the instructions and flow of the game of RE: UNO!
1. Each player is initially delt 8 cards into their hand, and a card from the Draw pile is placed into the Place pile to start off the game. If the first card is a Wild 4 card or a Wild card, the program will draw another card from the Draw pile and place it onto the Place pile.
2. You, the human player, will place the first card.
  - This card must either match the number or the color of the first card on top of the place pile
  - Wild cards and Wild 4 cards can be placed on top of any numbered card, but can't be placed on top of Action cards. After you, the human player, plays a wild card, you can place another card down. However, if you place a Wild 4 card down, you automatically end your turn and the next player draws four cards.
  - Combos:
      - combos of action cards or placing more than one action card is not allowed
      - numerical card combos are permitted. You can continue placing same numbered cards of different colors on top of each other.
3. Once you have exhausted all of your moves, click the end turn button.
4. Next, the three AI players will take their turns. The AI Player immediately to your left goes second if the play is going clockwise (defaulted). The AI Player immediately to your right goes second if the play is going counterclockwise (if you have placed a reverse card).
5. Rounds of UNO! will continue to be played until a player has no more cards. This player is the winner!
6. Good luck and have fun!
  
## Parts of RE: UNO!
The parts of this game reflect the parts of a real game of UNO! in real life. It includes:
1. A Draw Pile, which is automatically initialized to contain all 108 cards in a real UNO! deck and shuffled.
2. A Place Pile, which is where all cards of UNO! will be placed. Once the Draw Deck becomes empty, cards from the Place Pile will go into the Draw Deck and be shuffled.
3. A Player's hand, which include methods that allow a player to draw and place cards in their respective piles. All AI players' hands are displayed face down in the interface. Your pile will be displayed face up. Be sure to note that although you can see your hand, the other players can't.

## Launch
Now that you have been given a run down of RE: UNO! all that's left now is to play!
** Make sure you have Processing installed! **
1. Open up a fresh terminal.
2. cd into the directory you would like to store a local copy of RE: UNO!
3. In the terminal, type `$ git clone git@github.com:JackieW001/JEM.git`
4. Within the same terminal, type `$ cd JEM/RE_UNO/`
5. Now run `$ processing Re_UNO.pde`
6. Have fun!
