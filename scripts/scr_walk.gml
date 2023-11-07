///scr_walk()
/*
**  El sprite del jugador cuando camina
*/
switch (global.player) {
    case(0): return scr_mariowalk()
    case(1): return scr_luigiwalk()
}
