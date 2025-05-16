///scr_ride()
/*
**  El sprite del jugador cuando monta en yoshi
*/
switch (global.player) {
    case(0): return scr_marioride()
    case(1): return scr_luigiride()
}
