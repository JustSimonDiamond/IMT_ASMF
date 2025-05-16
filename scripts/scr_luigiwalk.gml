///scr_luigiwalk()

/*
**  Usage:
**      scr_luigiwalk()
**
**  Returns:
**      The sprite_index of Mario's walking sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_luigi_small_walk
    case cs_big: return spr_luigi_big_walk
    case cs_fire: return spr_mario_fire_walk
    case cs_leaf: return spr_mario_leaf_walk
    case cs_tanooki: return spr_mario_tanooki_walk
    case cs_ice: return spr_mario_ice_walk
    case cs_super: return spr_mario_super_walk
    case cs_bee: return spr_mario_bee_walk
    case cs_penguin: return spr_mario_penguin_walk
    case cs_propeller: return spr_mario_propeller_walk
    case cs_boomerang: return spr_mario_boomerang_walk
    case cs_squirrel: return spr_mario_squirrel_walk
    case cs_pyre: return spr_mario_pyre_walk
    case cs_goldtan: return spr_mario_goldtan_walk
    default: return 0
}
