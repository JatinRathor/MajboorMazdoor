
end_x = x+220+30;


actor_obj = noone;
z = 0;




automation_setup = function(){
        
        if instance_exists(actor_obj)
        {
            actor_obj.sprite_index = sprPlayerJump;
            actor_obj.zSpd = 0;
            actor_obj.ySpd = 0;

            if (actor_obj.x<end_x+10) {
                      //var _x_direction  = InputCheck(INPUT_VERB.RIGHT)- InputCheck(INPUT_VERB.LEFT);
                      //actor_obj.xSpd =  lerp(actor_obj.xSpd,_x_direction*actor_obj.moveSpeed,actor_obj.acceleration) 
                      actor_obj.x += 4;  
                      actor_obj.y = y+10;
                      actor_obj.z = 0;  
            }
            
            if (actor_obj.x>=end_x) {
                actor_obj.zSpd = -4;
                actor_obj.xSpd = 4;
                actor_obj.playerState = PLAYERSTATE.JUMP;
                }

        }
    

}