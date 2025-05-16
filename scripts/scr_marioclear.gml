///scr_marioidle()

/*
**  Usage:
**      scr_marioidle()
**
**  Returns:
**      The sprite_index of Mario's idle sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_clear
    case cs_big: return spr_mario_big_clear
}
