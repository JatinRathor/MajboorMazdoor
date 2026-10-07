move_till_x = bbox_right-10;
actor_obj = noone;
z = 0;

phase = 0;

//Comic Stuff
draw_comic = false;
fadeInAlpha = 0;
draw_comic_frame = 0;





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
                    if (actor_obj.x < move_till_x) {actor_obj.xSpd = 3}  else {phase = 1; objGameMusic.playSFX(sfxShithappens);}  
                    break;
            
            case 1: draw_comic = true;
                    
                    if InputPressed(INPUT_VERB.ACCEPT) && (fadeInAlpha>1.5)  {phase = 2 } 
                    break;
           


            case 2:   cutsceneBar(false);
                      game_pause(false);
                      instance_destroy();
                      break;
            
        }

    }
}