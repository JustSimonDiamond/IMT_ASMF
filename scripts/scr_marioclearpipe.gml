///scr_marioclearpipe()

/*
**  Usage:
**      scr_marioclearpipo()
**
**  Returns:
**      The sprite_index of Mario's clear pipe sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_pipe
    case cs_big: return spr_mario_big_pipe
    case cs_fire: return spr_mario_fire_pipe
    case cs_leaf: return spr_mario_leaf_pipe
    case cs_tanooki: return spr_mario_tanooki_pipe
    case cs_boomerang: return spr_mario_boomerang_pipe
    case cs_ice: return spr_mario_ice_pipe
    case cs_propeller: return spr_mario_propeller_pipe
    case cs_penguin: return spr_mario_penguin_pipe
    case cs_super: return spr_mario_super_pipe
    case cs_cat: return spr_mario_cat_pipe
    default: return 0
    
}
