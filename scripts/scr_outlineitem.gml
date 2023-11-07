///scr_outlineitem()

/*
**  Usage:
**      sprite_index = scr_outlineitem()
**
**  Returns:
**      The sprite_index of the inventory powerup when is not selected
*/
switch argument0
{
    case cs_big: return spr_big_outline
    case cs_fire: return spr_fire_outline
    case cs_leaf: return spr_leaf_outline
    case cs_tanooki: return spr_tanooki_outline
    case cs_ice: return spr_ice_outline
    case cs_super: return spr_super_outline
    case cs_propeller: return spr_propeller_outline
    case cs_boomerang: return spr_boomerang_outline
    case cs_hammer: return spr_hammer_outline
    case cs_penguin: return spr_penguin_outline
    case cs_squirrel: return spr_acorn_outline
    case cs_bee: return spr_bee_outline
    case cs_pyre: return spr_pyre_outline
    case cs_eyes: return spr_eyes_outline
    case cs_cat: return spr_superbell_outline
    default: return spr_404
}
