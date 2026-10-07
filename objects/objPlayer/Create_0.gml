
moveSpeed = 3;       
acceleration   = 0.2;      
     
xSpd = 0;           
zSpd = 0;
ySpd = 0;  
surferMode = false;
grav = 0.025;   
jumpForce = -6;
jump_counter = 0;
if (objGameProgression.doubleJumpAbilitySwitch) max_jump = 2 else max_jump = 1;
isGrounded = true;
automation_object = noone;
z = 0;
floorZ = 0;
height = 22;

shadow = instance_create_layer(x,y,"Instances",objShadow);
shadow.owner = self;
_attack_object = noone;


hurtMethod = function(){
    
    xSpd = 0;
    if (objGameUI.playerHp <= 0) {
    playerState = PLAYERSTATE.DEAD 
    objGameUI.alarm[0] = 40;
    objGameMusic.playSFX(sfxShithappens);
    exit}
    if (!GAMEPAUSED) {
    playerState = PLAYERSTATE.IDLE }
    else {playerState = PLAYERSTATE.PAUSE;}
    

}

hurtTimmer = time_source_create(time_source_game, 1, time_source_units_seconds, hurtMethod)

hurtRegister = function(_other){
            SHAKE_MAGNITUDE = 10;
            zSpd =  -4;
            xSpd = -sign(_other.x - x) * 4;
            time_source_start(hurtTimmer);
            with (objGameUI) playerHp -= 1;
            playerState = PLAYERSTATE.HURT;

}

playerMovement = function(){

    
    var _x_direction  = InputCheck(INPUT_VERB.RIGHT)- InputCheck(INPUT_VERB.LEFT)
    var _y_direction  = InputCheck(INPUT_VERB.DOWN) -InputCheck(INPUT_VERB.UP)
    
    var _jump_pressed = InputPressed(INPUT_VERB.JUMP)
    
    if !surferMode 
    {xSpd =  lerp(xSpd,_x_direction*moveSpeed,acceleration);} else {xSpd =  lerp(xSpd,1*moveSpeed*1.5,acceleration);}   
    ySpd =  lerp(ySpd,_y_direction*(moveSpeed*0.8),acceleration);
    if (_jump_pressed) && (jump_counter<max_jump)
    {   
        objGameMusic.playSFX(sfxJump);
        jump_counter++ 
        zSpd =   1 * jumpForce;
    }
    
    if (xSpd != 0) image_xscale = sign(xSpd)

    if (y<140) &&   (sign(_y_direction) == -1) ySpd = 0;
    if (y>298+5) && (sign(_y_direction) == 1) ySpd = 0;

    
  
    

}

playerMovementProcess = function(){


    //if (!isGrounded) zSpd = 0;
    
    
    zSpd = lerp(zSpd,10,grav);
    
    if (z+zSpd > floorZ) 
    {
        zSpd = 0;
        z = floorZ;
        jump_counter = 0;    
        if (playerState == PLAYERSTATE.JUMP) playerState = PLAYERSTATE.IDLE
    }
    


    
}

collisionProcess = function(){



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
        if (playerState == PLAYERSTATE.JUMP) {
            jump_counter = 0;
            playerState = PLAYERSTATE.MOVING;
        }
    
    }

}



collisionWithOther = function() {

    
    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objParDangerObstacle)
    {
        var _is_moving_fast = (xSpd >= moveSpeed * 0.8) || (xSpd <= -moveSpeed * 0.8)
        
        if (playerState != PLAYERSTATE.HURT) && (playerState != PLAYERSTATE.JUMP)&& _is_moving_fast
        {
        
            var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objParDangerObstacle);
            hurtRegister(_other)

        }
    
    }
    
      if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objParPushableObstacle)
    {       
            show_debug_message("Colliding with Object")
            var _other = instance_place(x+sign(xSpd), y+sign(ySpd), objParPushableObstacle);
            if (InputPressed(INPUT_VERB.ACTION))
            {
                with (_other)
                {   show_debug_message("Pushed Object")
                    xSpd = -sign(other.x - x) * 4;
                }
            }
      
    
    }

    
    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objParEnemyAttack)
    {
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objParEnemyAttack);
        if (playerState != PLAYERSTATE.HURT) && (playerState != PLAYERSTATE.DEAD) && instance_exists(_other)
        {
            hurtRegister(_other)
            
        }
    
    }

    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z ,objTrapArea)
    {
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objTrapArea);
        if (playerState != PLAYERSTATE.HURT) && instance_exists(_other) && (z == floorZ) && (playerState != PLAYERSTATE.AUTOMATED)
        {
            hurtRegister(_other)
            
        }
    
    }

    
    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objGrill) 
    {
       
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objGrill);
        if (playerState != PLAYERSTATE.AUTOMATED) && (playerState == PLAYERSTATE.JUMP) && (zSpd > 1)
        {

             show_debug_message("Automated")
            _other.actor_obj = self;
            automation_object = _other;
            playerState = PLAYERSTATE.AUTOMATED;
            xSpd = 0;
            ySpd = 0;
            zSpd = 0;  
            
        }
    
    }

    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objNextRoomDoors) 
    {
       
           show_debug_message("Moving to next room")
           with(objGameProgression) {
                GameProgress();
                JumpToNextPlayArea();
            }
            
       
    
    }




    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objCutscenePar) 
    {
       
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objCutscenePar);
        if (playerState != PLAYERSTATE.AUTOMATED)
        {
             show_debug_message("Automated heart")
            _other.actor_obj = self;
            automation_object = _other;
            playerState = PLAYERSTATE.AUTOMATED;
            
        }
    
    }

    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objBegger) 
    {
       
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objBegger);
        if (InputPressed(INPUT_VERB.ACTION)) && instance_exists(objFallingHeart) && (objFallingHeart.picked)
        {
            show_debug_message("Begger heart");
            _other.heartReceived  = true;
            playerState = PLAYERSTATE.PAUSE;
            
        }
    
    }

    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objFallingHeart) 
    {
       
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objFallingHeart);
        if (InputPressed(INPUT_VERB.ACTION) && (_other.picked == false))
        {    objGameMusic.playSFX(sfxHeartPick);   
             show_debug_message("Picked Heart")
            _other.picked = true;
            
        }
    
    }
    
    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objPoop) 
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

    
    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objSmallCardBoardBox) 
    {
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objSmallCardBoardBox);
           show_debug_message("Cardboard Box")
           with(_other) {
                if (sprite_index!=bgItem_8) && (sprite_index!=bgItem_1)
                {
                  sprite_index = choose(bgItem_8,bgItem_1);
                  image_xscale = -sign(other.x-x)
                }
            }
            
       
    }

    if place_meeting_3d(x+sign(xSpd),y+sign(ySpd),z,objCone) 
    {
        var _other = instance_place(x+sign(xSpd), y+sign(ySpd) + z, objCone);
           show_debug_message("Cone")
           with(_other) {
                if (sprite_index!=bgItem_16)
                {
                  sprite_index = bgItem_16
                  image_xscale = -sign(other.x-x)
                }
            }
            
       
    
    }

        



}


playerState = PLAYERSTATE.IDLE;


