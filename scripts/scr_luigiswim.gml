///scr_luigiswim()

/*
**  Usage:
**      scr_luigiswim()
**
**  Returns:
**      The sprite_index of Mario's swimming sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_mario_small_swim
    case cs_big: return spr_mario_big_swim
    case cs_fire: return spr_mario_fire_swim
    case cs_hammer: return spr_mario_hammer_swim
    case cs_leaf: return spr_mario_leaf_swim
    case cs_tanooki: return spr_mario_tanooki_swim
    case cs_frog: return spr_mario_frog_swim
    case cs_bomb: return spr_mario_bomb_swim
    case cs_ice: return spr_mario_ice_swim
    case cs_super: return spr_mario_super_swim
    case cs_carrot: return spr_mario_carrot_swim
    case cs_ninja: return spr_mario_ninja_swim
    case cs_bee: return spr_mario_bee_swim
    case cs_shell: return spr_mario_shell_swim
    case cs_penguin: return spr_mario_penguin_swim
    case cs_propeller: return spr_mario_propeller_swim
    case cs_boomerang: return spr_mario_boomerang_swim
    case cs_walljump: return spr_mario_walljump_swim
    case cs_squirrel: return spr_mario_squirrel_swim
    case cs_cloud: return spr_mario_cloud_swim
    case cs_rock: return spr_mario_rock_swim
    case cs_pyre: return spr_mario_pyre_swim
    case cs_swooper: return spr_mario_swooper_swim
    case cs_karate: return spr_mario_karate_swim
    case cs_crown: return spr_mario_crown_swim
    case cs_goldtan: return spr_mario_goldtan_swim
}
