///scr_luigiidle()

/*
**  Usage:
**      scr_luigiidle()
**
**  Returns:
**      The sprite_index of Mario's idle sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_luigi_small_idle
    case cs_big: return spr_luigi_big_idle
    case cs_fire: return spr_mario_fire_idle
    case cs_leaf: return spr_mario_leaf_idle
    case cs_tanooki: return spr_mario_tanooki_idle
    case cs_ice: return spr_mario_ice_idle
    case cs_super: return spr_mario_super_idle
    case cs_bee: return spr_mario_bee_idle
    case cs_penguin: return spr_mario_penguin_idle
    case cs_propeller: return spr_mario_propeller_idle
    case cs_boomerang: return spr_mario_boomerang_idle
    case cs_squirrel: return spr_mario_squirrel_idle
    case cs_pyre: return spr_mario_pyre_walk
    case cs_goldtan: return spr_mario_goldtan_idle
    default: return 0
}
