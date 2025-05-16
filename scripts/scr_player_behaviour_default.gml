///scr_player_behaviour_default()
//
//  Movimiento predeterminado del personaje.
//

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

}

//Check if Mario is standing on a slippery surface
if collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)
    isslip = 1
else
    isslip = 0

//Prevent Mario from falling down too fast
if vspeed > 4
    vspeed = 4

//Figure out what Mario's max speed should be

//Frog Mario can not run
if global.powerup = cs_frog
and global.yoshi = 0
    hspeedmax = walkspeed

//Bee Mario is slow when he is flying
else if global.powerup = cs_bee
and isfloating = 1
    hspeedmax = 1

//If the run key is being held, go faster
else if keyboard_check(vk_control)
{
    if global.pmeter > 6
        hspeedmax = fullrunspeed
    else
        hspeedmax = runspeed
}
    
//Otherwise, move slower
else
    hspeedmax = walkspeed

//Handles Mario's jumping
if keyboard_check_pressed(vk_shift)
and disablecontrols = 0

//Make sure that Mario can jump
and ((jumpnow = 0
and state < 2)

//Allow Mario to jump off of Yoshi or a shoe while in midair
or (keyboard_check(vk_up)
and isduck = 0
and global.yoshi > 0)

//Allow propeller Mario to do his special jump
or (global.powerup = cs_propeller
and stompstyle = 0
and isduck = 0
and holding = 0))
{

    //Jump extra high as swooper Mario when the P-meter is flashing
    if global.powerup = cs_swooper
    and global.pmeter > 5
        vspeed = -6.7

    //Jump higher if Mario is running
    else if abs(hspeed) > runspeed-0.2
        vspeed = -4.5

    //If Mario is not running
    else
    {

        //Jump high if you are frog Mario, and you are not riding anything
        if global.powerup = cs_frog
        and global.yoshi = 0
            vspeed = -4.5

        //Jump lower if you are not running
        else
        {

            //Jump even lower if you are walking super slowly
            if round(hspeed/2) = 0
                vspeed = -3.85

            //Jump slightly higher if you are walking
            else
                vspeed = -4.05

        }
    }

    //Make Mario spin jump
    if (keyboard_check(vk_up)
    and isduck = 0
    and (holding = 0 or global.yoshi > 0))
    or state = 2
    {

        //Get off of Yoshi if he is on one
        if global.yoshi = 1
        {
            with obj_yoshi event_user(1)
            if state < 2
            {
                stompstyle = 1      
                audio_play_sound(snd_spin,0,0)
                hspeed = 1*(direct*-1)
                alarm[7] = 10          
            }
            else
            {
                stompstyle = 0
                audio_play_sound(snd_jump,0,0)
            }
        }

        //Get off of a shoe if he is on one
        else if global.yoshi = 2
        {
            with obj_kuriboshoe event_user(0)
            if state < 2
            {
                stompstyle = 1
                audio_play_sound(snd_spin,0,0)
                hspeed = 1*(direct*-1)
                alarm[7] = 10          
            }
            else
            {
                stompstyle = 0
                audio_play_sound(snd_jump,0,0)
            }
        }
        else
        {
            stompstyle = 1
            if global.powerup != cs_propeller
                audio_play_sound(snd_spin,0,0)
            else
                audio_play_sound(snd_propeller_fly,0,0)
            alarm[7] = 10
        }
    }

    //Play the jump sound if he is not spin jumping
    else
        audio_play_sound(snd_jump,0,0)

    //Enable variable jumping
    jumpnow = 1

    //Switch to the jump state
    state = 2

}

//Check if Mario should still be variable jumping
if keyboard_check_released(vk_shift)
and jumpnow = 1
    jumpnow = 2

//If Mario is ducking on the ground
if isduck = 1 and state != 2
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

