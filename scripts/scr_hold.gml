///scr_hold()
/*
**  El sprite del jugador cuando tiene algo
*/
switch (global.player) {
    case(0): return scr_mariohold()
    case(1): return scr_luigihold()
}
