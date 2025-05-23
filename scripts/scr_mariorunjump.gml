///scr_mariorunjump()

/*
**  Usage:
**      scr_mariorunjump()
**
**  Returns:
**      The sprite_index of Mario's running jump sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_jump
    case cs_big: return spr_mario_big_runjump
    case cs_fire: return spr_mario_fire_jump
    case cs_hammer: return spr_mario_hammer_runjump
    case cs_leaf: return spr_mario_leaf_runjump
    case cs_tanooki: return spr_mario_tanooki_runjump
    case cs_frog: return spr_mario_frog_jump
    case cs_bomb: return spr_mario_bomb_runjump
    case cs_ice: return spr_mario_ice_jump
    case cs_super: return spr_mario_super_jump
    case cs_carrot: return spr_mario_carrot_runjump
    case cs_ninja: return spr_mario_ninja_runjump
    case cs_bee: return spr_mario_bee_jump
    case cs_shell: return spr_mario_shell_runjump
    case cs_penguin: return spr_mario_penguin_jump
    case cs_propeller: return spr_mario_propeller_jump
    case cs_boomerang: return spr_mario_boomerang_jump
    case cs_walljump: return spr_mario_walljump_runjump
    case cs_squirrel: return spr_mario_squirrel_runjump
    case cs_cloud: return spr_mario_cloud_runjump
    case cs_rock: return spr_mario_rock_runjump
    case cs_pyre: return spr_mario_pyre_runjump
    case cs_swooper: return spr_mario_swooper_runjump
    case cs_karate: return spr_mario_karate_runjump
    case cs_crown: return spr_px_peach_jump
    case cs_goldtan: return spr_mario_goldtan_runjump
    case cs_cat: return spr_mario_cat_jump
}