//If Mario is not ducking on the ground
else
{

    //Handles moving right
    if keyboard_check(vk_right)
    and not keyboard_check(vk_left)
    and disablecontrols = 0
    {

        //If Mario is not at his maximum speed
        if hspeed < hspeedmax
        {

            //Accelerate slower if he is on a slippery surface
            if isslip = 1
            && (global.powerup != cs_penguin)
                hspeed += 0.04

            //Default acceleration
            else
            {

                //Accelerate more if he is skidding
                if hspeed < 0 
                    hspeed += 0.075
                        
                //Accelerate
                hspeed += 0.06
            }
        }

        //Change Mario's direction if he is not wall jumping
        if walljump = 0
            direct = 1

    }

    //Handles moving left
    else if keyboard_check(vk_left)
    and not keyboard_check(vk_right)
    and disablecontrols = 0
    {

        //If Mario is not at his maximum speed
        if hspeed > -hspeedmax
        {

            //Accelerate slower if he is on a slippery surface
            if isslip = 1
            and global.powerup != cs_penguin
                hspeed -= 0.04

            //Default acceleration
            else
            {

                //Accelerate more if he is skidding
                if hspeed > 0 
                    hspeed += -0.075
                
                //Accelerate
                hspeed += -0.06
            }
        }

        //Change Mario's direction if he is not wall jumping
        if walljump = 0
            direct = -1
    }

    //Takes care of slowing Mario down if he is not jumping and left/right is not being pressed
    else if state != 2
    {

        //If Mario is not on a slippery surface
        if isslip = 0
        || (isslip = 1
        && global.powerup = cs_penguin)
        {

            //Slow down Mario's horizontal speed
            if hspeed > 0
                hspeed-=0.05
            else if hspeed < 0
                hspeed+=0.05

            //If Mario is slow enough, stop his horizontal speed entirely
            if abs(hspeed) < 0.05
                hspeed = 0

        }
        else
        {

            //Slow down Mario's horizontal speed
            if hspeed > 0
                hspeed-=0.025
            else if hspeed < 0
                hspeed+=0.025

            //If Mario is slow enough, stop his horizontal speed entirely
            if abs(hspeed) < 0.025
                hspeed = 0

        }
    }

    //Slow Mario down if he is faster than his maximum speed
    if state != 2
    and abs(hspeed) > hspeedmax
    {

        //Slow down Mario's horizontal speed
        if hspeed > 0
            hspeed-=0.025
        else if hspeed < 0
            hspeed+=0.025

        //If Mario is slow enough, stop his horizontal speed entirely
        if abs(hspeed) < 0.025
            hspeed = 0
    }

}

//If Mario is jumping
if state = 2
or statedelay > 0
{

    //Variable jumping
    if vspeed > -1
    or jumpnow != 1
    {

        //Normal gravity
        gravity = 0.3

        //End variable jumping if it never ends manually
        if jumpnow = 1
            jumpnow = 2

    }

    //Lower gravity while in the middle of variable jumping
    else
        gravity = 0.1

    //Propeller Mario jumping
    if global.powerup = cs_propeller
    {

        //If Mario is spin jumping normally
        if stompstyle = 1
        and global.yoshi = 0
        {

            //Lower the gravity
            gravity = gravity/2

            //Allow Mario to charge downwards
            if keyboard_check(vk_down)
                vspeed = 4
            else if vspeed > 1
                vspeed = 1

            //Play the sound when he charges downwards
            if keyboard_check_pressed(vk_down)
                audio_play_sound(snd_propeller_down,0,0);
                
            //Stop the sound if the down key is not being pressed
            else if (not keyboard_check(vk_down)
            and audio_is_playing(snd_propeller_down))
                audio_stop_sound(snd_propeller_down);

        }

    }

}

//Makes Mario start climbing
if place_meeting(x,y,obj_climb)
and (keyboard_check(vk_up) or (keyboard_check(vk_down) and state = 2))
and holding = 0
and disablecontrols = 0
{

    //Change to climb state
    state = 3

    //Stop movement
    gravity = 0
    speed = 0

    //Disable carrot and bee Mario floating
    isfloating = 0

    //Reset flying
    powerupfly = 0

    //Reset wall jump
    walljump = 0

    //Reset squirrel propel
    squirrelpropel = 0

    //Reset double jump
    doublejump = 0

    //Stop carrot/bee Mario's floating sound
    if floatnow = 1
    {
        audio_stop_sound(snd_tailspin)
        floatnow = 0
    }

}

