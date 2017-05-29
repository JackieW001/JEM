# JEM
### Jackie Woo, Edward Ro, Maggie Xia

# RE: UNO!
Welcome to RE: UNO!, a recreation of a game of UNO! using Processing and Java. This game of UNO! allows for one human player to play up against three non-human (AI) players. 

## The Gameflow of RE: UNO!
Here lies the instructions and flow of the game of RE: UNO!
1. Each player is initially delt 8 cards into their hand, and a card from the Draw pile is placed into the Place pile to start off the game. If the first card is a Wild 4 card or a Wild card, the program will draw another card from the Draw pile and place it onto the Place pile.
2. You, the human player, will place the first card.
  - This card must either match the number or the color of the first card on top of the place pile
  - Wild cards and Wild 4 cards can be placed on top of any numbered card, but can't be placed on top of Action cards (described further in Parts of RE: UNO! section below).
3. Next, the three AI players will take thier turns. The AI Player immediately to your left goes second.
4. If you have one card, an UNO! button will be displayed, and you must press the button as quickly as you can. This stimulates you shouting out UNO! in a real game of UNO!.
5. Rounds of UNO! will continue to be played until a player has no more cards. This player is the winner!
6. Good luck and have fun!
  
## Parts of RE: UNO!
The parts of this game reflect the parts of a real game of UNO! in real life. It includes:
1. A Draw Pile, which is automatically initialized to contain all 108 cards in a real UNO! deck and shuffled.
2. A Place Pile, which is where all cards of UNO! will be placed. Once the Draw Deck becomes empty, cards from the Place Pile will go into the Draw Deck and be shuffled.
3. A Player's hand, which include methods that allow a player to draw and place cards in their respective piles. All AI players' hands are displayed face down in the interface. Your pile will be displayed face up. Be sure to note that although you can see your hand, the other players can't.
4. An UNO! button, which appears when you, the human player, has only one card left. You must press the button as quickly as you can. This stimulates you shouting out UNO! in a real game of UNO!.

## Launch
Now that you have been given a run down of RE: UNO! all that's left now is to play!
** Make sure you have Processing installed! **
1. Open up a fresh terminal.
2. cd into the directory you would like to store a local copy of RE: UNO!
3. In the terminal, type `$ git clone git@github.com:JackieW001/JEM.git`
4. Within the same terminal, type '$ cd JEM/RE_UNO/`
5. Now run '$ processing Re_UNO.pde`
6. Have fun!
