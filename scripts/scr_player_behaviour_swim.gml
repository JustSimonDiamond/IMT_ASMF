///scr_player_behaviour_swim()
//
//  Movimiento del personaje cuando está nadando.
//

//Reset spin jump
stompstyle = 0;

//Figure out the player's state.
if ((collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_solidtop,0,0))
|| (collision_rectangle(x-1,bbox_bottom+1,x+1,bbox_bottom+1,obj_slopeparent,1,0)))
&& (gravity == 0) {

    //If the player is not moving vertically
    if (vspeed >= 0) {

        //Figure out if the player is standing or walking
        if (hspeed == 0)
            state = 0;
        else 
            state = 1;
    
        //Reset state delay
        statedelay = 0;
    }
    
    //Otherwise, set 'Jump' state
    else if (vspeed < 0)
        state = 2;
}

//the player is jumping if there's no ground below him.
else {

    //Delay the change to the jump state
    if (statedelay > 4)
        state = 2;
    else
        statedelay++;
}

//Make the player uncrouch if jumping.
if ((state == 2) && (isduck))
    isduck = false;

//Handle the player movement.
if (!disablecontrols) /*&& (!inwall)*/ { //If the player controls are not disabled.

    //If the player does not have either the frog or penguin powerup and it's not holding anything.
    if ((global.powerup == cs_frog)
    || (global.powerup == cs_penguin)) 
    && (holding == 0) {
    
        //Deny gravity at all times
        gravity = 0
        
        //If the 'Control' key is pressed, move faster.
        if (keyboard_check(vk_control))  
            hspeedmax = 2;
        
        //Otherwise, move slower.
        else        
            hspeedmax = 1;
        
        //Handle horizontal movement
        //If the left key is pressed and the player is not crouched down.
        if ((keyboard_check(vk_left)) && (!isduck) && (!keyboard_check(vk_right))) {
        
            //Set the horizontal speed
            hspeed += -0.2;
            
            //Set the facing direction
            direct = -1;
            
            //Set the swimming direction
            swimtype = 0;
        }
        
        //Otherwise, if the right key is pressed and the player is not crouched down.
        else if ((keyboard_check(vk_right)) && (!isduck) && (!keyboard_check(vk_left))) {
        
            //Set the horizontal speed
            hspeed += 0.2;
            
            //Set the facing direction
            direct = 1;
            
            //Set the swimming direction
            swimtype = 0;
        }
        
        //Otherwise, stop the player.
        else {
        
            //Reduce the player's speed until he stops.
            hspeed = max(0,abs(hspeed)-0.2)*sign(hspeed);
            
            //Set up horizontal speed to 0 when xspeed hits 0.2
            if ((hspeed < 0.2) && (hspeed > -0.2))                
                hspeed = 0;
        }
            
        //If the 'Up' key is pressed.
        if (keyboard_check(vk_up)) {
        
            //Move upwards
            vspeed += -0.2;
            
            //Set the swimming animation.
            if (hspeed == 0)
                swimtype = 1;
        }
        
        //Otherwise, if the 'Down' key is pressed.
        else if (keyboard_check(vk_down)) {
        
            //Set the swimming animation
            if (hspeed == 0)
                swimtype = 2;
            
            //Move downwards
            if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_solidtop,0,0))
            || (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slopeparent,1,0))
                vspeed = 0;
            else
                vspeed += 0.2;
        }
        else {
    
            //Reduce the player's speed until he stops.
            vspeed = max(0,abs(vspeed)-0.2)*sign(vspeed);
            
            //Set up vertical speed to 0 when yspeed hits 0.2
            if ((vspeed < 0.2) && (vspeed > -0.2))                
                vspeed = 0;
        }
            
        //Prevent the player from moving horizontally too fast.
        if (hspeed > hspeedmax) 
            hspeed = hspeedmax;
        if (hspeed < -hspeedmax) 
            hspeed = -hspeedmax;
            
        //Prevent the player from moving vertically too fast.
        if (vspeed > hspeedmax) 
            vspeed = hspeedmax;
        if (vspeed < -hspeedmax) 
            vspeed = -hspeedmax;        
    }
    
    //Otherwise, if the player does not have any of the above powerups.
    else {
    
        //Prevent the player from swimming too fast.
        if (vspeed < -2) 
            vspeed = -2;
            
        //Prevent the player from diving too fast.
        if (vspeed > 4)
            vspeed = 4;
        
        //Set up the maximum horizontal speed.
        if (state == 2) {
        
            //If the player is wearing the blue shell
            if (global.powerup == cs_shell)
                hspeedmax = 2.5;
            else
                hspeedmax = 2;
        }
        else
            hspeedmax = 0.5;
            
        //If the player presses the 'Shift' key.
        if (keyboard_check_pressed(vk_shift)) {
        
            //Play 'Swim' sound
            audio_play_sound(snd_swim, 0, false);
        
            //Swim higher if the 'Up' key is pressed.
            if (keyboard_check(vk_up)) {
            
                //Set the vertical speed
                vspeed -= 2;
                
                //If a kuribo shoe is being ridden, dismount from it.
                if (global.yoshi == 2)
                    with (obj_kuriboshoe) event_user(0);
                
                //Otherwise, if a Yoshi is being ridden, dismount from it.
                else if (global.yoshi == 1)
                    with (obj_yoshi) event_user(1);
            }
            
            //Swim lower if the 'Down' key is pressed.
            else if (keyboard_check(vk_down))
                vspeed -= 0.5;
            
            //Otherwise
            else        
                vspeed -= 1.5;
                
            //Set the state
            state = 2;
        }
        
        //Handle horizontal movement.
        //If the player presses the 'Right' key and the 'Left' key is not held.
        if ((keyboard_check(vk_right)) && (!keyboard_check(vk_left)) && (!isduck) ) {
            
            //Set the facing direction
            if ((holding == 2) && (direct != 1)) {
            
                turning = 1;
                alarm[11] = 12;
            }
            direct = 1;
            
            //If there's NOT a wall on the way.
            if (!collision_rectangle(bbox_right,bbox_top+4,bbox_right+1,bbox_bottom-1,obj_solid,1,0)) {
            
                //Set the horizontal speed.
                if (hspeed >= 0) //If the player horizontal speed is equal/greater than 0.        
                    hspeed += acc_swim;
                
                //Otherwise, If the player horizontal speed is lower than 0.
                else         
                    hspeed += acc_swim*2;
            }
        }
        
        //If the player presses the 'Left' key and the 'Right' key is not held.
        else if ((keyboard_check(vk_left)) && (!keyboard_check(vk_right)) && (!isduck)) {
            
            //Set the facing direction
            if ((holding == 2) && (direct != -1)) {
            
                turning = 1;
                alarm[11] = 12;
            }
            direct = -1;
            
            //If there's NOT a wall on the way.
            if (!collision_rectangle(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,1,0)) {
            
                //Set the horizontal speed.
                if (hspeed <= 0) //If the player horizontal speed is equal/lower than 0.        
                    hspeed += -acc_swim;
                    
                //Otherwise, If the player horizontal speed is greater than 0. 
                else        
                    hspeed += -acc_swim*2;
            }      
        }
        
        //Otherwise, if neither of the 'Left' key or 'Right' key is not held.
        else if (vspeed == 0) { //If the player is on the ground.
        
            //Reduce the player speed until he stops.
            hspeed = max(0,abs(hspeed)-dec_swim)*sign(hspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec_swim'.
            if ((hspeed < dec_swim) && (hspeed > -dec_swim))      
                hspeed = 0;     
        }
    }
}

