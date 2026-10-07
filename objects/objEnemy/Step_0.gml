depth = -bbox_bottom + z*2;


 if (hp<= 0) {
    if (enemyState != ENEMYSTATE.DEAD)
    {   
        alarm[0] = 8;
        enemyState = ENEMYSTATE.DEAD;
    }
    
}
switch (enemyState) {

    case ENEMYSTATE.IDLE: setSprite(baseSprite); 
                          xSpd =  lerp(xSpd,0,0.01);
                          ySpd =  lerp(ySpd,0,0.01);  
                          if instance_exists( objPlayer) && (distance_to_object(objPlayer)<100) enemyState = ENEMYSTATE.MOVING;
                          break;  

    case ENEMYSTATE.MOVING: 
                             if instance_exists(objPlayer) 
                            {
                                facing = sign(x-objPlayer.x);
                                var _dir = point_direction(x,y,objPlayer.x,objPlayer.y)
                                xSpd = lengthdir_x(moveSpeed,_dir);
                                ySpd = lengthdir_y(moveSpeed,_dir);
                        
                                if instance_exists(objPlayer) facing = sign(x-objPlayer.x);
                                
                        		squasheight = lerp(squasheight,sin(current_time/1000 * 12)*0.05,0.05)
                                
                            
                                if (distance_to_object(objPlayer)<25) && canAttack
                                {
                                        xSpd = 0;
                                        ySpd = 0;    
                                        enemyState = ENEMYSTATE.ATTACK;
                                        time_source_start(attackTimmer);
                                        canAttack = false;
                                }
                            }
                            break;

    case ENEMYSTATE.ATTACK: if (sprite_index != attackSprite)
                            {
                                    setSprite(attackSprite,0,1); 
                                    _attack_object = instance_create_depth(x,y,depth,objParEnemyAttack)
                                    _attack_object.visible = false;
                                    _attack_object.sprite_index = attackSpriteMask;
                                    _attack_object.mask_index = attackSpriteMask;
                                    _attack_object.owner = self;
                                    _attack_object.image_xscale = facing*1;
                                    _attack_object.image_yscale = image_yscale;
                            }

                           break;

    
    case ENEMYSTATE.HURT:  xSpd =  lerp(xSpd,0,0.1);
                           ySpd =  lerp(ySpd,0,0.1);    
                           with(_attack_object) instance_destroy(); 
                           break;   

    case ENEMYSTATE.DEAD:  xSpd =  lerp(xSpd,0,0.1);
                           ySpd =  lerp(ySpd,0,0.1);    
                           with(_attack_object) instance_destroy(); 
                           break;   


    case ENEMYSTATE.PAUSE: xSpd =  0;
                           ySpd =  0;    
                           break;   
	
	
}


if place_meeting_3d(x+xSpd,y,z,objSolid)
{
    while(!place_meeting_3d(x+sign(xSpd),y,z,objSolid)) x += sign(xSpd)*1;
    xSpd = 0;
}
if place_meeting_3d(x,y+ySpd,z,objSolid)
{
    while(!place_meeting_3d(x,y+sign(ySpd),z,objSolid)) y += sign(ySpd)*1;
    ySpd = 0;
}
if place_meeting_3d(x,y,z+zSpd,objSolid)
{
    while(!place_meeting_3d(x,y,z+sign(zSpd),objSolid)) z += sign(zSpd)*1;
    zSpd = 0;
}

if (y<105) && (sign(ySpd) == -1) ySpd = 0;
if (y>216+5) && (sign(ySpd) == 1) ySpd = 0;
//if (!isGrounded) zSpd = 0;


if (zSpd<10) zSpd +=  1;   

if (z+zSpd > floorZ) 
{
    zSpd = 0;
    z = floorZ;
}

x+=xSpd;
y+=ySpd;
z += zSpd;
