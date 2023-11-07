///scr_luigispin()

/*
**  Usage:
**      scr_luigispin()
**
**  Returns:
**      The sprite_index of Mario's spin sprite based on the current powerup.
*/
switch global.powerup
{
    case cs_small: return spr_luigi_small_spin
    case cs_big: return spr_mario_big_spin
    case cs_fire: return spr_mario_fire_spin
    case cs_hammer: return spr_mario_hammer_warp
    case cs_leaf: return spr_mario_leaf_spin
    case cs_tanooki: return spr_mario_tanooki_spin
    case cs_frog: return spr_mario_frog_warp
    case cs_bomb: return spr_mario_bomb_warp
    case cs_ice: return spr_mario_ice_spin
    case cs_super: return spr_mario_super_spin
    case cs_carrot: return spr_mario_carrot_warp
    case cs_ninja: return spr_mario_ninja_warp
    case cs_bee: return spr_mario_bee_warp
    case cs_shell: return spr_mario_shell_warp
    case cs_penguin: return spr_mario_penguin_warp
    case cs_propeller: return spr_mario_propeller_fly
    case cs_boomerang: return spr_mario_boomerang_spin
    case cs_walljump: return spr_mario_walljump_warp
    case cs_squirrel: return spr_mario_squirrel_warp
    case cs_cloud: return spr_mario_cloud_warp
    case cs_rock: return spr_mario_rock_warp
    case cs_pyre: return spr_mario_pyre_warp
    case cs_swooper: return spr_mario_swooper_warp
    case cs_karate: return spr_mario_karate_warp
    case cs_crown: return spr_mario_crown_warp
    case cs_goldtan: return spr_mario_goldtan_spin
}