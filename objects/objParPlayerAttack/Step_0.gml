if instance_exists(owner)
{
     x = owner.x;
     y = owner.y;
     z = owner.z;   
     image_xscale = owner.image_xscale;   
}


if place_meeting_3d(x,y,z,objEnemy)
{
    var _other = instance_place(x, y + z, objEnemy);
    with (_other) 
    {   if (canHurt == true)
        {   
            objGameMusic.playSFX(sfxHurt); 
            show_debug_message("Enemy Hurt");
            zSpd =  -6;
            xSpd =  -sign( other.x - x) * 4;
            time_source_start(hurtTimmer);
            hp -= 1;
            canHurt = false;
            enemyState = ENEMYSTATE.HURT;
            flashTimer = flashMaxTime;
        }    
    }
    
}

if instance_exists(objPlayer) && objGameProgression.batAbilitySwitch && (objPlayer.playerState == PLAYERSTATE.BASE_ATTACK) && place_meeting_3d(x,y,z,objEnemyBoss)
{
        var _other = instance_place(x, y, objEnemyBoss);
        show_debug_message("Boss Bat Break");
        objGameProgression.batAbilitySwitch = false;
        instance_create_depth(objPlayer.x,objPlayer.y,objPlayer.depth,objCutsceneBatBrake);
}
