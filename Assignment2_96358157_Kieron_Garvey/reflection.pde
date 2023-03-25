/* Reflection
Student Name: Kieron Garvey
Student#: 96358157

Link to your development Blog on Blogger:                
    https://hdcs2023.blogspot.com/

Link to Video on YouTube:
    https://youtu.be/qrkTPw8dB_0

Part A - Mark (11 /11)
=========================
Includsion of completed:
- Readme             (1)
- Reflection        (4)
- Video                (4)
- Blog                (2)

These are all created to spec, so I am awarding myself 11 marks.


Part B - Mark (4 /4)
=========================
- Comments, 
- Indentation, 
- Naming, 
- Structure of code.

<just a mark needed here>

Part C - Mark (5 /5)
=========================
Use of standard programming control constructs 
(if, loop, nesting):

* if statements (1)

[Assignment2_96358157_Kieron_Garvey]line 167 to 190 is an example of a nested if. It calidates the distance between the two players and depening on that distance it allows the players to shoot or changes the background.
[Assignment2_96358157_Kieron_Garvey]line 719 is an IF to validate the gameState. The if Contains a nested CASE Statement
[Assignment2_96358157_Kieron_Garvey]line 592 to 600 is an example of a nested if used for the Health Bar. It changes the color of Player1's health bar based on there reamining health
[Assignment2_96358157_Kieron_Garvey]line 788 to 797 is a nested if which allows the player to shoot in different scenarios

* Loops

FOR loops used on: (1)
[Assignment2_96358157_Kieron_Garvey]line 187 to 189 is a for loop used to enable the player to shoot
[Assignment2_96358157_Kieron_Garvey]line 222 to 229 is a for loop used to update the invaders bullets

While loop (1)
[Assignment2_96358157_Kieron_Garvey]line 662 to 666 is a while loop used to create the invader bullets
[player] line 59 to 68 is used the set the player gradient

NESTED loops used on: (2) 
[Assignment2_96358157_Kieron_Garvey]line 249 to 258 is a nested loop used for updating player bullets
[Assignment2_96358157_Kieron_Garvey]line 275 to 290 is a nested loop used for collision dection between the Invaders and the Bullets. It contains four for loops .
[Assignment2_96358157_Kieron_Garvey]line 297 to 308 is a nested loop checking i finvader bullet hits player 
[Assignment2_96358157_Kieron_Garvey]line 314 to 327 is another example of a nested for loop. It is used for the collision detection between the player and invader.

I have multiple examples of nesting, if statements and loops so 5/5 *


============================
*****      Part D      *****
============================

Part D1 - Mark (10 /10)
=========================
- My game demonstrates use collision detection between multiple objects, 
- Scoring, Number of Kills, Number Bulletes Fired and Player Health are all overlaid for two players
- The game resets correctly to play a new game.
- The Game has a high score board.
- The game contains a font.
- The Game contains images for some of the larger words used to make them stand out.
- Both players can shoot multiple objects 
- Invaders can shot multiple objects
 
Therefore I score 10/10

Part D2 - Mark (10 /10)
=========================
I have a key handler set up between 
[Assignment2_96358157_Kieron_Garvey]lines 714 to 826
for ingame play it handles: 

Player1 (3)
- left A(keyCode 65)   - [Assignment2_96358157_Kieron_Garvey]line 743(keyPressed()) & 805(keyReleased()) 
- right D(keyCode 68)  - [Assignment2_96358157_Kieron_Garvey]line 740(keyPressed()) & 802(keyReleased()) 
- shoot W(keyCode 87)  - [Assignment2_96358157_Kieron_Garvey]line 746(keyPressed()) & 808(keyReleased()) 

Player2 (3)
- left LEFT    - [Assignment2_96358157_Kieron_Garvey]line 759(keyPressed()) & 782(keyReleased()) 
- right RIGHT  - [Assignment2_96358157_Kieron_Garvey]line 762(keyPressed()) & 779(keyReleased()) 
- shoot UP    - [Assignment2_96358157_Kieron_Garvey]line 752(keyPressed()) & 785(keyReleased()) 

Additional keys include (4)
- ENTER used to start teh game. - [Assignment2_96358157_Kieron_Garvey]line 721(keyPressed())
- If gameState = "HIGH_SCORE" the player can enter up to 6 characters for the highscore board.
- If BACKSPACE used when gameState = "HIGH_SCORE" it reduces the size of the string containing the player name. this allows the user to make mistakes. 

I have working key handler for two player, also allowed player to use the keyboard to enter the name for the score board, and an uses the BACKSPACE to remove characters for a string. Therefore I am awarding 10/10


Part D3 - Mark (10 /10)
=========================
Collision detection BESPOKE METHODS defined in main program file:

- checkInvaderLeavesScreen() on [Assignment2_96358157_Kieron_Garvey]line 829 used for edge conditions of Invader. Called on line 338

- collisionInvaderBullet() on [Assignment2_96358157_Kieron_Garvey]line 868 to  detect collision between Invader and Bullet. Called on line 279

- collisionPlayerBullet() on [Assignment2_96358157_Kieron_Garvey]line 901 to detect collision between Player and Bullet. Called on line 299

- collisionPlayerInvader() on [Assignment2_96358157_Kieron_Garvey]line 932 to to detect collision between Player and Invader. Called on line 317

I used arrays for all my objects with both player bullets and invaders being 2D arrays
I have used the advaced Pythagorus collision detection between multiple objects.I used the method from the pong game and also added second one 
I am checking edge conditions for both Players and Invaders, and I am scoring myself 10/10


============================
Part E USER DEFINED CLASSES
============================
Part E1 - Mark (10 /10)
=========================
Excluding the main program, I have 6 classes defined in their own files/tabs:

1- Player
2- Bullet
3- Invader
4- Scenery
5- Text
6- Timer

Each of these user-defined classes has appropriate fields, constructors, getters, setters. These are highlighted as follows:

1.Player CLASS
  Fields begin line: 10
  Default Constructors begin line: 21
  OVERLOADED Constructors begin line: 25
  Getters begin line:  285
  Setters begin line: 194
  Bespoke methods begin line: 43, 87, 113, 140, 152, 160, 165, 171, 177, 185

2.Bullet CLASS
  Fields begin line: 10
  Default Constructors begin line: 17
  OVERLOADED Constructors begin line: 20, 30
  Getters begin line: 141
  Setters begin line: 100
  Bespoke methods begin line: 40, 54, 63, 70, 75, 86

3.Invader CLASS
  Fields begin line: 10
  Default Constructors begin line: 18
  OVERLOADED Constructors begin line: 21, 32
  Getters begin line: 116
  Setters begin line: 78
  Bespoke methods begin line: 43, 51, 56, 63, 68, 73

4.Scenery CLASS
  Fields begin line: 10
  Default Constructors begin line: 19
  OVERLOADED Constructors: 26
  Getters begin line: 72
  Setters begin line: 56
  Bespoke methods begin line: 33
  
5.Text CLASS
  Fields begin line: 27
  Default Constructors begin line: 36
  OVERLOADED Constructors: 39, 51, 63, 75
  Getters begin line: 141
  Setters begin line: 105
  Bespoke methods begin line: 87

6.Timer CLASS
  Fields begin line: 10
  Default Constructors begin line: 13
  OVERLOADED Constructors: 18
  Getters begin line: 47
  Setters begin line: 36
  Bespoke methods begin line: 23, 27

...

I have documented 6 classes and they include overloaded constructors therefore I am scoring 10/10

Part E2 - Mark (10 /10)
=========================
Class bespoke methods i.e. private helper methods:

I have private helper methods in 3 classes

1.Player CLASS

[player]line 113 takes in 2 parameters and returns NO value
[player]line 140 takes in 0 parameters and returns a value
[player]line 152 takes in 1 parameters and returns NO value
[player]line 44 & 88 takes in 0 parameters and returns NO value
[player]line 177 & 185 take in 1 parameter and returns a value

2.Bullet CLASS

[bullet]line 64 & 71 takes in 0 parameters and returns NO value
[bullet]line 75 takes in 0 parameters and returns NO value
[bullet]line 86 takes in 1 parameter and returns No value. OVERLOADING the method on line 75

3.Invader CLASS

[invader]line 52 & 57 takes in 0 parameters and returns NO value
[invader]line 63 takes in 1 parameters and returns no value

Private help methods for 3 classes are highlighted showing multiple examples of Methods with no return values, return values, parameters, and overloading. I am awarding myself 10/10

Part E3 - Mark (10 /10)
=========================
- The user-defined class(es) are USED in an appropriate manner p

multiple declarations of user defined classes are USED:
[Assignment2_96358157_Kieron_Garvey]line 14, to declare an object array of type Player
[Assignment2_96358157_Kieron_Garvey]line 15, to declare a multidimensional object array of type Bulletp
[Assignment2_96358157_Kieron_Garvey]line 16, to declare a multidimensional object array of type Invader
[Assignment2_96358157_Kieron_Garvey]line 17, to declare an object array of type Bullet

[Assignment2_96358157_Kieron_Garvey]line 621, to initialise object array of type Player for Player1 
[Assignment2_96358157_Kieron_Garvey]line 623, to initialise object array of type Player for Player2 
[Assignment2_96358157_Kieron_Garvey]line 648, to initialise multidimensional object array of type Bullet used as Player1's bullets
[Assignment2_96358157_Kieron_Garvey]line 651, to initialise multidimensional object array of type Bullet used as Player2's bullets
[Assignment2_96358157_Kieron_Garvey]line 633, to initialise multidimensional object array of type Invader 
[Assignment2_96358157_Kieron_Garvey]line 664, to initialise object array of type Bullet


getters/setters are USED on...
[Assignment2_96358157_Kieron_Garvey]line 168, 169 calls the getXCoord() & getYCoord()getters for each player and uses the results to calculate the distance between the players
[Assignment2_96358157_Kieron_Garvey]line 173, 180 calls a getter for each player to see if playerDied is false 
[Assignment2_96358157_Kieron_Garvey]line 174 calls a setter if the player has died setting playerAllowedShoot to true
[Assignment2_96358157_Kieron_Garvey]line 181 calls a setter if the player has died setting playerAllowedShoot to false
[Assignment2_96358157_Kieron_Garvey]line 236 calls the invadersBullets setter setXCoord() and also calls th invader getter getXCoord() to set the invadersBullet xCoord 
[Assignment2_96358157_Kieron_Garvey]line 237 calls the invadersBullets setter setYCoord() and also calls th invader getter getYCoord() to set the invadersBullet yCoord 

default constructors USED on lines...
[Assignment2_96358157_Kieron_Garvey]line 100 calls default constructor on [scenery]line 20

overloaded constructors USED on lines...
[Assignment2_96358157_Kieron_Garvey]line 186 uses overloaded constructor on [scenery]line 26
[Assignment2_96358157_Kieron_Garvey]line 391,393 uses overloaded constructor on [text]line 51
[Assignment2_96358157_Kieron_Garvey]line 395,415 uses overloaded constructor on [text]line 40
[Assignment2_96358157_Kieron_Garvey]line 621,623 uses overloaded constructor on [player]line 25
[Assignment2_96358157_Kieron_Garvey]line 648,651 uses overloaded constructor on [bullet]line 20
[Assignment2_96358157_Kieron_Garvey]line 633 uses overloaded constructor on [invader]line 22
[Assignment2_96358157_Kieron_Garvey]line 664 uses overloaded constructor on [bullet]line 30

Multidimensional object arrays and object arrays used to create the Players, Invaders and Bullets. Also have primative arrarys used. I have used overloaded constructors and default constructors.
Relevant getter and setters are used where needed and i respected encapsulation. Therefore I am scoring 10/10


============================
PART F - DATA STRUCTURES
============================
Part F1 - Mark (9 /10)
=========================
- Use of a data structure to store information i.e. array

[Assignment2_96358157_Kieron_Garvey]line 14 declared a non-primitive obect array of type Player
    line 621 & 623 initialized array
    line 168 & 169 both elements are used in a dist() call to see the distance between the two objects (players)
    line 283 array obect used to update the player score
    line 320 used to reduce the players health    
    
[Assignment2_96358157_Kieron_Garvey]line 15 declared a multidemensoinal non-primitive obect array of type Bullet
    line 648 & 651 initialized array
    line 251 used in a method call to update all bullets
    line 251 used in a method call to display all bullets
    line 793 used to set the the new player2 bullets yCoord
    line 816 used to set the the new player1 bullets yCoord

[Assignment2_96358157_Kieron_Garvey]line 16 declared a multidemensoinal non-primitive obect array of type Invader
    line 633 initialized array
    line 344 is a nested for loop which is used to update (line 346) and display (line 347) the invaders
    line 279 used in a collision detection function call passing in the current invader in the loop to see if a collision has been made with a bullet.
    line 281 removes the invader if collision has occurred
    line 317 used in a collision detection function call passing in the current invader in the loop to see if a collision has been made with a player.
    line 321 removes the invader if collision has occurred
    line 236 sets the xCoord of the invader bullet
    line 237 sets the yCoord of the invader bullet

[Assignment2_96358157_Kieron_Garvey]line 17 declared a non-primitive obect array of type Bullet (invader bullets)
    line 664 initialized array 
    line 222 is a start of a for loop which is used to update (line 223) and display (line 224) the invaders bullets
    line 299 used in a collision detection function call passing in the current invader bullet in the loop to see if a collision has been made with a player.
    line 301 removes the invader bullet if collision has occurred
Assignment2_96358157_Kieron_Garvey
[TABName]line 25 declared a multidemensoinal primitive array totalBullets 
       line 125 to 130 nested for loop used to initialize the array
     line 250 used in a for loop to update the bullets.
     line 276 used in nested for loop to check if the bullets hit an invader.
     line 685 to 689 nested for loop used to reset the array elements

[Assignment2_96358157_Kieron_Garvey]line 26 declared/initialized a multidemensoinal primitive array scoreNames 
      used on line 393 to display the high score player names on screen
      used on line 484 to set the last element of the array
      used on line 490 searching for the highest element in the array 
      used on line 495 to add an element to temporary string.
      used on line 498 rearrangeing the array
      
[Assignment2_96358157_Kieron_Garvey]line 27 declared/initialized a multidemensoinal primitive array scorePoints 
      used on line 395 to display the high score on screen
      used on line 485 to set the last element of the array
      used on line 494 to add an element to temporary integer.
      used on line 497 rearrangeing the array

Multidimensional object arrays and object arrays used to create the Players, Invaders and Bullets. There is also primitive arrays used throughout the program. 
I didnt use set the array size by any user input therefore i am scoring myself 9/10


Part F2 - Mark (10 /10)
=========================
- Calculations performed on the information stored

[Assignment2_96358157_Kieron_Garvey]line 480 is ste start of a method that is used to add a new highscore to my high score board. The name and score are passed into the function

line 484 assigns the name to the last element of the array scoreNames 
line 485 assigns the score to the last element of the array scorePoints
line 487 is the start of a nested for loop which runs through the scorePoints array checking each element looking for the 
    highest score and once it has the highest score it sorts them in decreasing order with the highest score going 
    into the first element scorePoints. The loop makes the same changes to both the scorePoints and scoreNames array 
    keeping the correct player with the correct points so the information can be displayed on the highscore board.

[Assignment2_96358157_Kieron_Garvey]line 283 adds the points to the playerScore using the player object array and the addToPlayerScore() Method. 
    When an invader has been hit (collision detection) by a player bullet it checks the multidemensoinal invaders object array 
    using the invaders getter getPointValue() to get that invaders point value then multiples it by 10 passing this new calue into addToPlayerScore()  
    
[Assignment2_96358157_Kieron_Garvey]line 850 gets the current speed of an invaders with the getInvaderSpeed() multiples it by 1.2 and sets the speed with teh setter setInvaderSpeed();

Since my Players, Invaders and Bullets are all object arrays there is calculations through out the program. I demonstrated i could loop through an arra using the .length and 
compared the values returned to reindex two arrays for the highscore board. Therefore i am scoring myself 10/10

=========================
TOTAL MARK = 99

COMPLEXITY MULTIPLIER
=========================
Advanced *1.0 - I have a fully functioning game with new game, lives, scoring, leader board and additional features

FINAL CHECK:
I have checked the constraints and I am not breaking any constraints



*/
