# HDCS2023_Programming ASSIGNMENT 2 - SpaceInvaders
##INTRODUCTION
This is your second assignment that will contribute to your grade for the semester. It is worth 35% of your overall grade.

The objective is to demonstrate your growing coding knowledge particularly in the area of classes, objects, arrays, loops, mouse/key event handling.

##SHORT DESCRIPTION
You are asked to write a game which meets the brief detailed later. It must include:

collision detection or collision avoidance between at least 2 objects. The objects are created from class files that you create and define (similar to Paddle and Ball in the game of Pong that we studied).

Collision Detection between the objects will involve accessing the location (x,y) properties of those objects through getters. Collision Detection methods will therefore be defined in the main program.

You must enable one of the objects to be navigated (using a key handler). This will require that object to have update() and display() methods (as demonstrated in Pong).

You must deploy/fire/shoot at least one objects (e.g. bullet/bomb/parachute) (using a key handler). This will require that object to have update() and display() methods (as demonstrated in Pong).

I suggest picking an old fashion game, don't get bogged down in graphics, CUSTOMISE. Don't hand up the standard version or standard graphics.

Your game MUST utilize a full 1280 * 720 screen, no bars at the side or on top.

Your game MUST have an scoreboard overlaid while the game is running. TIP: at the end of the draw() method, use something like

Copy
scoreboard.update();
scoreboard.display();
Display in whatever fashion you wish the high scores table at the end of each game, and prompt to start another game. The game should restart.

Do not include tournament facilities (as per Pong)

##WARNING
We don't need them, but if you include sounds, fonts or graphics files, you must ensure they are all included properly otherwise your code won't run.

##NO
This specification rules OUT games based on:

cards,
wac-a-mole,
basic click on the object type games
Also you may NOT present Pong / breakout / tennis
Also you may NOT present SNAKE / LIFE
YES
This rules IN games involving:

driving
navigation (customised: pac man, frogger)
shoot em ups (customised: asteroids, invaders, galaxians)

##ATTENTION
All parts of this assignment document make up the specification. Please pay attention to the details:

The Brief: What is expected from your code.
Constraints: What you can't use.
Marking: The marking scheme for the assignment.
Submission: Submission details including submission date.
