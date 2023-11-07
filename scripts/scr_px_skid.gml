//scr_px_skid()
/*
**  El índice de sprite de los personajes cuando derrapan
*/
switch (global.player) {

    //Mario
    case(0): {
        return spr_px_mario_skid
    } break;
    
    //Luigi
    case(2): {
        return spr_px_luigi_skid
    } break;
    
    //Peach
    case(3): {
        return spr_px_peach_skid
    } break;
    
    //Toad
    case(4): {
        return spr_px_toad_skid
    } break;
    
    //Toadette
    case(5): {
        return spr_px_toadette_skid
    } break;
    
    //Predeterminado
    default: {
        return spr_px_mario_skid
    }
}
