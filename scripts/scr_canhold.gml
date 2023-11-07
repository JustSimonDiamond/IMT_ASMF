///scr_canhold()

/*
**  Usage:
**      scr_canhold()
**
**  Returns:
**      Whether or not Mario is able to hold an SMB3 item.
*/
if instance_exists(obj_playerparent)
and keyboard_check(vk_control)
and obj_playerparent.holding = 0
and obj_playerparent.isduck = 0
and obj_playerparent.state < 3
and obj_playerparent.stompstyle = 0
and obj_playerparent.disablecontrols = 0
    return true
else
    return false
