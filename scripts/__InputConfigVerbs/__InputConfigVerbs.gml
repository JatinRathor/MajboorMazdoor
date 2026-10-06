function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        UP,
        DOWN,
        LEFT,
        RIGHT,
        ACCEPT,
        CANCEL,
        ACTION,
        SPECIAL,
        PAUSE,
        JUMP
    }
    

    
    InputDefineVerb(INPUT_VERB.UP,      "up",         [vk_up,    "W"],    [-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN,    "down",       [vk_down,  "S"],    [ gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT,    "left",       [vk_left,  "A"],    [-gp_axislh, gp_padl]);
    InputDefineVerb(INPUT_VERB.RIGHT,   "right",      [vk_right, "D"],    [ gp_axislh, gp_padr]);
    InputDefineVerb(INPUT_VERB.JUMP,    "jump",         vk_space,            gp_face1);
    
    InputDefineVerb(INPUT_VERB.ACTION,  "action",       mb_left,            gp_face3);
    InputDefineVerb(INPUT_VERB.SPECIAL, "special",      mb_right,            gp_face4);
    InputDefineVerb(INPUT_VERB.PAUSE,    "pause",       [vk_escape, vk_enter],                gp_start);
    InputDefineVerb(INPUT_VERB.CANCEL,   "cancel",     vk_escape,               gp_face2);
    InputDefineVerb(INPUT_VERB.ACCEPT,  "accept",       vk_space,                gp_face1);
}
