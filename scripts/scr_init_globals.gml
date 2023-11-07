///scr_init_globals()

/*
**  Usage:
**      scr_init_globals()
**
**  Purpose:
**      Initializes all of the global variables used throughout the game.
*/

//Player
global.player = 0

//Time Limit
global.timer = 0

//Coins
global.coins = 0

//Lives
lives = 5

//Score
score = 0

//Mario Start!
global.mariostart = 0

//Whether a level is cleared
global.clear = 0

//Powerup
global.powerup = cs_small

//Reserve Item
global.reserveitem = cs_small

//Checkpoint
global.checkpoint = noone

//Checkpoint Room
global.checkpointroom = noone

//Red Switch Palace
global.palacered = 0

//Blue Switch Palace
global.palaceblue = 0

//Yellow Switch Palace
global.palaceyellow = 0

//Green Switch Palace
global.palacegreen = 0

//Position change object type
global.postchange = -1

//Position change coordinates
global.postx = 0
global.posty = 0

//Yoshi
global.yoshi = 0

//Yoshi's Color
global.ycolor = 0

//Whether Mario died
global.died = 0

//P-Switch time limit
global.pswitch = 0

//Star time limit
global.star = 0

//On/Off Block state
global.onoffblock = 0

//Mushroom house prizes
global.prize[0] = 0
global.prize[1] = 0
global.prize[2] = 0

//Map pipe area type
global.pipetype = 0

//Map inventory variables
for(var i=0; i<16; i++)
    global.inventory[i] = 0
    
//P-Meter
global.pmeter = 0

//WorldMap Music
global.mapmusic = snd_mapmusic;

//Muertes totales
global.actualdeads = 0;
