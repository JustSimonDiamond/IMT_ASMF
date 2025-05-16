//scr_px_walk()
/*
**  El indice de sprite del jugador cuando está caminando
*/
switch (global.player) {

    //Mario
    case(0): {
        return spr_px_mario_walk
    } break;
    
    //Luigi
    case(2): {
        return spr_px_luigi_walk
    } break;
    
    //Peach
    case(3): {
        return spr_px_peach_walk
    } break;
    
    //Toad
    case(4): {
        return spr_px_toad_walk
    } break;
    
    //Toadette
    case(5): {
        return spr_px_toadette_walk
    } break;
    
    //Predeterminado
    default: {
        return spr_px_mario_walk
    }
}
