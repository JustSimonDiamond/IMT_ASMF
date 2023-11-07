///scr_mariohold()

/*
**  Usage:
**      scr_mariohold()
**
**  Returns:
**      The sprite_index of Mario's holding sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_leaf: return spr_mario_leaf_hold_jump
    case cs_tanooki: return spr_mario_tanooki_hold_jump
}
