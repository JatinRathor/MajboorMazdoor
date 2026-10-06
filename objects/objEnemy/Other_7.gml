if (sprite_index == attackSprite)
{
    enemyState = ENEMYSTATE.IDLE;
    with (_attack_object) instance_destroy();
    _attack_object = noone    
}