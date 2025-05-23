///scr_musicalscale(killer,enemy,playsound)

/*
**  Usage:
**      scr_musicalscale(killer,enemy,playsound)
**
**  Given:
**      killer      Object that is doing the killing
**      enemy       The enemy getting killed
**      playsound   Whether sounds will play
**
**  Purpose:
**      Creates the appropriate amount of points based on the variable hitpoint.
*/
var scoreobject = instance_create(round((argument1.bbox_left+argument1.bbox_right)/2-8),round(argument1.y),obj_score_new)
switch argument0.hitpoint
{

    //200 Points
    case 0:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(2)
        break

    //400 Points
    case 1:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(3)
        break

    //800 Points
    case 2:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(4)
        break

    //2000 Points
    case 3:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(5)
        break

    //2000 Points
    case 4:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(6)
        break

    //4000 Points
    case 5:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(7)
        break

    //8000 Points
    case 6:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(8)
        break

    //1up
    default:
        if argument2 audio_play_sound(snd_stomp,0,0)
            with scoreobject event_user(9)

}
argument0.hitpoint++
