///scr_marioclimb()

/*
**  Usage:
**      scr_marioclimb()
**
**  Returns:
**      The sprite_index of Mario's climbing sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_climb
    case cs_big: return spr_mario_big_climb
    case cs_fire: return spr_mario_fire_climb
    case cs_hammer: return spr_mario_hammer_climb
    case cs_leaf: return spr_mario_leaf_climb
    case cs_tanooki: return spr_mario_tanooki_climb
    case cs_frog: return spr_mario_frog_climb
    case cs_bomb: return spr_mario_bomb_climb
    case cs_ice: return spr_mario_ice_climb
    case cs_super: return spr_mario_super_climb
    case cs_carrot: return spr_mario_carrot_climb
    case cs_ninja: return spr_mario_ninja_climb
    case cs_bee: return spr_mario_bee_climb
    case cs_shell: return spr_mario_shell_climb
    case cs_penguin: return spr_mario_penguin_climb
    case cs_propeller: return spr_mario_propeller_climb
    case cs_boomerang: return spr_mario_boomerang_climb
    case cs_walljump: return spr_mario_walljump_climb
    case cs_squirrel: return spr_mario_squirrel_climb
    case cs_cloud: return spr_mario_cloud_climb
    case cs_rock: return spr_mario_rock_climb
    case cs_pyre: return spr_mario_pyre_climb
    case cs_swooper: return spr_mario_swooper_climb
    case cs_karate: return spr_mario_karate_climb
    case cs_crown: return spr_mario_crown_climb
    case cs_goldtan: return spr_mario_goldtan_climb
    case cs_cat: return spr_mario_cat_climb
}
