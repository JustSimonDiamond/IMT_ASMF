///scr_luigiduck()

/*
**  Usage:
**      scr_luigiduck()
**
**  Returns:
**      The sprite_index of Mario's ducking sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_luigi_small_duck
    case cs_big: return spr_mario_big_duck
    case cs_fire: return spr_mario_fire_duck
    case cs_hammer: return spr_mario_hammer_duck
    case cs_leaf: return spr_mario_leaf_duck
    case cs_tanooki: return spr_mario_tanooki_duck
    case cs_bomb: return spr_mario_bomb_duck
    case cs_ice: return spr_mario_ice_duck
    case cs_super: return spr_mario_super_duck
    case cs_carrot: return spr_mario_carrot_duck
    case cs_ninja: return spr_mario_ninja_duck
    case cs_bee: return spr_mario_bee_duck
    case cs_shell: return spr_mario_shell_duck
    case cs_penguin: return spr_mario_penguin_duck
    case cs_propeller: return spr_mario_propeller_duck
    case cs_boomerang: return spr_mario_boomerang_duck
    case cs_walljump: return spr_mario_walljump_duck
    case cs_squirrel: return spr_mario_squirrel_duck
    case cs_cloud: return spr_mario_cloud_duck
    case cs_rock: return spr_mario_rock_duck
    case cs_pyre: return spr_mario_pyre_duck
    case cs_swooper: return spr_mario_swooper_duck
    case cs_karate: return spr_mario_karate_duck
    case cs_crown: return spr_px_peach_duck
    case cs_goldtan: return spr_mario_goldtan_duck
}
