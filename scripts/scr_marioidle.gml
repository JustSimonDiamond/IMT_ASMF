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
    case cs_small: return spr_mario_small_idle
    case cs_big: return spr_mario_big_idle
    case cs_fire: return spr_mario_fire_idle
    case cs_hammer: return spr_mario_hammer_idle
    case cs_leaf: return spr_mario_leaf_idle
    case cs_tanooki: return spr_mario_tanooki_idle
    case cs_frog: return spr_mario_frog_walk
    case cs_bomb: return spr_mario_bomb_walk
    case cs_ice: return spr_mario_ice_idle
    case cs_super: return spr_mario_super_idle
    case cs_carrot: return spr_mario_carrot_walk
    case cs_ninja: return spr_mario_ninja_walk
    case cs_bee: return spr_mario_bee_idle
    case cs_shell: return spr_mario_shell_walk
    case cs_penguin: return spr_mario_penguin_idle
    case cs_propeller: return spr_mario_propeller_idle
    case cs_boomerang: return spr_mario_boomerang_idle
    case cs_walljump: return spr_mario_walljump_walk
    case cs_squirrel: return spr_mario_squirrel_idle
    case cs_cloud: return spr_mario_cloud_walk
    case cs_rock: return spr_mario_rock_walk
    case cs_pyre: return spr_mario_pyre_idle
    case cs_swooper: return spr_mario_swooper_walk
    case cs_karate: return spr_mario_karate_walk
    case cs_crown: return spr_px_peach_idle
    case cs_goldtan: return spr_mario_goldtan_idle
    case cs_cat: return spr_mario_cat_idle
}
