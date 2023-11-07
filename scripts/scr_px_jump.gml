//scr_px_jump()
/*
**  El índice de sprite de los personajes cuando saltan
*/
switch (global.player) {

    //Mario
    case(0): {
        return spr_px_mario_jump
    } break;
    
    //Luigi
    case(2): {
        return spr_px_luigi_jump
    } break;
    
    //Peach
    case(3): {
        return spr_px_peach_jump
    } break;
    
    //Toad
    case(4): {
        return spr_px_toad_jump
    } break;
    
    //Toadette
    case(5): {
        return spr_px_toadette_jump
    } break;
    
    //Predeterminado
    default: {
        return spr_px_mario_jump
    }
}