//Handles sliding down slopes and shell/penguin Mario sliding
if keyboard_check_pressed(vk_down)
and disablecontrols = 0
and holding = 0
{

    //If shell/penguin Mario is walking, do the special sliding
    if (global.powerup = cs_shell or global.powerup = cs_penguin)
    and state = 1
        with instance_create(x,y,obj_slider) event_user(0)

    //If Mario is on a slope, and the above didn't happen, slide normally
    else if collision_point(bbox_right,bbox_bottom+1,obj_slopeparent,1,0)
    xor collision_point(bbox_left,bbox_bottom+1,obj_slopeparent,1,0)
        instance_create(x,y,obj_slider)

}

//Kuribo shoes give Mario the special stomp ability at all times
if global.yoshi = 2
    stompstyle = 1

//Disable spin jumping if Mario is not jumping, or holding something
else if stompstyle = 1
{

    if state != 2
    or holding != 0
        stompstyle = 0

}

//If Mario is jumping, not ducking, not spin jumping, can control himself, and is not riding anything
if state = 2
and isduck = 0
and stompstyle = 0
and disablecontrols = 0
and global.yoshi = 0
{

    //Handles leaf and tanooki Mario's flying
    if (global.powerup = cs_leaf or global.powerup = cs_tanooki or global.powerup = cs_goldtan)
    and keyboard_check_pressed(vk_shift)
    and jumpnow != 1
    and wiggle < 12
    {

        //Fly if the P-meter is flashing and float otherwise
        if global.pmeter > 5
            vspeed = -4
        else
            vspeed = -0.5

        //Wiggle animation
        wiggle = 16

        //Sound effect
        audio_play_sound(snd_tailspin,0,0)

    }

    //Handles checking whether Mario can wall climb or wall jump 
    if (global.powerup = cs_ninja 
    or global.powerup = cs_walljump 
    or global.powerup = cs_squirrel 
    or global.powerup = cs_small 
    or global.powerup = cs_big 
    or global.powerup = cs_fire 
    or global.powerup = cs_leaf 
    or global.powerup = cs_tanooki 
    or global.powerup = cs_boomerang 
    or global.powerup = cs_propeller 
    or global.powerup = cs_super 
    or global.powerup = cs_ice 
    or global.powerup = cs_penguin 
    or global.powerup = cs_bee
    or global.powerup = cs_pyre
    or global.powerup = cs_goldtan 
    or global.powerup = cs_cat)
    and vspeed > 0
    and holding = 0
    {

        //If the direction Mario is facing is pressed, while a wall is in front of him
        if (keyboard_check(vk_right)
        and collision_rectangle(bbox_right,bbox_top+4,bbox_right+1,bbox_bottom-1,obj_solid,1,0)
        and direct = 1)
        or (keyboard_check(vk_left)
        and collision_rectangle(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,1,0)
        and direct = -1)
        {

            //Make Mario start wall climbing/jumping
            state = 4

            //Stop all vertical movement
            vspeed = 0

            //Disable gravity
            gravity = 0

            //Disable carrot and bee Mario floating
            isfloating = 0

            //Change directions if not ninja climbing
            if (global.powerup != cs_ninja)
                direct = -direct

            //Stop carrot/bee Mario's floating sound
            if floatnow = 1
            {
                audio_stop_sound(snd_tailspin)
                floatnow = 0
            }

            //He wall jumped
            walljump = 1

        }

    }

    //Handles carrot and bee Mario's floating
    if (global.powerup = cs_carrot or (global.powerup = cs_bee and powerupfly < 128))
    and keyboard_check(vk_shift)
    {

        //If Mario is moving downwards
        if vspeed > 0
        {

            //Set the floating variable
            isfloating = 1

            //Bee Mario flies upwards if the ceiling is not above him
            if global.powerup = cs_bee
            and not collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_solid,1,0)
            {

                //Fly upwards
                vspeed = -1.5

                //Make the bee timer tick extra because of the initial push
                powerupfly += 8

            }

            //Carrot Mario floats down slowly
            else
                vspeed = 0.5

        }

        //If Mario is not moving downwards
        else
        {

            //If bee Mario is floating
            if global.powerup = cs_bee
            and isfloating = 1
            {

                //Continue flying upwards
                vspeed = -1.5

                //Make the bee timer tick
                powerupfly++

                //Slow bee Mario down if he is moving too fast
                if hspeed > 1
                    hspeed -= 0.1
                if hspeed < -1
                    hspeed += 0.1

            }

            //Stop floating otherwise
            else
                isfloating = 0

        }

    }

    //Stop floating
    else
        isfloating = 0

    //Handle squirrel Mario's flying
    if global.powerup = cs_squirrel
    and holding = 0
    {

        //If Mario hasn't propelled yet
        if squirrelpropel = 0
        {

            //If the jump key is pressed while moving downwards, propel upwards
            if vspeed > 0
            and (keyboard_check_pressed(vk_shift)
            and keyboard_check(vk_up))
            {

                //Propel
                squirrelpropel = 1

                //Move up
                vspeed = -3.85

                //Enable variable jumping
                jumpnow = 1

                //Sound effect
                audio_play_sound(snd_tailspin,0,0)

            }

            //If the jump key is held down, float
            else if vspeed > 0.5
            and keyboard_check(vk_shift)
                vspeed = 0.5

        }

        //Otherwise, float down more
        else if vspeed > 2
            vspeed = 2

    }

    //Handle cloud Mario's cloud creation
    if global.powerup = cs_cloud
    and jumpnow != 1
    and (keyboard_check_pressed(vk_shift)
    and keyboard_check(vk_up))
    {

        //Create up to 3 clouds
        var count = 0
        with obj_cloud
        {
            if count < num
                count = num
        }

        //Do not create more until the 3rd is gone
        if count < 3
        {

            //Set spin jump variable
            stompstyle = 1

            //Play spin jump sound
            audio_play_sound(snd_tailspin,0,0)

            //Stop horizontal movement
            hspeed = 0

            //Move up
            vspeed = -3

            //Create cloud
            with instance_create(round(x-24),round(y+32),obj_cloud) num = count+1

        }

    }

    //Handle swooper Mario flapping
    if global.powerup = cs_swooper
    and holding = 0
    and vspeed >= 4
    and keyboard_check(vk_shift)
    {

        //Fly
        powerupfly = 1

        //Move up
        vspeed = -2.8

        //Enable variable jumping
        jumpnow = 1

        //Sound effect
        audio_play_sound(snd_swooper,0,0)

    }

    //Handle super crown Mario's floating and double jumping
    if global.powerup = cs_crown
    {

        //Double jump
        if doublejump = 0
        and jumpnow != 1
        and (keyboard_check_pressed(vk_shift)
        and keyboard_check(vk_up))
        {

            //Double jump
            doublejump = 1

            //Move up
            vspeed = -3.85

            //Enable variable jumping
            jumpnow = 1

            //Play the jump sound
            audio_play_sound(snd_jump,0,0)

            //Make wall jump effects
            audio_play_sound(snd_stomp,0,0)
            instance_create(x,y+32,obj_spinthump)

        }

        //Floating
        if powerupfly < 128
        and vspeed >= 0
        and holding = 0
        and (keyboard_check(vk_shift))
        {
            vspeed = 0
            gravity = 0
            powerupfly++
        }
        else if vspeed < 0
            powerupfly = 0

    }

}

//Stop floating
else
    isfloating = 0

//If carrot or bee Mario is floating, but the sound is not playing
if isfloating = 1
and floatnow = 0
{

    //Mark that the sound is playing
    floatnow = 1

    //Loop the sound
    audio_play_sound(snd_tailspin,0,1)

}

//If carrot or bee Mario is not floating, but the sound is playing
else if isfloating = 0
and floatnow = 1
{

    //Mark that the sound is not playing
    floatnow = 0

    //Stop the sound
    audio_stop_sound(snd_tailspin)

}


