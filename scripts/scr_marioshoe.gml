///scr_marioslide()

/*
**  Usage:
**      scr_marioshoe()
**
**  Returns:
**      The sprite_index of Mario in the Kurimbo shoe based on the current powerup
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_slide
    case cs_big: return spr_mario_big_shoe
    case cs_fire: return spr_mario_fire_shoe
    case cs_leaf: return spr_mario_leaf_shoe
    case cs_tanooki: return spr_mario_tanooki_shoe
    case cs_ice: return spr_mario_ice_shoe
    case cs_super: return spr_mario_super_shoe
    case cs_penguin: return spr_mario_penguin_shoe
    case cs_propeller: return spr_mario_propeller_shoe
    case cs_boomerang: return spr_mario_boomerang_shoe
    case cs_goldtan: return spr_mario_goldtan_shoe
    default: return 0
}
