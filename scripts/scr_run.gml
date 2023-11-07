///scr_run()
/*
**  El sprite del jugador cuando corre
*/
switch (global.player) {
    case(0): return scr_mariorun()
    case(1): return scr_luigirun()
}
