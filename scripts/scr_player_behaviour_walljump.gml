///scr_player_behaviour_walljump()
//
//  El jugador cuando puede hacer saltos de pared.
//

//If Mario does not have the appropriate powerup
if (global.powerup != cs_ninja 
and global.powerup != cs_walljump 
and global.powerup != cs_squirrel 
and global.powerup != cs_small 
and global.powerup != cs_big 
and global.powerup != cs_fire 
and global.powerup != cs_leaf 
and global.powerup != cs_tanooki 
and global.powerup != cs_boomerang 
and global.powerup != cs_propeller 
and global.powerup != cs_super 
and global.powerup != cs_bee
and global.powerup != cs_ice 
and global.powerup != cs_penguin 
and global.powerup != cs_goldtan 
and global.powerup != cs_cat)

//Or if ninja Mario is no longer facing a wall to climb
or ((global.powerup = cs_ninja)
and ((direct = 1 and not collision_rectangle(bbox_right,bbox_top+4,bbox_right+1,bbox_bottom-1,obj_solid,1,0))
or (direct = -1 and not collision_rectangle(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,1,0))))

//Or if wall jump Mario moves away from the wall, or is not against a wall
or ((global.powerup != cs_ninja)
and (direct = -1 and (keyboard_check(vk_left) or not collision_rectangle(bbox_right,bbox_top+4,bbox_right+1,bbox_bottom-1,obj_solid,1,0))
or direct = 1 and (keyboard_check(vk_right) or not collision_rectangle(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,1,0))))

//Or if Mario reaches the floor
or collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_solidtop,0,0)
or collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_slopeparent,1,0)
{

    //Switch to the jump state
    state = 2

    //Disable variable jumping
    jumpnow = 0

    //Do not execute the rest of this event
    exit

}

//If Mario is in the ninja suit
if (global.powerup = cs_ninja)
{
    //Handle moving up
    if keyboard_check(vk_up)
    and not keyboard_check(vk_down)
    and disablecontrols = 0
        vspeed = -1

    //Handle moving down
    else if keyboard_check(vk_down)
    and not keyboard_check(vk_up)
    and disablecontrols = 0
        vspeed = 1

    //Stop moving
    else
    {
        vspeed = 0;
    }
}

//If the player does have the cat powerup.
if ((global.powerup == cs_cat) && (keyboard_check(vk_up))) {
    
    //If the player can climb
    if (catclimbing < (global.cattime * 60)) {
                
        //Increase cat climb
        catclimbing++;    
            
        //Move up
        vspeed -= 0.5;
            
        //No grav
        gravity = 0;
            
        //Prevent the player from climbing too fast.
        if (vspeed < -1.5)
            vspeed = -1.5;  
    }
    else if (catclimbing == (global.cattime * 60)) {
            
        //Set the gravity
        gravity = 0.03;
            
        //Prevent the player from falling too fast.
        if (vspeed > 1.5)
            vspeed = 1.5;
    }
}

//If Mario is just wall jumping, and not in the squirrel suit, slide down the wall
else if global.powerup != cs_squirrel
    vspeed = 1

//Handle jumping
if (keyboard_check_pressed(vk_shift)
and disablecontrols == 0)
{

    //Jump
    vspeed = -3.75

    //Esto
    if (keyboard_check(vk_up)
    && global.powerup != cs_propeller
    && global.powerup != cs_cat) 
    {
        audio_play_sound(snd_spin,0,0);
        stompstyle = 1;
    }

    //Enable variable jumping
    jumpnow = 1

    //Switch to the jump state
    state = 2

    //Reverse direction if Mario is in the ninja suit
    if (global.powerup = cs_ninja)
    {
        audio_play_sound(snd_jump,0,0);
        direct = -direct;
    }
    //Otherwise, make wall jump effects
    else
    {
        audio_play_sound(snd_stomp,0,0)
    }

    //Move away from the wall
    hspeed = 3*direct

}
