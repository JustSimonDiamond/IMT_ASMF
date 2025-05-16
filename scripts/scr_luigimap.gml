///scr_luigimap()

/*
**  Usage:
**      scr_luigimap()
**
**  Returns:
**      The sprite_index of Mario's map screen sprite based on the current powerup.
*/
switch global.powerup
{
 case cs_big: return spr_mapluigi_big
 default: return spr_404
}
