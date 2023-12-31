# **BATTLE OF WINGS**
#### Video Demo:  <URL HERE>
#### Description:

Battle of wings is an strategy two player game, which each one will play as two clans of birds, the owls and the ravens, sworn enemys on a quest to destroy each other by finding the other's nest to defeat them.

The game is played on a 7x7 grid, and the first step of the game is to set up your teams pieces at the board, including your nest and each one of the 10 pairs of pieces each teams have. Once they are all settled down on the board, the other team must do the same thing, without knowing the location of the enemy pieces. They will be all hidden until the battles are made. Let's dive in what each piece is.

The first one are the number pieces, they are pretty straight foward, each team have a pair of 2s, 3s, 4s, 5s, 6s, and 7s. Each one have an value and can only destroy other numbers of less value. For example, a 5 piece can destroy the 4s, 3s, and 2s, but dies for the 6s and 7s, if they find other 5, they both are destroyed. All numbers loses for all letter pieces, except for the A piece, that loses to all numbers.

We have four pairs of letter pieces. They are the Ks, Qs, Js and As, each one with special properties. First, the As wins against all the other letter pieces. If they battle against another As, they both die. Besides that, each letter wins against all other pieces if attacking them, and if any number attack them, the numbers looses (besides the As).

So to sum up, here is a table of who wins each battle, the table header represents the defending piece and the first column represents the attacking piece, if the attacking pieces loses, I'll signal with a L, if it wins, a W, and if there's a draw (and both pieces die), a D:

| X | **A** | **K** | **Q** | **J** | **7** | **6** | **5** | **4** | **3** | **2** |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| **A** | D | W | W | W | L | L | L | L | L | L | 
| **K** | L | W | W | W | W | W | W | W | W | W |
| **Q** | L | W | W | W | W | W | W | W | W | W |
| **J** | L | W | W | W | W | W | W | W | W | W |
| **7** | W | L | L | L | D | W | W | W | W | W |
| **6** | W | L | L | L | L | D | W | W | W | W |
| **5** | W | L | L | L | L | L | D | W | W | W |
| **4** | W | L | L | L | L | L | L | D | W | W |
| **3** | W | L | L | L | L | L | L | L | D | W |
| **2** | W | L | L | L | L | L | L | L | L | D |

Even though some pieces are weak against the majority of others, it's important to understand that they can still be helpful. All the pieces starts hidden from the other player, and are only revealed if they have entered a battle. So they can be used to reveal some of the other teams pieces or maybe to bluff the location of your teams nest.

Every peace, if not revealed can move to any adjacent square on the board (like a king in chess), but cannot jump across any other piece (with the exception of the K piece). The letter pieces can move more squares ahead. The J pieces moves like the rook, on the columns and rows. The Q pieces can move like the queen, diagonal squares, columns and rows. And the K pieces can move on the diagonals (like the bishop) and on L moves (like the chess knights, including jumping over other pieces).

So that's the rules of the game. Now lets dive in the program:

The game is divided in two phases. The set up phase and de game phase. First the ravens player must position each piece according to his strategy. All available squares are signilized with a gray circle. To do that, the player must click with the right mouse button on the piece and then click on an available square. After all is done, the game will automatically hide all his pieces and the other player must be called to position his pieces, out of the first player sight. After all is set and done, the game hide all the pieces and the second phase starts.

To start moving your pieces, each player must press space to reveal his team pieces, then click the intended piece to move and next click on the available square to move or battle against other piece. After the choice is made, all the pieces are hidden again, except for the ones that were previously engaged in a battle.

I have implemented on the bottom of the game some texts to track the players turns, with R for the Red ravens and B for the blue Owls. Once any player battle the other teams nest, the game is over and the attacker wins.

The program contains a folder with all the art work, created by my brother Cássio Carvalho, called images, and three lua files. The conf, with configurations for the game window, helpers with some fuctions to auxiliate the main code on main.lua, which have all the rest of the code for the game. Since the game is a turn based game, i've tried to minimize the checkings thar are made on the love update fuction, to light up the game.

That's it, the mvp of our game. Me and my brothers hope that you all have fun playing.





