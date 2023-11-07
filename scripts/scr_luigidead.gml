///scr_luigidead()

/*
**  Usage:
**      scr_luigidead()
**
**  Returns:
**      The sprite_index of Mario's death sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_dead
    case cs_big: return spr_mario_big_dead
    case cs_fire: return spr_mario_fire_dead
    case cs_leaf: return spr_mario_leaf_dead
    case cs_tanooki: return spr_mario_tanooki_dead
    case cs_boomerang: return spr_mario_boomerang_dead
    case cs_propeller: return spr_mario_propeller_dead
    case cs_ice: return spr_mario_ice_dead
    case cs_super: return spr_mario_super_dead
    case cs_goldtan: return spr_mario_goldtan_dead
}
