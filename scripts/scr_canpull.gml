///scr_canpull()

/*
**  Usage:
**      scr_canpull()
**
**  Returns:
**      Whether or not Mario is able to start pulling on a Subcon item.
*/
if (instance_exists(obj_playerparent)
&& keyboard_check_pressed(vk_control)
&& obj_playerparent.holding == 0
&& obj_playerparent.isduck == 0
&& obj_playerparent.state < 2
&& obj_playerparent.disablecontrols == 0)
    return true;
else
    return false;