//Otherwise, If the player controls are disabled.
else if (disablecontrols) {

    //Reduce the player speed until he stops.
    hspeed = max(0,abs(hspeed)-dec_swim)*sign(hspeed);
    
    //Set up horizontal speed to 0 when xspeed hits the value given on 'dec_swim'.
    if ((hspeed < dec_swim) && (hspeed > -dec_swim))    
        hspeed = 0;        
}

//Prevent the player from sliding too fast.
if (hspeed > hspeedmax)
    hspeed = hspeedmax;
if (hspeed < -hspeedmax)
    hspeed = -hspeedmax;
    
//Apply ygrav
if ((state == 2) || (statedelay > 0))
    gravity = grav_swim;
    
/*var boost;

boost = 0

if (keyboard_check_pressed(vk_control))
    boost = 1;
else
    boost = 0;

//Handles frog and penguin Mario's swim ability if he is not holding anything
if (global.powerup = cs_frog or global.powerup = cs_penguin)
and holding = 0
{

    //If Mario's controls are not disabled
    if disablecontrols = 0
    {

        //Swim upwards
        if keyboard_check(vk_up)
        and not keyboard_check(vk_down)
        {

            //Move up
            vspeed = -1.5 - boost;

            //Set the swim type
            swimtype = 1

        }

        //Swim downwards
        else if keyboard_check(vk_down)
        and not keyboard_check(vk_up)
        {

            //Move down
            vspeed = 1.5 + boost;

            //Set the swim type
            swimtype = 2

        }

        //Stop swimming vertically
        else
            vspeed = 0

        //Swim to the left
        if keyboard_check(vk_left)
        and not keyboard_check(vk_right)
        {

            //Move left
            hspeed = -1.5 - boost;

            //Set the swim type
            swimtype = 0

            //Face left
            direct = -1

        }

        //Swim to the right
        else if keyboard_check(vk_right)
        and not keyboard_check(vk_left)
        {

            //Move right
            hspeed = 1.5 + boost;

            //Set the swim type
            swimtype = 0

            //Face right
            direct = 1

        }

        //Stop swimming horizontally
        else
            hspeed = 0

    }

    //Stop swimming
    else
        speed = 0

    //If the swim sound is not looping, but Mario is moving, loop the sound
    if speed != 0
    and noisy = 0
    {
        noisy = 1
        audio_play_sound(snd_swim,0,1)
    }

    //If the swim sound is looping, but Mario is not moving, stop the sound
    else if speed = 0
    and noisy = 1
    {
        noisy = 0
        audio_stop_sound(snd_swim)
    }

    //Good swimmers are not affected by gravity
    gravity = 0

    //Perpetual jump state
    state = 2

    //Prevent ducking
    isduck = 0

}

//The default swim script
else
{

    //Figure out Mario's state
    if (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_solidtop,0,0)
    or collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_slopeparent,1,0))
    and gravity = 0
    {

        //Figure out if Mario is standing or walking
        if hspeed = 0
            state = 0
        else
            state = 1

        //Reset state delay
        statedelay = 0

    }

    //Mario is jumping if there is no ground below him
    else
    {

        //Delay the change to the jump state
        if statedelay > 4
            state = 2
        else
            statedelay++

        //Set gravity
        gravity = 0.125

    }

    //Prevent Mario from falling down too fast
    if vspeed > 1.5
        vspeed = 1.5

    //Handles swimming
    if keyboard_check_pressed(vk_shift)
    and disablecontrols = 0
    {

        //If up is being pressed
        if keyboard_check(vk_up)
        {

            //Swim higher
            vspeed = -3.5

            //Get off of Yoshi if he is on one
            if global.yoshi = 1
                with obj_yoshi event_user(1)

            //Get off of a shoe if he is on one
            else if global.yoshi = 2
                with obj_kuriboshoe event_user(0)

        }

        //Swim lower if down is being pressed
        else if keyboard_check(vk_down)
        and isduck = 0
            vspeed = -1

        //Default swim height
        else
            vspeed = -2.5

        //Play the swim sound
        audio_play_sound(snd_swim,0,0)

        //Switch to the jump state
        state = 2

    }

    //Handles moving right
    if keyboard_check(vk_right)
    and not keyboard_check(vk_left)
    and disablecontrols = 0
    and (isduck = 0 or state = 2)
    {

        //Accelerate more if he is skidding
        if hspeed < 0
            hspeed += 0.075

        //Accelerate
        hspeed += 0.06

        //Face right
        direct = 1

    }

    //Handles moving left
    else if keyboard_check(vk_left)
    and not keyboard_check(vk_right)
    and disablecontrols = 0
    and (isduck = 0 or state = 2)
    {

        //Accelerate more if he is skidding
        if hspeed > 0
            hspeed += -0.075

        //Accelerate
        hspeed += -0.06

        //Fsce left
        direct = -1

    }

    //If Mario is not trying to move to the left or right
    else
    {

        //Slow down Mario's horizontal speed
        if hspeed > 0
            hspeed-=0.05
        if hspeed < 0
            hspeed+=0.05

        //If Mario is slow enough, stop his horizontal speed entirely
        if abs(hspeed) < 0.05
            hspeed = 0

    }

    //Prevent Mario from moving too fast, and let him move faster when not on the ground
    if state = 2
    {
        if hspeed > 1.5
            hspeed = 1.5
        if hspeed < -1.5
            hspeed = -1.5
    }
    else
    {
        if hspeed > 0.5
            hspeed = 0.5
        if hspeed < -0.5
            hspeed = -0.5
    }

    //Make sure that the swim sound is not looping
    if noisy = 1
    {
        noisy = 0
        audio_stop_sound(snd_swim)
    }

}
*/
//If Mario is no longer in water
if (!place_meeting(x,y,obj_swim))
{

    //Make Mario stop swimming
    isswim = 0;

    //Reset variable jumping
    jumpnow = 0;

    //If Mario came out of the water from the top
    if (place_meeting(x,y+2,obj_swim))
    {

        //Create the splash effect
        with instance_create(x-8,y+17,obj_smoke)
        {
            sprite_index = spr_splash;
            depth = -6;
        }

        //Jump out of the water if shift is being held
        if (keyboard_check(vk_shift))
        {
            vspeed = -3.85;
            jumpnow = 1;
        }

    }

    //Make sure that the swim sound is not looping
    if (noisy == 1)
    {
        noisy = 0;
        audio_stop_sound(snd_swim);
    }

}
/*
//Disable the spin jump kill ability if Mario is not in a shoe
if global.yoshi != 2
    stompstyle = 0
