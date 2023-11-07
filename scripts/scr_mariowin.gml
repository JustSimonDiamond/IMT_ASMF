///scr_mariowin()

/*
**  Usage:
**      scr_mariowin()
**
**  Returns:
**      The sprite_index of Mario's winning sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_win
    case cs_big: return spr_mario_big_win
    case cs_fire: return spr_mario_fire_win
    case cs_leaf: return spr_mario_leaf_win
    case cs_tanooki: return spr_mario_tanooki_win
    case cs_ice: return spr_mario_ice_win
    case cs_super: return spr_mario_super_win
    case cs_penguin: return spr_mario_penguin_warp
    case cs_propeller: return spr_mario_propeller_win
    case cs_boomerang: return spr_mario_boomerang_win
    default: return 0
}