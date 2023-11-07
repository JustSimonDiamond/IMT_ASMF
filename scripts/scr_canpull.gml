///scr_canpull()

/*
**  Usage:
**      scr_canpull()
**
**  Returns:
**      Whether or not Mario is able to start pulling on a Subcon item.
*/
if instance_exists(obj_playerparent)
and keyboard_check_pressed(vk_control)
and obj_playerparent.holding = 0
and obj_playerparent.isduck = 0
and obj_playerparent.state < 2
and obj_playerparent.disablecontrols = 0
    return true
else
    return false