move_till_x = bbox_right-10;
actor_obj = noone;
z = 0;

phase = 0;

//Comic Stuff
draw_comic = false;
fadeInAlpha = 0;






automation_setup = function(){
        
    if instance_exists(actor_obj)
    {
        
        switch (phase) { 
            
            case 0: with(actor_obj){
                       xSpd = 0;
                       ySpd = 0;
                       zSpd = 0;  
                    }
                    cutsceneBar();
                    
                    with actor_obj {setSprite(sprPlayer)}
                    if (actor_obj.x < move_till_x) {actor_obj.xSpd = 3}  else {phase = 1} 
                    break;
            
            case 1:  var _fallMethod = function(){phase = 3 with(objPot) instance_destroy();}
                    call_later(0.8, time_source_units_seconds, _fallMethod, false);
                    with(objPot) {fall = true;}
                    phase = 2; 
    
                    break;  
            case 2:
                    
                    break;

            case 3: with actor_obj {setSprite(sprPlayerfall)}
                    phase = 5;
                    SHAKE_MAGNITUDE = 1;
                   
                    break;

            case 5:    
                    
                    if instance_exists(objPlayer)
                    var _heart = instance_create_layer(objPlayer.x+5,objPlayer.y-22,"Instances",objFallingHeart);
                    
                    with(objGameUI)
                    {
                        maxPlayerHP -= 1;
                        playerHp = maxPlayerHP;  
                    }
                    var _phase6Method = function(){phase = 6}
                    call_later(2, time_source_units_seconds, _phase6Method, false);
                    phase = 4;  
                    
                    break;

             case 6:draw_comic = true;
                    objGameMusic.playSFX(sfxShithappens);
                    var _timmerCallback = function(){phase = 8}
                    var _handle = call_later(2, time_source_units_seconds, _timmerCallback, false);
    
                    phase = 7;
                    break;

            case 7: break;

            case 8: if InputPressed(INPUT_VERB.ACCEPT) && (fadeInAlpha>1.5)  {phase = 9} break;

            case 9: 
                      cutsceneBar(false);
                      actor_obj.playerState = PLAYERSTATE.IDLE;
                      instance_destroy();
                      break;
            
        }

    }
}