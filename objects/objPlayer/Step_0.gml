
depth = -bbox_bottom + z*2;



switch (playerState) {

    case PLAYERSTATE.IDLE: 
    
    if !surferMode sprite_index = sprPlayer else sprite_index = sprPlayerDash;

    playerMovement(); 
    var _x_direction  = InputCheck(INPUT_VERB.RIGHT)- InputCheck(INPUT_VERB.LEFT)
    var _y_direction  = InputCheck(INPUT_VERB.DOWN) -InputCheck(INPUT_VERB.UP)
    if (_x_direction != 0) || (_y_direction != 0)  playerState = PLAYERSTATE.MOVING;
    if (zSpd!=0) playerState = PLAYERSTATE.JUMP;
    if InputCheck(INPUT_VERB.ACTION) playerState = PLAYERSTATE.BASE_ATTACK;
    
 
    collisionWithOther();
    collisionProcess();
    
    

    
    
                        
    break;

    case PLAYERSTATE.MOVING:
    if !surferMode sprite_index = sprPlayerMoving else sprite_index = sprPlayerDash;


    playerMovement();  
    playerMovementProcess();
    var _x_direction  = InputCheck(INPUT_VERB.RIGHT)- InputCheck(INPUT_VERB.LEFT)
    var _y_direction  = InputCheck(INPUT_VERB.DOWN) -InputCheck(INPUT_VERB.UP)
    if (_x_direction == 0) && (_y_direction == 0) playerState = PLAYERSTATE.IDLE;
    if (zSpd!=0) playerState = PLAYERSTATE.JUMP;

    if InputCheck(INPUT_VERB.ACTION) playerState = PLAYERSTATE.BASE_ATTACK;
    

    collisionWithOther();
    collisionProcess();
    


                        
    break;

    case PLAYERSTATE.BASE_ATTACK:

    if (!objGameProgression.batAbilitySwitch)  
    {  
        if (sprite_index != sprPlayerAttackSkateBoard)
        {       objGameMusic.playSFX(sfxSwing); 
                xSpd = 0;
                ySpd = 0;
                setSprite(sprPlayerAttackSkateBoard,0,1); 
                PlayerAttackCreate(sprPlayerAttackSkateBoardMask);
        }
    } 
     else {
     if (sprite_index != sprPlayerAttackBat)
    {       objGameMusic.playSFX(sfxSwing);   
            xSpd = 0;
            ySpd = 0;
            setSprite(sprPlayerAttackBat,0,1); 
            PlayerAttackCreate(sprPlayerAttackBatMask);
    }   
     }
    playerMovementProcess();
    collisionProcess();
    collisionWithOther();

                        
    break;

    
    case PLAYERSTATE.JUMP:
      sprite_index = sprPlayerJump;
  
      playerMovement();  
      playerMovementProcess();
      collisionProcess();
      collisionWithOther();
  
      
      if InputCheck(INPUT_VERB.ACTION) playerState = PLAYERSTATE.BASE_ATTACK;
     
                
    break;
    
    

    case PLAYERSTATE.HURT:

      if sprite_index != sprPlayerHurt
      {
            sprite_index = sprPlayerHurt;
            objGameMusic.playSFX(sfxHurt);   
        }
      xSpd =  lerp(xSpd,0,0.08);
      ySpd =  lerp(ySpd,0,acceleration); 
      playerMovementProcess();  
      collisionProcess();
      
     
                
    break;

    case PLAYERSTATE.PAUSE:
    xSpd = 0;
    ySpd = 0;
    zSpd = 0;
    playerMovementProcess();
    collisionProcess();
      
     
                
    break;

    case PLAYERSTATE.AUTOMATED:

    if instance_exists(automation_object)
    {
        automation_object.automation_setup();
    }
    //playerMovementProcess();

    if place_meeting(x+sign(xSpd),y+sign(ySpd) + z,objPoop) 
    {
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objPoop);
           show_debug_message("Poopy")
           with(_other) {
                if (sprite_index!=sprSmeer)
                {
                  sprite_index = sprSmeer;
                  image_xscale = -sign(other.x-x)
                }
            }
            
       
    
    }
     
                
    break;
    

}




//move_and_collide(xSpd,ySpd,objSolid)

x+=xSpd;
y+=ySpd;
z += zSpd;


