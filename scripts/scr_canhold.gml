///scr_canhold()

/*
**  Usage:
**      scr_canhold()
**
**  Returns:
**      Whether or not Mario is able to hold an SMB3 item.
*/
if (instance_exists(obj_playerparent)
&& keyboard_check(vk_control)
&& obj_playerparent.holding == 0
&& obj_playerparent.isduck == 0
&& obj_playerparent.state < 3
&& obj_playerparent.stompstyle == 0
&& obj_playerparent.disablecontrols == 0)
    return true;
else
    return false;
