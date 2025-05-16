///scr_return()

/*
**  Usage:
**      scr_return()
**
**  Purpose:
**      Sends Mario back to the world map, or to the game over screen if he is out of lives.
*/

//Create fade in object
if (instance_number(obj_fadein) == 0) {

    //With the fade object
    with (instance_create(0,0,obj_fadein)) {
    
        //If lives are set to 0, go to the game over screen.
        if (lives <= 0)
            target = rm_gameover;
            
        //Otherwise, go to the map.
        else
            target = rm_worldmap;
    }
}
