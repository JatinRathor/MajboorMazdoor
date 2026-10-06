enum PLAYERSTATE{
    IDLE,
    MOVING,
    DASHING,
    BASE_ATTACK,
    JUMP,
    AUTOMATED,
    HURT,
    DASH,
    PAUSE
    
}

function PlayerAttackCreate(_attack_mask_sprite){
        
    var _attack_object = instance_create_depth(x,y,depth,objParPlayerAttack)
    _attack_object.visible = true;
    _attack_object.owner = objPlayer;
    _attack_object.height = sprite_get_height(_attack_mask_sprite)
    _attack_object.sprite_index = _attack_mask_sprite;
    _attack_object.mask_index = _attack_mask_sprite;
    _attack_object.image_xscale = image_xscale;
    _attack_object.image_yscale = image_yscale;
    
}

