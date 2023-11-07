///scr_player_behaviour_climb()
//
//  El jugador cuando está trepando al estido SMB2
//

//If Mario's controls are not disabled
if disablecontrols = 0
{

    //Handle moving left
    if keyboard_check(vk_left)
    and not keyboard_check(vk_right)
    {
        hspeed = -1
        direct = -1
    }

    //Handle moving right
    else if keyboard_check(vk_right)
    and not keyboard_check(vk_left)
    {
        hspeed = 1
        direct = 1
    }

    //Stop horizontal movement
    else
        hspeed = 0

    //Handle moving up
    if keyboard_check(vk_up)
    and not keyboard_check(vk_down)
        vspeed = -1

    //Handle moving down
    else if keyboard_check(vk_down)
    and not keyboard_check(vk_up)
        vspeed = 1

    //Stop vertical movement
    else
        vspeed = 0

    //Handle jumping off of a climbable surface
    if keyboard_check_pressed(vk_shift)
    {

        //Jump
        vspeed = -3.75

        //Play the jump sound
        audio_play_sound(snd_jump,0,0)

        //Enable variable jumping
        jumpnow = 1

        //Switch to the jump state
        state = 2

    }

}

//Stop moving
else
    speed = 0

//If Mario is no longer on a climbable surface, or reaches the floor
if not place_meeting(x,y,obj_climb)
or collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_solidtop,0,0)
or collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_slopeparent,1,0)
{

    //Switch to the jump state
    state = 0

    //Disable variable jumping
    jumpnow = 0

}

//Smack the net to kill Net Koopas
if keyboard_check_pressed(vk_control)
and place_meeting(x,y,obj_climb_net)
{

    //The kill variable that Net Koopas check for
    netsmack = 1

    //Disable the kill variable after a short time
    alarm[4] = 2

    //The sound of Mario smacking the net
    audio_play_sound(snd_bump,0,0)

}
