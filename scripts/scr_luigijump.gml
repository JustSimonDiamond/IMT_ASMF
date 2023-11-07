///scr_luigijump()

/*
**  Usage:
**      scr_luigijump()
**
**  Returns:
**      The sprite_index of Mario's jumping sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_luigi_small_jump
    case cs_big: return spr_luigi_big_jump
    case cs_fire: return spr_mario_fire_jump
    case cs_leaf: return spr_mario_leaf_jump
    case cs_tanooki: return spr_mario_tanooki_jump
    case cs_ice: return spr_mario_ice_jump
    case cs_super: return spr_mario_super_jump
    case cs_bee: return spr_mario_bee_jump
    case cs_penguin: return spr_mario_penguin_jump
    case cs_propeller: return spr_mario_propeller_jump
    case cs_boomerang: return spr_mario_boomerang_jump
    case cs_squirrel: return spr_mario_squirrel_jump
    case cs_pyre: return spr_mario_pyre_jump
    case cs_goldtan: return spr_mario_goldtan_jump
    default: return 0
}