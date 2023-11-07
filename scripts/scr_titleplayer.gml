///scr_marioidle()

/*
**  Usage:
**      scr_titleplayer()
**
**  Returns:
**      El sprite del personaje en la pantalla del titulo
*/
switch global.player
{
 case (0): return spr_mario_big_idle;
 case (1): return spr_luigi_big_idle;
}