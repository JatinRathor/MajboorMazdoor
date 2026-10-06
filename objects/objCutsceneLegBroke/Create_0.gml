move_till_x = x+80;
actor_obj = noone;
z = 0;

phase = 0;

//Comic Stuff
draw_comic = -1;
fadeInAlpha = 0;
fadeInAlphaBG=0;






automation_setup = function(){
        
    if instance_exists(actor_obj)
    {
        
        switch (phase) { 
            
            case 0: with(actor_obj){
                       xSpd = 0;
                       ySpd = 0;
                       zSpd = 0; 
                       max_jump = 1; 
                    }
                    objGameProgression.doubleJumpAbilitySwitch = false;
                    if (actor_obj.x < move_till_x) {actor_obj.xSpd = 3} else {phase = 1} 
                    break;
            
            case 1:  
                    with actor_obj setSprite(sprPlayerfall);
                    actor_obj.xSpd +=3;
                    var _phase3Method = function(){phase = 3}
                    call_later(1, time_source_units_seconds, _phase3Method, false);
                    phase = 2;
                    
    
                    break;  
            case 2: actor_obj.xSpd = lerp(actor_obj.xSpd,0,0.04)
                    break;

            case 3: actor_obj.xSpd = 0;
                    phase = 4;
                    break;

            case 4: draw_comic = 0;
                    objGameMusic.playSFX(sfxShithappens);
                    var _timmerCallback = function(){phase = 7}
                    call_later(1, time_source_units_seconds, _timmerCallback, false);    
                    phase = 6;
                    break;

            case 5: break;

            case 7: if InputPressed(INPUT_VERB.ACCEPT) && (fadeInAlpha >= 1.5) {draw_comic = 1 phase = 8; fadeInAlpha=0} break;
            case 8: if InputPressed(INPUT_VERB.ACCEPT) && (fadeInAlpha >= 1.5) {draw_comic = -1 phase = 9;} break;
            case 9: 
                   
                    actor_obj.playerState = PLAYERSTATE.IDLE;
                    instance_destroy();
                    break;
            
        }

    }
}